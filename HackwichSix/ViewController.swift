//
//  ViewController.swift
//  HackwichSix
//
//  Created by CM Student on 3/5/18.
//  Copyright © 2018 CM Student. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var slider: UISlider!
    //create a variable that can hold the value of the slider
    var currentValue: Int = 1
    
    //creating a variable to hold the target value
    var targetValue: Int = 0
    
    @IBOutlet var targetLabel: UILabel!
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //setting current values to slider's value
        currentValue = lroundf(slider.value)
        
        //call startNewRound
        startNewRound()
        
        let thumbImageNormal = UIImage(named: "SliderThumb-Normal")
        slider.setThumbImage(thumbImageNormal, for: .normal)
    }
    
    //create a new function to display targetValue in targetLabel
    
    func updateTargetLabel() {
        targetLabel.text = String(targetValue)
    
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func sliderHasMoved(_ sender: Any) {
        print("The value of the slider is:\(slider.value)")
        currentValue = lroundf(slider.value)
        
        
    }
    
    @IBAction func myGuessButtonPressed(_ sender: Any) {
        //5. New variable message thT displays a message that includes currentValue
        let message = "The value is: \(currentValue)" + "\nThe target value is: \(targetValue)"
        //1. creating the alert view
        let alert = UIAlertController(title:"Hello World!", message: message, preferredStyle: .alert)
        //2. creating button that user taps to dismiss view controller
        let action = UIAlertAction(title: "Awesome", style: .default, handler: nil)
        //3. creating button to the alert view
        alert.addAction(action)
        //4. present alertview on the screen
        present(alert, animated: true, completion: nil)
        
        startNewRound()
        
    }
        func startNewRound() {
            targetValue = 1 + Int(arc4random_uniform(100))
            currentValue = 50
            slider.value = Float(currentValue)
            updateTargetLabel()
            
    }
            
    
        
        
    
}


