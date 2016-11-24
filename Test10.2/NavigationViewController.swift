//
//  NavigationViewController.swift
//  Test10.2
//
//  Created by roberto lupi on 10/11/16.
//  Copyright © 2016 roberto lupi. All rights reserved.
//

import UIKit

class NavigationViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
