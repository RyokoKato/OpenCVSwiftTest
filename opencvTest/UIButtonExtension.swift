//
//  UIButtonExtension.swift
//  opencvTest
//
//  Created by RyokoKato on 2018/07/20.
//  Copyright © 2018年 加藤涼子. All rights reserved.
//

import Foundation

class CustomButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setData()
    }
    
    override required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setData()
    }
    
    func setData() {
        self.backgroundColor = UIColor.lightGray
        self.layer.cornerRadius = self.frame.size.height / 4.0
    }
}
