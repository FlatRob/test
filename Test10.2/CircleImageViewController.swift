//
//  CircleImageViewController.swift
//  Test10.2
//
//  Created by roberto lupi on 17/11/16.
//  Copyright © 2016 roberto lupi. All rights reserved.
//

import UIKit

class CircleImageViewController: UIViewController {
    
    let myView = UIView()
    let myLabel = UILabel()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
           }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
        initialSetting(sizeScreen: view.bounds.size)
        

     
    }
    
     //MARK: - initial setting uiimage and call functions 
    
    func initialSetting(sizeScreen : CGSize)  {
        
        myView.frame.size = CGSize(width: sizeScreen.width / 2 , height: sizeScreen.height / 3)
        myView.center = view.center
        view.addSubview(myView)
        
        //label
        myLabel.text = "One"
        myLabel.frame.size.height = myLabel.intrinsicContentSize.height
        myLabel.frame.size.width = myLabel.intrinsicContentSize.width
        myLabel.center = CGPoint(x: myView.bounds.midX,y: myView.bounds.midY)
        
        myLabel.textAlignment = .center
        myLabel.shadowColor = UIColor.black
        myLabel.shadowOffset = CGSize(width: 0.5, height: 0.5)
        
        
        
        drawBorderLine()
        drawCircle()
        drawInnerCircle()

        
        
    }
    
    func drawInnerCircle()  {
        
       
        
        //circle
        let path = UIBezierPath(arcCenter: CGPoint(x: myView.bounds.midX,y: myView.bounds.midY), radius: 0, startAngle: CGFloat(0 ), endAngle: CGFloat(M_PI * 2.0), clockwise: true)
        let pathEnd = UIBezierPath(arcCenter: CGPoint(x: myView.bounds.midX,y: myView.bounds.midY), radius: 30, startAngle: CGFloat(0 ), endAngle: CGFloat(M_PI * 2.0), clockwise: true)

        
        let shape = CAShapeLayer()
        shape.path = path.cgPath
        shape.fillColor = UIColor.yellow.cgColor
        shape.lineWidth = 2
        shape.lineCap = kCALineCapRound
        //shape.strokeColor = UIColor.black.cgColor
       // shape.strokeEnd = 0
        
        shape.shadowColor = UIColor.darkGray.cgColor
        shape.shadowRadius = 4
        shape.shadowOffset = CGSize(width: 0 , height: 3)
        shape.shadowOpacity = 1
        
        let animation = CABasicAnimation(keyPath: "path")
        animation.duration = 5
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut) // animation curve is Ease Out
        animation.fillMode = kCAFillModeBoth // keep to value after finishing
        animation.isRemovedOnCompletion = false // don't remove after finishing
        animation.fromValue = path.cgPath
        animation.toValue = pathEnd.cgPath
       // shape.strokeEnd = 1
        
        shape.add(animation, forKey: nil)
        
    
        myView.layer.addSublayer(shape)
        
        

        
        myView.addSubview(myLabel)
        
        
        
        
    }
    
    
    
     //MARK: - animazione testo
    @IBAction func animationTextButton(_ sender: Any) {
        
      animationTextFunc()
        myLabel.text = "second"

        myLabel.frame.size.height = myLabel.intrinsicContentSize.height
        myLabel.frame.size.width = myLabel.intrinsicContentSize.width
        myLabel.center = CGPoint(x: myView.bounds.midX,y: myView.bounds.midY)
        
        

    }
    
   

    func animationTextFunc()  {
        
        
        
        let animationText = CATransition()
        animationText.duration = 1
        animationText.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut) // animation curve is Ease Out
       animationText.type = kCATransitionPush
        animationText.subtype = kCATransitionFromTop
     //   animationText.repeatCount = 3
        
        myLabel.layer.add(animationText, forKey: "changeTextTransition")
        
        
       


    }
    
     //MARK: - animazione contorno della view
    
    func drawBorderLine()  {
       
        let path = UIBezierPath(rect: myView.bounds)
        
        let shape = CAShapeLayer()
        shape.path = path.cgPath
        shape.fillColor = UIColor.clear.cgColor
        shape.lineWidth = 2
        shape.lineCap = kCALineCapRound
        shape.strokeColor = UIColor.black.cgColor
        shape.strokeEnd = 0
        
        shape.shadowColor = UIColor.darkGray.cgColor
        shape.shadowRadius = 4
        shape.shadowOffset = CGSize(width: 0 , height: 3)
        shape.shadowOpacity = 1

        
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        
        animation.duration = 5
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut) // animation curve is Ease Out
        animation.fillMode = kCAFillModeBoth // keep to value after finishing
        animation.isRemovedOnCompletion = false // don't remove after finishing
        animation.fromValue = 0
        animation.toValue = 1
        shape.strokeEnd = 1
        
        shape.add(animation, forKey: animation.keyPath)
        
        
        myView.layer.addSublayer(shape)
        
        

        
    }
    
     //MARK: - disegno il cerchio esterno
    
    func drawCircle()  {
        
         //myView.clipsToBounds = true
         // myView.layer.masksToBounds = true

        
        let path = UIBezierPath(arcCenter: CGPoint(x: myView.bounds.midX,y: myView.bounds.midY), radius: (myView.bounds.width / 2) - 16, startAngle: CGFloat(0), endAngle: CGFloat(M_PI * 2 ), clockwise: true)
        
        let radious = (myView.bounds.width / 2) - 16
        let position1 = CGPoint(x: myView.bounds.midX, y: myView.bounds.midY - radious )
        let position2 = CGPoint(x: myView.bounds.midX + (radious / 2), y: myView.bounds.midY - (radious - radious / CGFloat(7)))
        let position3 = CGPoint(x: myView.bounds.midX + (radious / 2) + (radious/2.7), y: myView.bounds.midY - (radious - radious / CGFloat(2)))

        let position4 = CGPoint(x: myView.bounds.midX + radious, y: myView.bounds.midY  )
        let position5 = CGPoint(x: myView.bounds.midX + (radious / 2) + (radious/2.7), y: myView.bounds.midY + (radious - radious / CGFloat(2)))
        let position6 = CGPoint(x: myView.bounds.midX + (radious / 2), y: myView.bounds.midY + (radious - radious / CGFloat(7)))

        let position7 = CGPoint(x: myView.bounds.midX , y: myView.bounds.midY + radious )
        let position8 = CGPoint(x: myView.bounds.midX - (radious / 2), y: myView.bounds.midY + (radious - radious / CGFloat(7)))
        let position9 = CGPoint(x: myView.bounds.midX - (radious / 2) - (radious/2.7), y: myView.bounds.midY + (radious - radious / CGFloat(2)))
        
        let position10 = CGPoint(x: myView.bounds.midX - radious, y: myView.bounds.midY )
        let position11 = CGPoint(x: myView.bounds.midX - (radious / 2) - (radious/2.7), y: myView.bounds.midY - (radious - radious / CGFloat(2)))
        let position12 = CGPoint(x: myView.bounds.midX - (radious / 2), y: myView.bounds.midY - (radious - radious / CGFloat(7)))
        
        let arrayPositions = [position1, position2, position3, position4, position5, position6, position7, position8, position9, position10, position11, position12]
        
        
        let shape = CAShapeLayer()
        shape.path = path.cgPath
        shape.fillColor = UIColor.clear.cgColor
        shape.lineWidth = 30
        shape.lineCap = kCALineCapRound
        shape.strokeColor = UIColor.blue.cgColor
        shape.strokeEnd = 0
        
        shape.shadowColor = UIColor.darkGray.cgColor
        shape.shadowRadius = 4
        shape.shadowOffset = CGSize(width: 0 , height: 3)
        shape.shadowOpacity = 1
        
       

        
        
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.duration = 1
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut) // animation curve is Ease Out
        animation.fillMode = kCAFillModeBoth // keep to value after finishing
        animation.isRemovedOnCompletion = false // don't remove after finishing
        animation.fromValue = 0
        animation.toValue = 1
        shape.strokeEnd = 1
        
        shape.add(animation, forKey: animation.keyPath)
        
      print( shape.position)
        
        myView.layer.addSublayer(shape)
       // let center : CGPoint = CGPoint(x: path.bounds.midX, y: path.bounds.midX)
        
        for (index, element) in arrayPositions.enumerated() {
            
            addLabelToCircle(numero: String(index), position: element)
        }
        
       

        
        
           }
    
    func addLabelToCircle(numero : String, position : CGPoint)  {
        
        let label1 = UILabel()
        label1.text = numero
        label1.textColor = UIColor.white
        label1.frame.size = label1.intrinsicContentSize
        label1.center = position
        
        
        let path = UIBezierPath(arcCenter: label1.center, radius: label1.frame.height / 2, startAngle: 0, endAngle: CGFloat(M_PI * 2), clockwise: true)
        let shape = CAShapeLayer()
        shape.path = path.cgPath
        shape.fillColor = UIColor.black.cgColor
        
        let path1 = UIBezierPath(arcCenter: label1.center, radius: label1.frame.height / 2, startAngle: 0, endAngle: CGFloat(M_PI * 2), clockwise: true)
        let shape1 = CAShapeLayer()
        shape1.path = path1.cgPath
        shape1.fillColor = UIColor.clear.cgColor
        shape1.strokeColor = UIColor.random.cgColor
        shape1.lineCap = kCALineCapRound
        shape1.lineWidth = 2
        shape1.strokeEnd = 0
        
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.duration = 5
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        animation.fillMode = kCAFillModeBoth
        animation.isRemovedOnCompletion = false
        animation.fromValue = 0
        animation.toValue = 1
        shape1.strokeEnd = 1
        
        shape1.add(animation, forKey: nil)
        
        myView.layer.addSublayer(shape)
        myView.addSubview(label1)
        myView.layer.addSublayer(shape1)
        
        
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        print(size)
       // initialSetting(sizeScreen: size)
        super.viewWillTransition(to: size, with: coordinator)
        coordinator.animate(alongsideTransition: nil, completion: {
            _ in
            
            
            UIView.animate(withDuration: 1, animations: { 
                self.myView.center = self.view.center
            })
            
        })
        
    }
    
   }

private extension CGFloat{
    static func random(max : Int) -> CGFloat{
        return CGFloat(arc4random() % UInt32(max))
    }
}

private extension UIColor{
    
    class var random : UIColor {
        
        switch arc4random()%5 {
            
            
        case 0 : return UIColor.green
        case 1 : return UIColor.lightGray
        case 2 : return UIColor.orange
        case 3 : return UIColor.red
        case 4 : return UIColor.purple
        default: return UIColor.darkGray
            
            
            
        }
    }
}
