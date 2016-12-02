//
//  jsonParse.swift
//  DogRunGeoCoder
//
//  Created by Missy Allan on 12/1/16.
//  Copyright © 2016 Missy Allan. All rights reserved.
//

import Foundation

class jsonParse {
    
    
    class func getDogRuns(completion: @escaping ([String:[String: Any]]) -> Void) {
        
        let filePath = Bundle.main.path(forResource: "dogrunsnyc", ofType:"json")
        let data = try! NSData(contentsOfFile:filePath!, options: NSData.ReadingOptions.uncached)
        
        do {
         
            let dogDictionary = try JSONSerialization.jsonObject(with: data as Data, options: []) as! [String: [String: Any]]
            completion(dogDictionary)
         
        } catch {
            
            print("JSONSerialization not working...")
        }
    }
    
    
    
}
