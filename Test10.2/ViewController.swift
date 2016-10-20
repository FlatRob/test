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
    
    @IBOutlet var myScrollGraph: BarGraph!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
      print("foobar")
        
        myScrollGraph.numberOfItems = 200
        myScrollGraph.barColor = UIColor.orange
        myScrollGraph.minimumSpacing = 3

        
        
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
       myLabel.backgroundColor = UIColor(patternImage: UIImage(named:"bemolle.jpg")!).withAlphaComponent(0.9)
        
        let myView = UIView()
        myView.frame = view.bounds
        myView.backgroundColor = UIColor(patternImage: UIImage(named: "sRUK1.png")!)

        view.insertSubview(myView, at: 0)
        
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
