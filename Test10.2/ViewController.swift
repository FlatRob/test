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
    
          @IBAction func inside(_ sender: Any, forEvent event: UIEvent) {
        print("sono qui")

    }
    @IBOutlet var mySegment: UISegmentedControl!
    
    @IBAction func valueChanged(_ sender: UISegmentedControl) {
        
        for (index,element) in mySegment.subviews.enumerated() {
            
            if index != sender.selectedSegmentIndex {
                element.alpha = 1
               
                
            }else {
                
                element.alpha = 0.5
               
            }
        }
    

        _ = mySegment.selectedSegmentIndex
//        let value = sender as! UISegmentedControl
//        print(mySegment.)
        
    }

    
    @IBOutlet var myScroll: UIScrollView!
    
    @IBAction func restStepperValueChanged(_ sender: UIStepper) {
       // numberOfRestLabel.text = Int(sender.value).description
//        restCount = Int(sender.value)*60
//        restRemainingCountdownLabel.text : String(restCount)
        
        
    }
    
    

//
  // let headerJWT = ["alg":"RS256","typ":"JWT"]
    
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //                    let jsonResult = try JSONSerialization.jsonObject(with: urlContent, options: JSONSerialization.ReadingOptions.mutableContainers) as! [String:Any]
        var myJson = [String : Any]()
        myJson["weather"] = [["Test" : 1234, "description" : "Ciao"]]
        
        let weather = myJson["weather"] as! [[String : Any]]
        if let description = weather[0]["description"] as? String {
            
            print(description)
        }
        
       // DataClass().CreateArray()

        let border = CALayer()
        border.backgroundColor = UIColor(red: 241/255, green: 10/255, blue: 9/255, alpha: 1).cgColor
        border.frame = CGRect(x: view.frame.width - 2, y: 0, width: 1, height: view.frame.height)
        view.layer.addSublayer(border)
        
        
        // Do any additional setup after loading the view, typically from a nib.
        
        
        let chatsArray = [[
            "eventBadge" : 1,
            "eventId" : "-KWE39B6Dh7rDzaF-xy4",
            "lastMessage" : "uyfgduihgvifudhviufhvdf",
            "timestamp" : 20,
            "unreadMessage" : 2,
            ], [
                "eventBadge" : 1,
                "eventId" : "-KWWc99ex8f7ksq8TR2U",
                "lastMessage" : "uyfgduihgvifudhviufhvdf",
                "timestamp" : 5,
                "unreadMessage" : 1,
            ], [
                "eventBadge" : 1,
                "eventId" : "-KWE5OYRZnZ5-p3LUotL",
                "lastMessage" : "uyfgduihgvifudhviufhvdf",
                "timestamp" : 10,
                "unreadMessage" : 2,
        ]] as [[String:Any]]
        
        // to get the timestamp value and store it inside an array with order
        let arrayTimeStamp = (chatsArray.flatMap{$0["timestamp"]} as! Array<Int>).sorted(by: >)
        print(arrayTimeStamp) // [20, 10, 5]
        
        //to order an array of dictionaries
        
        let TimeStamp = chatsArray.sorted{$0["timestamp"] as! Int > $1["timestamp"] as! Int }
        
        print(TimeStamp)
        
//        [["eventId": "-KWE39B6Dh7rDzaF-xy4", "lastMessage": "uyfgduihgvifudhviufhvdf", "timestamp": 20, "unreadMessage": 2, "eventBadge": 1],
//         ["eventId": "-KWE5OYRZnZ5-p3LUotL", "lastMessage": "uyfgduihgvifudhviufhvdf", "timestamp": 10, "unreadMessage": 2, "eventBadge": 1],
//         ["eventId": "-KWWc99ex8f7ksq8TR2U", "lastMessage": "uyfgduihgvifudhviufhvdf", "timestamp": 5, "unreadMessage": 1, "eventBadge": 1]]
        
               
           }
    
    
    
    @IBOutlet var myBut: UIButton!
    
    @IBOutlet var myImageView: UIImageView!
    
    func textToImage(drawText: NSString, inImage: UIImage, atPoint:CGPoint)->UIImage{
        
        // Setup the font specific variables
        let textColor: UIColor = UIColor.black
        let textFont: UIFont = UIFont(name: "Helvetica Bold", size: 100)!
        
        //Setup the image context using the passed image.
        UIGraphicsBeginImageContext(inImage.size)
        
        //Setups up the font attributes that will be later used to dictate how the text should be drawn
        let textFontAttributes = [
            NSFontAttributeName: textFont,
            NSForegroundColorAttributeName: textColor,NSBackgroundColorAttributeName : UIColor.white
            ]
        
        //Put the image into a rectangle as large as the original image.
        inImage.draw(in: CGRect(x: 0,y: 0, width: inImage.size.width, height: inImage.size.height))
        
        // Creating a point within the space that is as bit as the image.
        let rect: CGRect = CGRect(x:atPoint.x,y: atPoint.y,width: inImage.size.width, height: inImage.size.height)
        
        //Now Draw the text into an image.
        
        drawText.draw(in: rect, withAttributes: textFontAttributes)
        
        // Create a new image out of the images we have created
        let newImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        // End the context now that we have the image we need
        UIGraphicsEndImageContext()
        
        //And pass it back up to the caller.
        return newImage
    }
    
    
    func ItemButton()  {
        
        print("Ciao")
    }
    
    func MyNumberFormatter()  {
        
        let numero = NumberFormatter()
        numero.numberStyle = .currency
        numero.usesGroupingSeparator = true
        numero.locale = NSLocale.current
        
        let numero1 = numero.string(from: 2500.0)!
        
        print(numero1)

        
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        mySegment.isMomentary = true
        
       

        
//        for (index,element) in mySegment.subviews.enumerated() {
//            
//            if index != mySegment.selectedSegmentIndex {
//                element.tintColor = UIColor.red
//                element.alpha = 0.5
//            }else {
//                
//                element.tintColor = UIColor.red
//                element.alpha = 1
//                
//            }
//        }
        
        mySegment.layer.cornerRadius = 5
        mySegment.layer.borderColor = UIColor.black.cgColor
        mySegment.layer.borderWidth = 1
        mySegment.clipsToBounds = true
        
        
        
        ///
        
        
        myImageView.image = textToImage(drawText: "Miaoooooo", inImage: UIImage(named: "bemolle.jpg")!, atPoint: CGPoint(x: 50, y: 50))
        
        let buttonFrame = CGRect(x: view.center.x, y: view.center.y, width: 50, height: 50)
        
        let effect = UIBlurEffect(style: .dark )
        
        let circleView = UIVisualEffectView(effect: effect)
        circleView.frame = buttonFrame
        circleView.translatesAutoresizingMaskIntoConstraints = false
       // circleView.layer.cornerRadius = buttonFrame.size.height / 2
        circleView.clipsToBounds = true
        self.view.addSubview(circleView)
        
        
        
        
        var xCoord = myScroll.bounds.minX
        let yCoord = myScroll.bounds.midY
        let buttonWidth  = 30.0 as CGFloat
        let buttonHeight  = 100.0 as CGFloat
        let buffer = 3 as CGFloat
        
        for i in 0...40 {
            
            let aButton = UIButton(type: .custom)
           // aButton.setImage(UIImage(named: "Hello"), for: .normal)
            aButton.frame = CGRect(x: xCoord  , y: yCoord, width: buttonWidth, height: buttonHeight)
         //   aButton.frame = CGRect(x: xCoord, y: yCoord, width: buttonWidth, height: buttonHeight)
            aButton.tintColor = UIColor.red
            aButton.backgroundColor = UIColor.blue
            aButton.tag = i
            aButton.setTitle("\(i)", for: .normal)
            aButton.addTarget(self, action: #selector(scrollButAction(sender:)), for: .touchUpInside)
            let aLabel = UILabel(frame: CGRect(x: xCoord,y: 40, width: buttonWidth, height: 24))
            aLabel.text = "\(i)"
            aLabel.textColor = UIColor.red
            aLabel.adjustsFontSizeToFitWidth = true
            aLabel.font = UIFont.init(name: "HelveticaNeue-Light", size: 14)
            myScroll.addSubview(aButton)
            myScroll.addSubview(aLabel)
            
            xCoord += buttonWidth + buffer
            
        }
        
        myScroll.scrollRectToVisible(CGRect(x: xCoord + 10  , y: yCoord, width: buttonWidth - 10, height: buttonHeight - 20), animated: true)
        
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
