//
//  ViewController2.swift
//  Test10.2
//
//  Created by roberto lupi on 19/10/16.
//  Copyright © 2016 roberto lupi. All rights reserved.
//

import UIKit

class ViewController2: UIViewController, UICollectionViewDataSource {
    
    @IBOutlet var myCollection: UICollectionView!
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
    
    var controlColorMark : Bool = false {
        
        willSet{
            if newValue  {
                
                MarckBook.tintColor = UIColor.red
                
                
            }else {
                
                MarckBook.tintColor = UIColor.lightGray
            }
        }
    }
    
    @IBOutlet var MarckBook: UIBarButtonItem!
    
    @IBAction func bookMark(_ sender: UIBarButtonItem) {
        
        if controlColorMark {
            controlColorMark = false
        }else{
            controlColorMark = true
            
        }
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let backButton = UIBarButtonItem(title: "Back", style: UIBarButtonItemStyle.plain, target: self, action: nil)
//        backButton.setTitleTextAttributes([NSFontAttributeName: UIFont(name: "AppleSDGothicNeo-Light", size: 20.0)!, NSForegroundColorAttributeName : UIColor.red], for: UIControlState())
//        navigationItem.backBarButtonItem = backButton
        
        let appearance = UINavigationBar.appearance()
        appearance.isTranslucent = false
        appearance.barTintColor = UIColor(red: 80/255, green: 185/255, blue: 225/255, alpha: 1)
        appearance.titleTextAttributes = [NSFontAttributeName: UIFont(name: "Chalkduster", size: 21)!, NSForegroundColorAttributeName: UIColor.white]
            
            
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
    
    
     //MARK: - collection View data source and delegate
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 100
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell",
//                                                      for: indexPath) as! FlickrPhotoCell
        let cell = myCollection.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionCellCollectionViewCell
        cell.backgroundColor = UIColor.black
        cell.inserDatainCell(name: "Ciao")
        
        // Configure the cell
        return cell
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
