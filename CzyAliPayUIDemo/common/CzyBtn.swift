//
//  CzyBtn.swift
//  CzyAliPayUIDemo
//
//  Created by macOfEthan on 17/6/13.
//  Copyright © 2017年 macOfEthan. All rights reserved.
//

import UIKit

class CzyBtn: UIButton {

    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        self.imageView?.contentMode = .center
        self.titleLabel?.textColor = UIColor.red
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.imageView?.frame = CGRect.init(x: 0, y: 0, width: self.bounds.size.width, height: self.frame.size.height * 2 / 3)
        self.titleLabel?.frame = CGRect.init(x: 0, y: self.bounds.size.height * 2 / 3, width: self.frame.size.width, height: self.frame.size.height)
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
