//
//  Warning.swift
//  elkhorn
//
//  Created by Tomi Lahtinen on 03/08/16.
//  Copyright © 2016 Tomi Lahtinen. All rights reserved.
//

import Foundation
import Gloss
import CoreLocation

struct Warning: Decodable {
    
    let latitude: Double
    let longitude: Double
    
    init(location: CLLocation){
        self.latitude = location.coordinate.latitude
        self.longitude = location.coordinate.longitude
    }
    
    init?(json: JSON) {
        guard let latitude: Double = "latitude" <~~ json else {
            return nil
        }
        self.latitude = latitude
        
        guard let longitude: Double = "longitude" <~~ json else {
            return nil
        }
        self.longitude = longitude
    }
    
    var location: CLLocation {
        return CLLocation(latitude: self.latitude, longitude: self.longitude)
    }
    
    func toJSON() -> JSON? {
        return jsonify([
            "latitude" ~~> self.latitude,
            "longitude" ~~> self.longitude])
    }
}
