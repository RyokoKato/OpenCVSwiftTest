//
//  MenuViewController.swift
//  opencvTest
//
//  Created by RyokoKato on 2018/07/19.
//  Copyright © 2018年 加藤涼子. All rights reserved.
//

import Foundation
import UIKit

class MenuViewController : UIViewController {
    @IBOutlet weak var edgeDetectionButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        settingForView()
    }
    
    // Buttons
    @IBAction func touchEdgeDetectionButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "EdgeDetection", bundle: nil)
        guard let vc = storyboard.instantiateInitialViewController() as? EdgeDetectionViewController else {
            print("failed to instantiate initial view controller")
            return
        }
        self.present(vc, animated: true) {
            print("** move to edge detection")
        }
        
    }
    
}

extension MenuViewController {
    func settingForView() -> Void {
        self.edgeDetectionButton.layer.cornerRadius = self.edgeDetectionButton.bounds.height / 2.0
    }
}
