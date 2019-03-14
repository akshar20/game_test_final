//
//  GameInterfaceController.swift
//  gameTestFinal WatchKit Extension
//
//  Created by MacStudent on 2019-03-14.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import WatchKit
import Foundation


class GameInterfaceController: WKInterfaceController {
    
    // Shared Preference
    let sharedPreference = UserDefaults.standard
    var gameLevel = "easy" // By default set it to easy
    
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
        // Set it to its value set by the user
        if(self.isKeyPresentInUserDefaults(key: "GameLevel")){
            gameLevel = sharedPreference.string(forKey: "GameLevel")!
        }
        
        
        
        
        
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    
    // Check key  present
    func isKeyPresentInUserDefaults(key: String) -> Bool {
        return UserDefaults.standard.object(forKey: key) != nil
    }

}
