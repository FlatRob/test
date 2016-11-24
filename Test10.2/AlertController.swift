//
//  AlertController.swift
//  Test10.2
//
//  Created by roberto lupi on 07/11/16.
//  Copyright © 2016 roberto lupi. All rights reserved.
//

import UIKit

class AlertController: UIViewController {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
               // self.navigationBar.frame = CGRect(x:0, y: 20, width: self.view.frame.size.width, height: 64.0)
       // self.navigationBar.setTitleVerticalPositionAdjustment(-30, for: .default)
    }
  
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
        
        
        self.navigationController?.navigationBar.frame = CGRect(x: 0, y: 20, width: self.view.bounds.size.width, height: 100)
        self.navigationController?.navigationBar.barTintColor = UIColor.yellow
        self.title = "My Title"
        self.navigationController?.navigationBar.setTitleVerticalPositionAdjustment(-30, for: .default)
        let button = UIBarButtonItem(title: "myButton", style: .done, target: self, action: #selector(AlertController.dismissMy))
        self.navigationItem.leftBarButtonItem = button
        self.navigationItem.leftBarButtonItem?.setTitlePositionAdjustment(.init(horizontal: 0, vertical: -30), for: .default)
        
          
       myAlert()
    
    }
    @IBOutlet var Back: UIButton!
    @IBAction func BackButton(_ sender: Any) {
        
       // self.dismiss(animated: true, completion: nil)
        _ = self.navigationController?.popToRootViewController(animated: true) //push presentation
        self.dismiss(animated: true, completion: nil) //modal presentation
        
    }
    func dismissMy()  {
        print("ciao")
//        self.dismiss(animated: true, completion: nil)
//        self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
        self.dismiss(animated: true, completion: {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "ViewController")
            self.present(vc!, animated: true, completion: nil)
        })
    }
    
    func myAlert()  {
        
        let myString = UILabel()
        let backColor = [NSBackgroundColorAttributeName: UIColor.red, NSForegroundColorAttributeName: UIColor.red]
        myString.textColor = UIColor.red
        myString.attributedText = NSAttributedString(string: "ciaoooooo!!!", attributes: backColor)

        
        let myA = UIAlertController(title: myString.text, message: "Test message", preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default, handler: {(alert) in
            print("ok Button")
           
            
        })
        let doSome = UIAlertAction(title: "print", style: .default, handler: {(response) in
        print("response")
        })
       // myA.setValue(backColor, forKey: "attributedTitle")
        myA.addAction(ok)
        myA.addAction(doSome)
        
       // myA.view.backgroundColor = UIColor.red
        
        
        
        present(myA, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
