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
    
    var counter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        store.populateDogrunsFromJSON()
        print(store.dogruns.count)

    }

    @IBAction func geocodeLocations(_ sender: UIButton) {
        
        if counter >= 5 { return }
        
        var range = 0...0
        
        print("COUNTER: \(counter)")
        
        switch counter {
        case 0:
            range = 0...30
        case 1:
            range = 31...60
        case 2:
            range = 61...90
        case 3:
            range = 91...120
        case 4:
            range = 121...(store.dogruns.count - 1)
        default:
            break
        }
        
        for index in range {
            let dogRun = store.dogruns[index]
            dogRun.getCoordinates()
            
        }
        
        counter += 1
        
    }

    @IBAction func serializeDogRuns(_ sender: UIButton) {
        
        //firebaseInteractor.serializeAndStoreDataOnFirebase()
        
    }

    @IBAction func saveToFirebase(_ sender: UIButton) {
        
        for dogRun in store.dogruns {
            
            FirebaseInteractor.addDogrunsToFirebase(name: dogRun.name, address: dogRun.address, latitude: dogRun.latitude, longitude: dogRun.longitude, isAccessible: dogRun.isAccessible, isOffLeash: dogRun.isOffLeash, notes: dogRun.notes)
            
            
        }
        
    }
    


}

