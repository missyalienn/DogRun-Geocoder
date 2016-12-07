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
        let firebaseInteractor = FirebaseInteractor.shared
        
        store.populateDogrunsFromJSON()
        print(store.dogruns.count)
        
        for index in 0..<50 {
            let dogRun = store.dogruns[index]
            dogRun.getCoordinates()
    
        }
        
    }

    
    
    


}

