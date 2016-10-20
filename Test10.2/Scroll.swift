//
//  Scroll.swift
//  Test10.2
//
//  Created by roberto lupi on 19/10/16.
//  Copyright © 2016 roberto lupi. All rights reserved.
//

import Foundation
import UIKit

class BarGraph: UIScrollView {
    
    
    var  delegte: BarGraphDatasource! = nil{
        
        didSet{
            self.reloadGraph()
        }
    }
    
    var barWidth : CGFloat = 24 {
        
        didSet{
            self.reloadGraph()
        }
    }
    var minimumSpacing : CGFloat = 10 {
        
        didSet{
            self.reloadGraph()
        }
    }
    
    var numberOfItems : Int = 0 {
        didSet{
            self.reloadGraph()
        }
    }
    var barColor : UIColor = UIColor.lightGray {
        
        didSet{
            self.reloadGraph()
        }
    }
    
    
    
    init() {
        super.init(frame: .zero)
        self.reloadGraph()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    func reloadGraph(){
        self.setContentSizeForGraph()
    }
    
    func setContentSizeForGraph() {
        
        if self.numberOfItems > 0 {
          //  self.contentSize = CGSize((self.barWidth * CGFloat(self.numberOfItems) + self.minimumSpacing), self.frame.height)
            
            self.contentSize = CGSize(width: (self.barWidth * CGFloat(self.numberOfItems) + self.minimumSpacing), height: self.frame.height)
            var xValue:CGFloat = 0
            for i in 1...self.numberOfItems {
                xValue = xValue + CGFloat(CGFloat(i) + self.minimumSpacing)
                print("xValue: \(xValue)")
               // let frame = CGRect(xValue, 0, self.barWidth, 50)
                let frame = CGRect(x: xValue, y: 0, width: self.barWidth, height: 50)
                let barView = UIView(frame: frame)
                barView.backgroundColor = self.barColor
                self.addSubview(barView)
            }
        }
    }
}

protocol BarGraphDatasource{
    func grapgView(grapgView:BarGraph, numberOfItemsInGraph items:Int)->Int
    func grapgView(grapgView: BarGraph, didSelectItemAtIndex index: Int)
}
