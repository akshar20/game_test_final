//
//  ChooseDifficultyInterfaceController.swift
//  gameTestFinal WatchKit Extension
//
//  Created by MacStudent on 2019-03-14.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import WatchKit
import Foundation


class ChooseDifficultyInterfaceController: WKInterfaceController {
    
    // Shared Preference
    let sharedPreference = UserDefaults.standard
    
    @IBOutlet weak var helloLabel: WKInterfaceLabel!
    

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
        
        self.helloLabel.setText("Hello \(sharedPreference.string(forKey: "playerName")!)!")
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    
    
    @IBAction func easyButtonPressed() {
        sharedPreference.set("easy", forKey: "GameLevel")
        presentController(withName: "gameSegue", context: nil)
    }

    
    @IBAction func hardButtonPressed() {
        sharedPreference.set("hard", forKey: "GameLevel")
        presentController(withName: "gameSegue", context: nil)
    }
    
}
