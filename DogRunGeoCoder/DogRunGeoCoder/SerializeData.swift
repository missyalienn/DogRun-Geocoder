//
//  SerializeData.swift
//  DogRunGeoCoder
//
//  Created by Missy Allan on 12/6/16.
//  Copyright © 2016 Missy Allan. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase
import FirebaseAuth
//import GeoFire


class FirebaseInteractor {
    
    
    static let shared = FirebaseInteractor()
    
    private init() {
        
    }
    
    let ref = FIRDatabase.database().reference()
}

// MARK: - DogRun 

extension FirebaseInteractor{
    
    // first create data ... 
    // then store on Firebase
    
    func createData(with dogruns: [DogRun]) -> [String: [String: Any]] {
        var data = [String: [String: Any]]()
        
        for dogrun in dogruns {
            
            let key = ref.childByAutoId().key
            data[key] = dogrun.serialized
            //geoFireStore(key: key, dogrun: dogrun) 
            print("\(dogrun.name) serialized")
        }
        
        return data
    }
    
    
    
    
    // Adding local JSON files to Firebase

    static func addDogrunsToFirebase(name: String, address: String, latitude: Double?, longitude: Double?, isAccessible: Bool, isOffLeash: Bool, notes: String) {
        
        let ref = FIRDatabase.database().reference().root
        let uniqueLocationKey = FIRDatabase.database().reference().childByAutoId().key
        
        ref.child("locations").child("dogruns").updateChildValues(["DR-\(uniqueLocationKey)":["name": name, "location": address, "isHandicap": isAccessible, "dogRunType": isOffLeash, "notes": notes, "isFlagged": "false"]])

    }
    
    
    

    func storeSerializedDataOnFirebase() {
        
        let dogrunsRef = ref.child("dogruns")
       // let data = createData(with)
    
        
    }
    
    
    
    
    
}
    
    
    
    
    
    
    
    
    
    


