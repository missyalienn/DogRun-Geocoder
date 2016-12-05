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
        
        for index in 44..<60 {
            let dogRun = store.dogruns[index]
            dogRun.getCoordinates()
            
        }
    }

    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

