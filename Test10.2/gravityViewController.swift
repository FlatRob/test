//
//  gravityViewController.swift
//  Test10.2
//
//  Created by roberto lupi on 22/11/16.
//  Copyright © 2016 roberto lupi. All rights reserved.
//

import UIKit

class gravityViewController: UIViewController, UICollisionBehaviorDelegate {
    
    let myImage = UIImageView()
    let gravity = UIGravityBehavior()
    var animator = UIDynamicAnimator()
    var collision = UICollisionBehavior()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        myImage.frame.size = CGSize(width: 150, height: 150)
        myImage.backgroundColor = UIColor.red
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        myImage.center = CGPoint(x: view.bounds.midX, y: view.bounds.minY + 75)
        
        view.addSubview(myImage)
        
        
        
       
        
        // add barrier
        let barrier = UIView(frame: CGRect(x: 0, y: 450, width: 130, height: 20))
        barrier.backgroundColor = UIColor.red
        view.addSubview(barrier)
        
        // add gravity to the image
        animator = UIDynamicAnimator(referenceView: view)
        gravity.addItem(myImage)
        
        animator.addBehavior(gravity)

        // add collision
         collision = UICollisionBehavior(items: [myImage])
        collision.collisionDelegate = self
        
        collision.addBoundary(withIdentifier: "barrier" as NSCopying, for: UIBezierPath(rect: barrier.frame))
        collision.translatesReferenceBoundsIntoBoundary = true
        animator.addBehavior(collision)
        
        collision.action = {
            // print("\(NSStringFromCGAffineTransform(self.myImage.transform)) \(NSStringFromCGPoint(self.myImage.center))")
        }
        
        let itemBehaviour = UIDynamicItemBehavior(items: [myImage])
        itemBehaviour.elasticity = 1
        itemBehaviour.density = 0.1
        itemBehaviour.allowsRotation = true
        itemBehaviour.angularResistance = 0
        animator.addBehavior(itemBehaviour)
    }
    
    func collisionBehavior(_ behavior: UICollisionBehavior, beganContactFor item: UIDynamicItem, withBoundaryIdentifier identifier: NSCopying?, at p: CGPoint) {
        
         print("Boundary contact occurred - \(identifier)")
        guard identifier != nil else {
            
            myImage.backgroundColor = UIColor.purple
            return
        }
        myImage.backgroundColor = UIColor.green
    }
    func collisionBehavior(_ behavior: UICollisionBehavior, beganContactFor item1: UIDynamicItem, with item2: UIDynamicItem, at p: CGPoint) {
        print("test")
    }
}
