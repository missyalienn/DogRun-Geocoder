//
//  ViewController.swift
//  DogRunGeoCoder
//
//  Created by Missy Allan on 12/1/16.
//  Copyright © 2016 Missy Allan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
      
        
        let store = DataStore.sharedInstance
        store.getDogRunFromJSON()
        print(store.dogruns.count)
        
    print("i can actually print something !!!")
        
        for index in 101..<133 {
            let dogRun = store.dogruns[index]
            dogRun.getCoordinates()
            print("get coordinates called")

        }

//        let testDictionary = [
//                        "dogruns": [
//                            "facility": [
//                            [
//                            "Prop_ID": "X002",
//                            "Name": "Bronx Park Off-Leash Area",
//                            "Address": "Unionport & Sagamore on Bronx Park East to 233rd Street, Bronx, NY",
//                            "DogRuns_Type": "Off-Leash",
//                            "Accessible": "N",
//                            "Notes": ""
//                            ]
//                        ]
//            ]
//        ]
//        
//        let jsonDictionary = try! JSONSerialization.data(withJSONObject: testDictionary, options: [])
//        
//        let string = String(data: jsonDictionary, encoding: .ascii)
//        
//        dump(string!)
        
    }

    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

