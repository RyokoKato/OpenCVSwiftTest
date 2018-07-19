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
    let openCV = OpenCVWrapper()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
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

