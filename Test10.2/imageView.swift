//
//  imageView.swift
//  Test10.2
//
//  Created by roberto lupi on 22/10/16.
//  Copyright © 2016 roberto lupi. All rights reserved.
//

import UIKit

class imageView: UIImageView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    override func draw(_ rect: CGRect) {
        
        let context = UIGraphicsGetCurrentContext()
        context!.setTextDrawingMode(CGTextDrawingMode.stroke)
        
        context?.setLineWidth(2.0)
        context?.setLineJoin(.round)
        
       
        
    }
}
