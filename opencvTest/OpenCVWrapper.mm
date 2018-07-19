//
//  OpenCVWrapper.mm
//  opencvTest
//
//  Created by 加藤涼子 on 2018/07/11.
//  Copyright © 2018年 加藤涼子. All rights reserved.
//
#import <opencv2/opencv.hpp>
#import <opencv2/videoio/cap_ios.h>
#import <opencv2/imgcodecs/ios.h>

#import "OpenCVWrapper.h"

using namespace cv;
using namespace std;

@interface OpenCVWrapper() <CvVideoCameraDelegate> {
    CvVideoCamera *cvCamera;
}
@end

@implementation OpenCVWrapper
// MARK: private method(?)
// TODO: search how to write private method in Obj-C
- (UIImage*)convertMatToUIImage:(Mat)img {
    Mat src;
    UIImage* dstUIImg;
    cvtColor(img, src, CV_BGR2BGRA);
    dstUIImg = MatToUIImage(src);
    return dstUIImg;
}

- (cv::Mat)convertUIImageToMat:(UIImage*)img {
    Mat src;
    Mat dstMatImg;
    UIImageToMat(img, src);
    cvtColor(src, dstMatImg, CV_BGRA2BGR);
    return dstMatImg;
}

// MARK: publicMethods
- (UIImage*)convertImageGrayScale:(UIImage*)img{
    Mat src;    // source
    Mat dst;    // result
    
    src = [self convertUIImageToMat: img];
    
    // convert source image to gray scale
    cvtColor(src, dst, CV_BGR2GRAY);
    cvtColor(dst, dst, CV_GRAY2BGR);
    
    return [self convertMatToUIImage: dst];
}

- (UIImage*)detectEdge:(UIImage*)img {
    Mat src;    // source
    Mat dst;    // result
    
    src = [self convertUIImageToMat: img];
    
    // BGR -> GrayScale image
    Mat grayImg;
    cvtColor(src, grayImg, CV_BGR2GRAY);
    
    // canny edge detection
    Mat cannyImg;
    double const threshould1 = 50, threshould2 = 200;
    Canny(grayImg, cannyImg, threshould1, threshould2);
    cvtColor(cannyImg, dst, CV_GRAY2BGR);
    
    return [self convertMatToUIImage: dst];
}

// functions for use camera(maybe use someday...)
- (void)createCameraWithParentView:(UIImageView*)parentView {
    cvCamera = [[CvVideoCamera alloc] initWithParentView:parentView];

    cvCamera.defaultAVCaptureDevicePosition = AVCaptureDevicePositionFront;
    cvCamera.defaultAVCaptureSessionPreset = AVCaptureSessionPreset640x480;
    cvCamera.defaultAVCaptureVideoOrientation = AVCaptureVideoOrientationPortrait;
    cvCamera.defaultFPS = 30;
    cvCamera.grayscaleMode = NO;

    cvCamera.delegate = self;
}

- (void)processImage:(cv::Mat &)image {

}

@end
