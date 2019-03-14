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
    @IBOutlet weak var selectableButtonApple: WKInterfaceButton!
    @IBOutlet weak var selectableButtonBanana: WKInterfaceButton!
    @IBOutlet weak var selectableButtonGrapes: WKInterfaceButton!
    @IBOutlet weak var selectableButtonWatermelon: WKInterfaceButton!
    @IBOutlet weak var restartGameButton: WKInterfaceButton!
    
    
    // Game Stats Variables
    var randomSequence = [String]()
    var givenSequence = [String]()
    var noOfInputs = 0
    var playAgain = false
    
    
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
        self.setTitle("Close")
        
        // Set it to its value set by the user
        if(self.isKeyPresentInUserDefaults(key: "GameLevel")){
            gameLevel = sharedPreference.string(forKey: "GameLevel")!
        }
        
        
        // Show sequence and start timer and hide it after seconds become 0.
        self.showSequence()
        
        if(gameLevel == "easy"){
            self.timeLabel.setText("\(5)")
            self.initializeTimer(seconds: 5)
        
        }else{
            self.timeLabel.setText("\(3)")
            self.initializeTimer(seconds: 3)
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
    
    
    
    //  ************* ************* ************* ************* ************* **********
    //  ************* ************* ***** GAME FUNCTIONS  ************* ************* **
    //  ************* ************* ************* ************* ************* **********
    
    
    // Apple Button Pressed
    @IBAction func appleButtonPressed() {
        
        if(self.noOfInputs <= 3){
            self.givenSequence.append("apple")
            // Set fruit in postion
            self.selectFruit(name: "apple")
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
            // Set fruit in postion
            self.selectFruit(name: "banana")
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
            // Set fruit in postion
            self.selectFruit(name: "grapes")
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
            // Set fruit in postion
            self.selectFruit(name: "watermelon")
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
                self.timeLabel.setText("Select Fruits!")
                
                // Hide the sequence
                self.hideSequence()
                
                // Show selectable fruit buttons
                self.showSelectableFruitButtons()
            }
        }
    }
    
    // Show the sequence
    func showSequence(){
        
        let predifinedArray = ["apple", "banana", "grapes", "watermelon"]
        
        // Pick random fruit from array and store it into random sequence
        for _ in 0..<4{
            self.randomSequence.append(predifinedArray.randomElement()!)
        }
        //print("RANDOM: \(self.randomSequence)")
        
        
        
        // Show the random sequence to user
        self.memorizeImage1.setImageNamed(self.randomSequence[0])
        self.memorizeImage2.setImageNamed(self.randomSequence[1])
        self.memorizeImage3.setImageNamed(self.randomSequence[2])
        self.memorizeImage4.setImageNamed(self.randomSequence[3])
        
    }
    
    // Hide the sequence
    func hideSequence(){
        self.memorizeImage1.setImageNamed("imageLock")
        self.memorizeImage2.setImageNamed("imageLock")
        self.memorizeImage3.setImageNamed("imageLock")
        self.memorizeImage4.setImageNamed("imageLock")
        
    }
    
    
    // Show fruit Buttons
    func showSelectableFruitButtons(){
        
        self.selectableButtonApple.setHidden(false)
        self.selectableButtonBanana.setHidden(false)
        self.selectableButtonGrapes.setHidden(false)
        self.selectableButtonWatermelon.setHidden(false)
    }
    
    
    // Set fruit position as user selects
    func selectFruit(name: String){
        
        if(self.noOfInputs == 0){
            self.memorizeImage1.setImageNamed(name)
        
        }else if(self.noOfInputs == 1){
            self.memorizeImage2.setImageNamed(name)
            
        }else if(self.noOfInputs == 2){
            self.memorizeImage3.setImageNamed(name)
            
        }else if(self.noOfInputs == 3){
            self.memorizeImage4.setImageNamed(name)
            
        }
        
    }
    
    
    // MATCHING SEQUENCE
    func matchTheSequence(){
        if(self.randomSequence == self.givenSequence){
            self.timeLabel.setText("You win \(self.sharedPreference.string(forKey: "playerName")!)!")
            self.showRestartGameButton()
        }else{
            self.timeLabel.setText("Oops Wrong!")
            self.showRestartGameButton()
        }

    }
    
    
    // RESTART GAME FUNCTIONS
    
    // Show the button
    func showRestartGameButton(){
        self.restartGameButton.setHidden(false)
    }
    
    // Restart Game when pressed
    @IBAction func restartGameButtonPressed() {
    
        //print("Restart Button Pressed!")
        
        // Show that player has selected to play again
        playAgain = true
       presentController(withName: "gameSegue", context: nil)
        
    }
    
    
}
