//
//  ViewController.swift
//  BullsEye
//
//  Created by Frank Sedivy on 15/08/2017.
//  Copyright © 2017 Frank Sedivy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var currentValue = 50
    var targetValue = 0
    var score = 0

    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        startNewRound()
        updateLabels()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func startNewRound() {
        // Let's generate the target value user needs to aim for
        targetValue = 1 + Int(arc4random_uniform(100))
        
        // Store the default value of the slider (in case it needs to be used before the slider is tapped)
        currentValue = 50
        
        slider.value = Float(currentValue)
    }
    
    func updateLabels() {
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
    }
    
    @IBAction func showAlert() {
        
        let difference = abs(targetValue - currentValue)
        let points = 100 - difference
        
        score += points
        
        let message =   "You scored \(points)!"
        
        let alert = UIAlertController(title: "Hello world",
                                      message: message,
                                      preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK",
                                   style: .default,
                                   handler: nil)
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
        startNewRound()
        updateLabels()
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        currentValue = lroundf(slider.value)
        print("Slide value: \(currentValue)")
        print("Target value: \(targetValue)")
    }
    


}

