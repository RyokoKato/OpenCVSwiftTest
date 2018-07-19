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
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "EdgeDetection") else {
            print("** cannot move to another screen")
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
