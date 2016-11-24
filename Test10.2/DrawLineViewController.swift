//
//  DrawLineViewController.swift
//  Test10.2
//
//  Created by roberto lupi on 13/11/16.
//  Copyright © 2016 roberto lupi. All rights reserved.
//

import UIKit

class DrawLineViewController: UIViewController {
 
    var tempImageView = UIImageView()
    var tempBaseImage = UIImageView()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.touchesBegan(_:with:)))
        let tap2 = UITapGestureRecognizer(target: self, action: #selector(self.touchesMoved(_:with:)))
        
        tempImageView.addGestureRecognizer(tap)
        tempImageView.addGestureRecognizer(tap2)


    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        tempImageView.frame = view.bounds
        tempBaseImage.frame = view.bounds
        tempBaseImage.backgroundColor = UIColor.clear
        view.addSubview(tempImageView)
        view.addSubview(tempBaseImage)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var lastPoint = CGPoint()
    var swiped = Bool()
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        swiped = false
        tempBaseImage.alpha = 0.7
        print("inizio")
        if let touch = touches.first {
            lastPoint = touch.location(in: self.view)
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        print("finisco")
        swiped = true
        tempBaseImage.alpha = 0.0

        if let touch = touches.first {
            let currentPoint = touch.location(in: view)
            drawLineFrom(fromPoint: lastPoint, toPoint: currentPoint)
            
            lastPoint = currentPoint
        }

    }
    
    func drawLineFrom(fromPoint: CGPoint, toPoint: CGPoint) {
        UIGraphicsBeginImageContextWithOptions(view.bounds.size, false, 0)
        
        tempImageView.image?.draw(in: view.bounds)
        
        let context = UIGraphicsGetCurrentContext()
        
        context?.move(to: fromPoint)
        context?.addLine(to: toPoint)
        
        context?.setLineCap(CGLineCap.round)
       
        context?.setLineWidth(20)
        context?.setStrokeColor(red: 255/255, green: 2/255, blue: 2/255, alpha: 1.0)
        context?.setBlendMode(CGBlendMode.normal)
        context?.strokePath()
        
        tempImageView.image = UIGraphicsGetImageFromCurrentImageContext()
        tempImageView.alpha = 0.7
        UIGraphicsEndImageContext()
    }
    
    func drawBaseLineFrom(fromPoint: CGPoint, toPoint: CGPoint) {
        UIGraphicsBeginImageContextWithOptions(view.bounds.size, false, 0)
        
        var myArr = [CGPoint]()
        myArr.insert(fromPoint, at: 0)
        if myArr.count > 1 {
            myArr.removeLast()
        }
        myArr.insert(toPoint, at: 1)
        
        tempBaseImage.image?.draw(in: view.bounds)
        
        let context = UIGraphicsGetCurrentContext()
        
        if !swiped {
        context?.clear(tempImageView.bounds)
        }
        context?.move(to: myArr[0])
        context?.addLine(to: myArr[1])
        
        context?.setLineCap(CGLineCap.round)
        
        context?.setLineWidth(20)
        context?.setStrokeColor(red: 255/255, green: 222/255, blue: 2/255, alpha: 1.0)
        context?.setBlendMode(CGBlendMode.normal)
        context?.strokePath()
        
        tempBaseImage.image = UIGraphicsGetImageFromCurrentImageContext()
        tempBaseImage.alpha = 0.7
        UIGraphicsEndImageContext()
    }

    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("muovo")

        if let touch = touches.first {
            let currentPoint = touch.location(in: view)
            drawBaseLineFrom(fromPoint: lastPoint, toPoint: currentPoint)
            
          //  lastPoint = currentPoint
        }
    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
