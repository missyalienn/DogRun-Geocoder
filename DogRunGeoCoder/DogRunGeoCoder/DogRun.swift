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
    
    
    func setCoordinates(index: Int, dogruns: [DogRun]) {
        
        if index < dogruns.count {
                
                let dogPark = dogruns[index] as DogRun
            
                    let geocoder = CLGeocoder()
                    
                    geocoder.geocodeAddressString(self.address, completionHandler: { (placemarks, error) in
                        
                        print("\n\nPROGRESS: Now geocoding for \(self.name)... \(index)")
                        
                        if (placemarks?.count)! > 0 {
                            let placemark = placemarks?[0]
                            let location = placemark?.location
                            let coordinate = location?.coordinate
                            
                            self.latitude = coordinate?.latitude
                            self.longitude = coordinate?.longitude
                            
                            self.isVerified = true
                                print("\n\nSUCCESS: Geocoded for \(self.name) at address: \(self.address)! It's located at \(self.latitude), \(self.longitude) \(index)")
                        }else{
                            print("D'OH")
                            print("\n\nFAILURE: \(self.name) at address: \(self.address) could not be geocoded. ERROR: \(error?.localizedDescription) \(index)")
                        }
                        
                    })
                    setCoordinates(index: index + 1, dogruns: dogruns)
                }
            }
       

 }

    
    
    


    
    



