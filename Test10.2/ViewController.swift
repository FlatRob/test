//
//  ViewController.swift
//  Test10.2
//
//  Created by roberto lupi on 18/10/16.
//  Copyright © 2016 roberto lupi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, myProtocol {
    
    @IBOutlet var buttonBar: UIBarButtonItem!
    @IBOutlet var myText: UITextField!
    @IBOutlet var myNavigationBar: UINavigationItem!
    @IBOutlet var myLabel: UILabel!
    
    
    @IBOutlet var myScroll: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
      print("foobar")
        
        
        
        
        
        
    }
    
    
    
    
    @IBOutlet var myBut: UIButton!
    
    @IBOutlet var myImageView: UIImageView!
    
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        var xCoord = myScroll.bounds.minX
        var yCoord = myScroll.bounds.midY
        let buttonWidth  = 30.0 as CGFloat
        let buttonHeight  = 100.0 as CGFloat
        let buffer = 3 as CGFloat
        
        for i in 0...40 {
            
            var aButton = UIButton(type: .custom)
           // aButton.setImage(UIImage(named: "Hello"), for: .normal)
            aButton.frame = CGRect(x: xCoord  , y: yCoord, width: buttonWidth, height: buttonHeight)
         //   aButton.frame = CGRect(x: xCoord, y: yCoord, width: buttonWidth, height: buttonHeight)
            aButton.tintColor = UIColor.red
            aButton.backgroundColor = UIColor.blue
            aButton.tag = i
            aButton.setTitle("\(i)", for: .normal)
            aButton.addTarget(self, action: #selector(scrollButAction(sender:)), for: .touchUpInside)
            var aLabel = UILabel(frame: CGRect(x: xCoord,y: 40, width: buttonWidth, height: 24))
            aLabel.text = "\(i)"
            aLabel.textColor = UIColor.red
            aLabel.adjustsFontSizeToFitWidth = true
            aLabel.font = UIFont.init(name: "HelveticaNeue-Light", size: 14)
            myScroll.addSubview(aButton)
            myScroll.addSubview(aLabel)
            
            xCoord += buttonWidth + buffer
            
        }
        
        myScroll.scrollRectToVisible(CGRect(x: xCoord  , y: yCoord, width: buttonWidth - 10, height: buttonHeight - 20), animated: true)
        
        myScroll.contentSize = CGSize(width: xCoord, height: myScroll.bounds.height)
        
        
    }
    
    func scrollButAction(sender: UIButton) {
        switch sender.tag {
            
        case 0:
            
            print("Hello #0")
            
        case 1:
            
            print("Hello #1")
            
        case 2:
            
            print("Hello #2")
            
        case 3:
            
            print("Hello #3")
            
        case 4:
            
            
            print("Hello #4")
            
        default:
            
            print("default")
            
        }
    }
    
    
  
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func dataVc2(name: String) {
        title = name
        
        print(name)
    }
    @IBAction func ButtonVc2(_ sender: UIBarButtonItem) {
        
        performSegue(withIdentifier: "Vc2", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "Vc2"{
            
            let Vc2 = segue.destination as? ViewController2
            Vc2?.myDelegate = self
            
            Vc2?.user = (firstName : "Roberto", lastName : "Marco",controlView : false)
    }
        
       
    }
    
   
}
