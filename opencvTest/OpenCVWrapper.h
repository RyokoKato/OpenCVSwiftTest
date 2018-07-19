//
//  OpenCVWrapper.h
//  opencvTest
//
//  Created by 加藤涼子 on 2018/07/11.
//  Copyright © 2018年 加藤涼子. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface OpenCVWrapper : NSObject
- (UIImage*)convertImageGrayScale:(UIImage*)img;
- (UIImage*)detectEdge:(UIImage*)img;
- (void)start;
- (void)createCameraWithParentView:(UIImageView*)parentView;
@end
