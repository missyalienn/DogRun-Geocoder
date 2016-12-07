//
//  DogrunDataStore.swift
//  DogRunGeoCoder
//
//  Created by Missy Allan on 12/2/16.
//  Copyright © 2016 Missy Allan. All rights reserved.
//

import Foundation
import FirebaseDatabase
import FirebaseCore
import Firebase

class DataStore {
    
  
    static let sharedInstance = DataStore()
    
    var dogruns = [DogRun]()
    
    private init() {
        
        // call function to populate arrays with data from JSON
        
    }
    
    // MARK: Populate DogRuns from JSON file...
    func populateDogrunsFromJSON() {
        self.dogruns = []
        jsonParse.getDogRuns { (dogDictionary) in
            if let innerDictionary = dogDictionary["dogruns"]?["facility"] as? [[String : Any]]{
                for dogrunData in innerDictionary {
                    let dogrun = DogRun(dogDictionary: dogrunData)
                    self.dogruns.append(dogrun)
                }
            }
        }
    }

    
    func getDogrunsFromJSON() {
        populateDogrunsFromJSON()
    }

// MARK: add local arrays to Firebase 
    
    func addDogRunsToFirebase() {
        
        for dogrun in dogruns {
            Fire
         
            
        }
    }
    
    
    
    
    
}
    
    
    
    
    
    
