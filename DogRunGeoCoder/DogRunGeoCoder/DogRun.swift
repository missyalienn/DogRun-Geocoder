//
//  DogRun.swift
//  DogRunGeoCoder
//
//  Created by Missy Allan on 12/1/16.
//  Copyright © 2016 Missy Allan. All rights reserved.
//

import Foundation
import CoreLocation
import AddressBook

class DogRun {
    
    let dogRunID: String
    let name: String
    let address: String
    var latitude: Double?
    var longitude: Double?
    var notes: String
    var isOffLeash: Bool = false 
    var isAccessible: Bool = false
    
    init(dogDictionary: [String: Any]) {
        
        self.dogRunID = "DogRun ID: \(dogDictionary["Prop_ID"])"
        self.name = dogDictionary["Name"] as! String
        self.address = dogDictionary["Address"] as! String
        self.notes = dogDictionary["Notes"] as! String
        
        if dogDictionary["DogRuns_Type"] as! String == "Off-Leash" {
            self.isOffLeash = true
        }
        
        if dogDictionary["Accessible"] as! String == "Y" {
            self.isAccessible = true
        }
    }
    
    
    
    
    func getCoordinates() {
        
//        var coordinates: (Double, Double) = (0.0, 0.0)
//        let geocoder = CLGeocoder()
        
        CLGeocoder().geocodeAddressString(self.address, completionHandler: { (placemarks, error) in
            if error != nil {
                print("\(error)")
                return
            }
            if (placemarks?.count)! > 0 {
                let placemark = placemarks?[0]
                let location = placemark?.location
                let coordinate = location?.coordinate
                
                self.latitude = coordinate?.latitude
                self.longitude = coordinate?.longitude
                
                dump(self)
            }
            
            
        })
        
    }
    
    
    
}




