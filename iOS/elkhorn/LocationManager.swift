//
//  LocationManager.swift
//  elkhorn
//
//  Created by Tomi Lahtinen on 03/08/16.
//  Copyright © 2016 Tomi Lahtinen. All rights reserved.
//

import Foundation
import CoreLocation


class LocationManager: NSObject, CLLocationManagerDelegate {

    static let sharedInstance = LocationManager()
    let manager = CLLocationManager()
    var currentlocation: CLLocation?
    
    override init() {
        super.init()
        manager.delegate = self
        manager.requestWhenInUseAuthorization()
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.startUpdatingLocation()
        debugPrint("Location manager inited")
    }
    
    // MARK: -- CLLocationManagerDelegate
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        debugPrint("location updated")
        if let location = locations.first {
            currentlocation = location
        }
    }
    
    func locationManagerDidResumeLocationUpdates(manager: CLLocationManager) {
        
    }
    
    func locationManagerDidPauseLocationUpdates(manager: CLLocationManager) {
        
    }
}