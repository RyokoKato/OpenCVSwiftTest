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

    @IBAction func pushMeButtonDidTouch(_ sender: Any) {
        let img: UIImage! = sourceImageView.image
        
        // image processing
        let grayscaleImg = openCV.convertImageGrayScale(img)
        let detectedEdgeImg = openCV.detectEdge(img)
        
        grayScaleImageView.image = grayscaleImg
        detectedEdgeImageView.image = detectedEdgeImg
    }
    private func opencvTest(){
        
    }
}

extension EdgeDetectionViewController {
    func settingForView() -> Void {
        self.processImageButton.layer.cornerRadius = self.processImageButton.bounds.height / 2.0
    }
}