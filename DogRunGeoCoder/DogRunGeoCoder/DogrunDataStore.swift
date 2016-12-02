//
//  DogrunDataStore.swift
//  DogRunGeoCoder
//
//  Created by Missy Allan on 12/2/16.
//  Copyright © 2016 Missy Allan. All rights reserved.
//

import Foundation


class DataStore {
    
  
    static let sharedInstance = DataStore()
    var dogruns = [DogRun]()
    private init() {
        
        // call function to populate arrays with data from JSON
        
    }
    
    
    func getDogRunFromJSON() {
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

   
    
    
    
    }
    
    
    
    
    
    
