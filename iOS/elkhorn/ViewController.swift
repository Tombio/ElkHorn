//
//  ViewController.swift
//  elkhorn
//
//  Created by Tomi Lahtinen on 02/08/16.
//  Copyright © 2016 Tomi Lahtinen. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        debugPrint("Something...")
        SocketManager.sharedInstance.socket.connect()
        
        mapView.delegate = self
        mapView.showsUserLocation = true
        mapView.showsCompass = true
        mapView.showsTraffic = true
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

