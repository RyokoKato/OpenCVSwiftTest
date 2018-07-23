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
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setData()
    }
    
    func setData() {
        self.backgroundColor = UIColor.gray02
        self.layer.cornerRadius = self.frame.size.height / 4.0
    }
}

extension CustomButton {
    func setButtonStyle(buttonStyle: ButtonStyles){
        switch buttonStyle {
        case .resetButton:
            self.backgroundColor = UIColor.red02
            self.setTitleColor(UIColor.white, for: .normal)
        case .processButton:
            self.backgroundColor = UIColor.gray01
            self.setTitleColor(UIColor.gray03, for: .normal)
        }
    }
}
