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
    @IBOutlet weak var processImageButton: CustomButton!
    @IBOutlet weak var resetButton: CustomButton!
    @IBOutlet weak var changeImageButton: CustomButton!
    
    let openCV = OpenCVWrapper()
    var imgCounter: Int = 0
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imgCounter = 0
        self.settingForView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func processImageButtonDidTouch(_ sender: Any) {
        let img: UIImage! = sourceImageView.image
        
        // image processing
        let grayscaleImg = openCV.convertImageGrayScale(img)
        let detectedEdgeImg = openCV.detectEdge(img)
        
        grayScaleImageView.image = grayscaleImg
        detectedEdgeImageView.image = detectedEdgeImg
    }
    
    // TODO: implement transition to modal view
    @IBAction func changeImageButtonDidTouch(_ sender: Any) {
        self.imgCounter += 1
        self.sourceImageView.image = UIImage(named: "IMG\(String(format: "%03d", self.imgCounter))")
    }
    
    @IBAction func resetButtonDidTouch(_ sender: Any) {
        resetImage()
    }    
}

// TODO: write buttons setting using UIButton Extension(I think I wrote...)
extension EdgeDetectionViewController {
    fileprivate func settingForView() -> Void {
        self.processImageButton.setButtonStyle(buttonStyle: .processButton)
        self.changeImageButton.setButtonStyle(buttonStyle: .processButton)
        self.resetButton.setButtonStyle(buttonStyle: .resetButton)
    }
    
    fileprivate func resetImage() -> Void {
        self.sourceImageView.image = UIImage(named: "IMG\(String(format: "%03d", self.imgCounter))")
        self.grayScaleImageView.image = nil
        self.detectedEdgeImageView.image = nil
    }
}
