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
    var isVerified: Bool?
    
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
                
                self.isVerified = true
                
                print("- ID: \(self.dogRunID), name: \(self.name), Verified: \(self.isVerified), Lat: \(self.latitude), Long: \(self.longitude) -")
            } else {
                self.isVerified = false
                
                print("- ID: \(self.dogRunID), name: \(self.name) Verified: \(self.isVerified), Lat: \(self.latitude), Long: \(self.longitude) -")
                
            }
            
        })
    }
    
}

extension DogRun {
    
    var serialized: [String: [String: Any]] {
        
        var serialDogDictionary =  [String: [String: Any]]()
        
        serialDogDictionary[dogRunID] = [
            "name": name,
            "address": address,
            "notes":notes,
            "isOffLeash": isOffLeash,
            "isAccessible":isAccessible,
            "isVerified": isVerified,
            "latitude":latitude,
            "longitude":longitude,
        ]
      
         return serialDogDictionary
    
    }
    
}







    
    



