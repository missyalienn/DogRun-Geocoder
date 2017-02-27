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
    static let ref = FIRDatabase.database().reference()
    private init() {}
    
    
}


//    func serializeAndStoreDataOnFirebase() {
//        self.ref = FIRDatabase.database().reference()
//        print(ref)
//
//        let dogrunsRef = self.ref.child("dogruns")
//        let data = createData(with: DataStore.sharedInstance.dogruns)
//    }







// MARK: - DogRun 

extension FirebaseInteractor {
    
    
    func storeOnFirebase(data: [String: [String:Any]], in reference: FIRDatabaseReference) {
        
        reference.updateChildValues(data) { (error, ref) in
            if let error = error {
                print(error.localizedDescription)
                print("error trying to store dogruns")
            } else {
                print("it worked! success! successful storage at \(reference)")
            }
        }
        
    }
    
    
    
    // Adding geocoded dogruns to FireBase
    

    static func addDogrunsToFirebase(name: String, address: String, latitude: Double?, longitude: Double?, isAccessible: Bool, isOffLeash: Bool, notes: String) {
        
        let ref = FIRDatabase.database().reference().root
        let uniqueLocationKey = FIRDatabase.database().reference().childByAutoId().key
        
        ref.child("locations").child("dogruns").updateChildValues(["DR-\(uniqueLocationKey)":["name": name, "address": address, "isHandicap": isAccessible, "dogRunType": isOffLeash, "notes": notes, "isFlagged": "false", "latitude": latitude ?? 0, "longitude": longitude ?? 0]])

    }
    

    
}
    
    
    
    
    
    
    
    
    
    


