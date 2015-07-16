//
//  MapViewController.swift
//  CollegeView
//
//  Created by mia willett on 7/9/15.
//  Copyright © 2015 mia willett. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var mapView: MKMapView!
    var locationName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        findLocation()
        
    }
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        locationName = textField.text!
        textField.resignFirstResponder()
        findLocation()
        return true
    }
    func findLocation() {
        let alert = UIAlertController(title: "Select a location", message: nil, preferredStyle: .ActionSheet)
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(locationName, completionHandler: {
            placemarks, error in
                if (error != nil) {
                    print("error")
                }
                else {
                    
                    var number = placemarks!.count
                    if number == 1 {
                        let placemark = placemarks!.first as CLPlacemark!
                        self.displayMap(placemark)
                    }
                    else {
                        if number > 5 { number = 5}
                        for index in 0..<number {
                            let placemark = placemarks![index] as CLPlacemark!
                            let name = placemark.name
                            let city = placemark.locality
                            let state = placemark.administrativeArea
                            let location = "\(name), \(city), \(state)"
                            let locationAction = UIAlertAction(title: location, style: .Default, handler: { (action) -> Void in
                                self.displayMap(placemark)
                            })
                            alert.addAction(locationAction)
                        }
                        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
                        alert.addAction(cancelAction)
                        self.presentViewController(alert, animated: true, completion: nil)
                    }
                }
        })
    }
    func displayMap (placemark: CLPlacemark) {
        let name = placemark.name
        let city = placemark.locality
        let state = placemark.administrativeArea
        let location = "\(name), \(city), \(state)"
        let center = placemark.location!.coordinate
        let span = MKCoordinateSpanMake(0.1, 0.1)
        let region = MKCoordinateRegionMake(center, span)
        let pin = MKPointAnnotation()
        pin.coordinate = center
        pin.title = location
        self.mapView.addAnnotation(pin)
        self.mapView.setRegion(region, animated: true)
        
    }
    
}