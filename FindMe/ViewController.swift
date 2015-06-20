//
//  ViewController.swift
//  FindMe
//
//  Created by Andrew on 2015-06-14.
//  Copyright (c) 2015 BananaSplit Studio. All rights reserved.
//

import UIKit
//  1. Import Core Location
import CoreLocation

//  2. Create global constant for CLLocationManager

//  3. Add View contoller as a delegate for CLLocationManager
class ViewController: UIViewController, CLLocationManagerDelegate {
    
    let locationManager = CLLocationManager()

    
//  5. Create IBOutlets for the latitude and longitude data
    @IBOutlet weak var latitudeOutlet: UILabel!
    @IBOutlet weak var longitudeOutlet: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
//  4. Check if Location Services has been authorized, and create alert to enable
        
        if CLLocationManager.authorizationStatus() == .NotDetermined {
        locationManager.requestWhenInUseAuthorization()
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

//   8. Button press switch statement which executes either disabledLocationSeriveAlert or printCurrentCoordinates bases on location service status
    @IBAction func testLocation(sender: AnyObject) {
        switch CLLocationManager.authorizationStatus() {
        case .AuthorizedAlways, .AuthorizedWhenInUse:
            printCurrentCoordinates()
        case .Restricted, .Denied:
            disabledLocationSeriveAlert()
        default:
            print("Failed")
        }
      
    }
//  6. Create function that sets the location accuracy, beginnings locating and prints the coordinates to the IBOutlers
    func printCurrentCoordinates() {
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
        if let locationCoordinates = locationManager.location {
            latitudeOutlet.text = String("\(locationManager.location!.coordinate.latitude)")
            longitudeOutlet.text = String("\(locationManager.location!.coordinate.longitude)")
        }
            }

//   7. Create function that displays an alert when location services are disabled
    func disabledLocationSeriveAlert() {
        let alert = UIAlertController(title: "Unable to retrieve location", message: "Enable location services in system settings", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
}




