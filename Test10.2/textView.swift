//
//  textView.swift
//  Test10.2
//
//  Created by roberto lupi on 24/10/16.
//  Copyright © 2016 roberto lupi. All rights reserved.
//

import UIKit
@IBDesignable
class textView: UITextView {

    
        @IBInspectable var borderColor: UIColor = UIColor.white {
            didSet {
                layer.borderColor = borderColor.cgColor
            }
        }
        
        
        @IBInspectable var borderWidth: CGFloat = 1.0 {
            didSet {
                layer.borderWidth = borderWidth
            }
        }
        
        @IBInspectable var cornurRadius: CGFloat = 1.0 {
            didSet {
                layer.cornerRadius = cornurRadius
                clipsToBounds = true
            }
        }
        
        //MARK: Initializers
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        
        setup()
        configure()
    }
    
//        override init(frame : CGRect) {
//            super.init(frame : frame)
//            setup()
//            configure()
//        }
    
        convenience init() {
            self.init(frame: .zero)
            setup()
            configure()
        }
        
        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
            setup()
            configure()
        }
        
        
        override func awakeFromNib() {
            super.awakeFromNib()
            setup()
            configure()
        }
        
        override func prepareForInterfaceBuilder() {
            super.prepareForInterfaceBuilder()
            setup()
            configure()
        }
        
        func setup() {
            layer.borderColor = UIColor.white.cgColor
            layer.borderWidth = 1.0
            layer.cornerRadius = 1.0
        }
        
        func configure() {
            layer.borderColor = borderColor.cgColor
            layer.borderWidth = borderWidth
            layer.cornerRadius = cornurRadius
        }
        
        override func layoutSubviews() {
            super.layoutSubviews()
        }
        
    
}
