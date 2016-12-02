//
//  DogRun.swift
//  DogRunGeoCoder
//
//  Created by Missy Allan on 12/1/16.
//  Copyright © 2016 Missy Allan. All rights reserved.
//

import Foundation

class DogRun {
    
    let dogRunID: String
    let name: String
    let address: String
    var latitude: String? = nil
    var longitude: String? = nil
    var notes: String
    var isOffLeash: Bool = false //
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
    
    
    
    


}
