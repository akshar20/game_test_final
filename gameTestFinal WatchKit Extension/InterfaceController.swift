//
//  InterfaceController.swift
//  gameTestFinal WatchKit Extension
//
//  Created by MacStudent on 2019-03-14.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {
    
    
    var buttonFlag = 0 // set 0 for player not register | 1 for player registered
    
    let sharedPreference = UserDefaults.standard
    
    @IBOutlet weak var helloLabel: WKInterfaceLabel!
    @IBOutlet weak var baseButton: WKInterfaceButton!
    

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
        
        if(self.isKeyPresentInUserDefaults(key: "playerName")){
            
            let playerName = sharedPreference.string(forKey: "playerName")
            helloLabel.setText("Hello \(playerName!)!")
            baseButton.setTitle("Start Game")
            self.buttonFlag = 1
            
        }else{
            helloLabel.setText("Welcome!")
            baseButton.setTitle("Enter Your Name")
            self.buttonFlag = 0
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
    
    
    @IBAction func baseButtonPressed() {
        
        if(self.buttonFlag == 0){ // Player not registered yet
        
            let suggestedResponses = ["Guest"]
                                                        
                                                        
            presentTextInputController(withSuggestions: suggestedResponses, allowedInputMode: .plain) { (results) in
                
                
                if (results != nil && results!.count > 0) {
                    // 2. write your code to process the person's response
                    let userResponse = results?.first as? String
                
                    self.helloLabel.setText("Hello \(userResponse!)!")
                    self.baseButton.setTitle("Start Game")
                    self.buttonFlag = 1
                    // set sharedpreference
                    self.sharedPreference.set(userResponse, forKey: "playerName")
                    
                }
            }
        
        }else{ // Player is registered
            
         
        }
        
    }
    
}
