//
//  ViewController.swift
//  DogRunGeoCoder
//
//  Created by Missy Allan on 12/1/16.
//  Copyright © 2016 Missy Allan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let store = DataStore.sharedInstance
    let firebaseInteractor = FirebaseInteractor.shared

    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        store.populateDogrunsFromJSON()
        print(store.dogruns.count)
        
        for index in 0..<50 {
            let dogRun = store.dogruns[index]
            dogRun.getCoordinates()
    
        }
        
    }

    
    @IBAction func firebaseButton(_ sender: Any) {
        
       firebaseInteractor.serializeAndStoreDataOnFirebase()
    }
    


}

