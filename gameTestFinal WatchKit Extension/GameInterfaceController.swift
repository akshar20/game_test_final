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
    
    
    // Game Sprite References
    
    @IBOutlet weak var memorizeImage1: WKInterfaceImage!
    @IBOutlet weak var memorizeImage2: WKInterfaceImage!
    @IBOutlet weak var memorizeImage3: WKInterfaceImage!
    @IBOutlet weak var memorizeImage4: WKInterfaceImage!
    @IBOutlet weak var timeLabel: WKInterfaceLabel!
    
    
    // Game Stats Variables
    var randomSequence = [String]()
    var givenSequence = [String]()
    var noOfInputs = 0
    
    
    
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
        
        
        // Show sequence and start timer and hide it after seconds become 0.
        self.showSequence()
        self.timeLabel.setText("\(3)")
        self.initializeTimer(seconds: 3)
        
        
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    
    // Check key  present
    func isKeyPresentInUserDefaults(key: String) -> Bool {
        return UserDefaults.standard.object(forKey: key) != nil
    }
    
    
    
    //  ************* ************* ************* ************* ************* **********
    //  ************* ************* ***** GAME FUNCTIONS  ************* ************* **
    //  ************* ************* ************* ************* ************* **********
    
    
    // Apple Button Pressed
    @IBAction func appleButtonPressed() {
        
        if(self.noOfInputs <= 3){
            self.givenSequence.append("apple")
            self.noOfInputs += 1
        
            // Check selected input is last or not
            if(self.noOfInputs == 4){
                self.matchTheSequence()
            }
        }else{
            self.matchTheSequence()
        }
        
    }
    
    // Banana Button Pressed
    @IBAction func bananaButtonPressed() {
        if(self.noOfInputs <= 3){
            self.givenSequence.append("banana")
            self.noOfInputs += 1
        
            // Check selected input is last or not
            if(self.noOfInputs == 4){
                self.matchTheSequence()
            }
        }else{
            self.matchTheSequence()
        }
        
    }
    
    
    // Grapes Button Pressed
    @IBAction func grapesButtonPressed() {
        if(self.noOfInputs <= 3){
            self.givenSequence.append("grapes")
            self.noOfInputs += 1
        
            // Check selected input is last or not
            if(self.noOfInputs == 4){
                self.matchTheSequence()
            }
        }else{
            self.matchTheSequence()
        }
       
    }
    
    
    // Watermelon Button Pressed
    @IBAction func watermelonButtonPressed() {
        if(self.noOfInputs <= 3){
            self.givenSequence.append("watermelon")
            self.noOfInputs += 1
            
            // Check selected input is last or not
            if(self.noOfInputs == 4){
                self.matchTheSequence()
            }
        }else{
            self.matchTheSequence()
        }
    }
    
    
    
    // TIMER
    
    func initializeTimer(seconds: Int){
        var runCount = 0
        
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            
            runCount += 1
            
            self.timeLabel.setText("\(seconds - runCount)")
            
            if runCount == seconds {
                timer.invalidate()
                
                // Hide the sequence
                self.hideSequence()
            }
        }
    }
    
    // Show the sequence
    func showSequence(){
        
        var predifinedArray = ["apple", "banana", "grapes", "watermelon"]
        
        // Pick random fruit from array and store it into random sequence
        for _ in 0..<4{
            self.randomSequence.append(predifinedArray.randomElement()!)
        }
        
        //print("RANDOM: \(self.randomSequence)")
        
    }
    
    // Hide the sequence
    func hideSequence(){
        
    }
    
    
    // MATCHING SEQUENCE
    func matchTheSequence(){
        
        //print("USER SELECTED: \(self.givenSequence)")
        
    }
   
    
}
