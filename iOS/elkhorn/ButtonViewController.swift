//
//  ButtonViewController.swift
//  elkhorn
//
//  Created by Tomi Lahtinen on 03/08/16.
//  Copyright © 2016 Tomi Lahtinen. All rights reserved.
//

import Foundation
import UIKit

class ButtonViewController: UIViewController {
    
    
    @IBOutlet weak var alertButton: UIButton!
    @IBAction func alertButtonAction(sender: AnyObject) {
        if let location = LocationManager.sharedInstance.currentlocation {
            SocketManager.sharedInstance.sendWarningMessage(location)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let _ = LocationManager.sharedInstance
    }
    
}
