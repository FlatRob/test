//
//  ViewController2.swift
//  Test10.2
//
//  Created by roberto lupi on 19/10/16.
//  Copyright © 2016 roberto lupi. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {
    
    var myDelegate : myProtocol?
    
    @IBOutlet var chatPartnerLabel: UILabel!
    
    
    var user: (firstName : String, lastName : String, controlView : Bool)? {
        didSet {
            
            if (self.user?.controlView)! {
            
            print(user!)
            chatPartnerLabel.text = user?.firstName
            }
            
        }
       
    }
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
               
       user?.controlView = true

        // Do any additional setup after loading the view.
        
     //

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func viewDidDisappear(_ animated: Bool) {
       // super.viewDidDisappear(animated)
        
        myDelegate?.dataVc2(name: "test data from Vc2")
        
        print("ho chiuso la view")

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


protocol myProtocol {
    func dataVc2(name : String)
}
