//
//  ViewController.swift
//  opencvTest
//
//  Created by 加藤涼子 on 2018/07/11.
//  Copyright © 2018年 加藤涼子. All rights reserved.
//

import UIKit
import Accelerate
import AssetsLibrary
import AVFoundation
import CoreGraphics
import CoreImage
import CoreMedia
import CoreImage
import CoreMedia
import CoreVideo
import QuartzCore

class EdgeDetectionViewController: UIViewController {
    @IBOutlet weak var sourceImageView: UIImageView!
    @IBOutlet weak var grayScaleImageView: UIImageView!
    @IBOutlet weak var detectedEdgeImageView: UIImageView!
    @IBOutlet weak var processImageButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    
    let openCV = OpenCVWrapper()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.settingForView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func processImageButtonDidTouch(_ sender: Any) {
        let img: UIImage! = sourceImageView.image
        
        // image processing
        let grayscaleImg = openCV.convertImageGrayScale(img)
        let detectedEdgeImg = openCV.detectEdge(img)
        
        grayScaleImageView.image = grayscaleImg
        detectedEdgeImageView.image = detectedEdgeImg
    }
    
    @IBAction func resetButtonDidTouch(_ sender: Any) {
        resetImage()
    }
    
    private func opencvTest(){
        
    }
}

// TODO: write buttons setting using UIButton Extension(I think I wrote...)
extension EdgeDetectionViewController {
    fileprivate func settingForView() -> Void {
        self.processImageButton.layer.cornerRadius = self.processImageButton.bounds.height / 2.0
        self.resetButton.layer.cornerRadius = self.processImageButton.bounds.height / 2.0
    }
    
    fileprivate func resetImage() -> Void {
        self.sourceImageView.image = #imageLiteral(resourceName: "Lenna")
        self.grayScaleImageView.image = nil
        self.detectedEdgeImageView.image = nil
    }
}
