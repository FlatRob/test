//
//  COreLocationViewController.swift
//  Test10.2
//
//  Created by roberto lupi on 17/11/16.
//  Copyright © 2016 roberto lupi. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class COreLocationViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {

    
    
    
        let locationM = CLLocationManager()
    let map = MKMapView()
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            
            
            // Do any additional setup after loading the view.
            locationM.desiredAccuracy = kCLLocationAccuracyBest
            locationM.delegate = self
            locationM.requestWhenInUseAuthorization()
            locationM.distanceFilter = kCLDistanceFilterNone
            
            map.frame = view.bounds
            map.delegate = self
            view.addSubview(map)
            
        }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        locationM.startUpdatingLocation()
        map.showsUserLocation = true

    }
    
        //MARK: CLLocationManager Delegate methods
        func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
            
        }
        
        func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            
            print("\(manager.location?.coordinate.latitude)")
            print("\(manager.location?.coordinate.longitude)")
        }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        locationM.stopUpdatingLocation()
        map.showsUserLocation = false
    }
        
}
