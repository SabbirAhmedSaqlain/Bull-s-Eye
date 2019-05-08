//
//  ViewController.swift
//  Bull's Eye
//
//  Created by Sabbir on 13/4/19.
//  Copyright © 2019 Sabbir. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentValue = 0
    var targetValue = 0
    var scores = 0
    var rounds = 0
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        currentValue =  Int(slider.value)
        startNewRound()
        
        let thumbImageNormal = UIImage(named: "SliderThumb-Normal")
        slider.setThumbImage(thumbImageNormal, for: .normal)
        
        let thumbImageHighlighted = UIImage(named: "SliderThumb-Highlighted")
        slider.setThumbImage(thumbImageHighlighted, for: .normal)
        
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        
        let trackLeftImage = UIImage(named: "SliderTrackLeft")
        let trackLeftResizeable = trackLeftImage?.resizableImage(withCapInsets: insets)
        slider.setMinimumTrackImage(trackLeftResizeable, for: .normal)
        
        let trackRightImage = UIImage(named: "SliderTrackRight")
        let trackRightResizeable = trackRightImage?.resizableImage(withCapInsets: insets)
        slider.setMaximumTrackImage(trackRightResizeable, for: .normal)
        
        
        
        
    }
    
    
    func updateLabels() {
        targetLabel.text = "\(targetValue)"
        scoreLabel.text = "\(scores)"
        roundsLabel.text = "\(rounds)"
    }
 

    func startNewRound(){
        targetValue = Int(arc4random_uniform(100))+1
        currentValue = 50
        slider.value = Float(currentValue)
        rounds += 1
        updateLabels()
    }
    
 
    
    
    @IBAction func sliderMoved(_ sender: UISlider) {
         currentValue =  Int (sender.value)
    }
    
    
    @IBAction func startOver(_ sender: Any) {
        rounds = 0
        scores = 0
        startNewRound()
    }
    
    

    @IBAction func showAlert(_ sender: UIButton) {
        
        let difference = abs(currentValue - targetValue)
        var points = 0
        var feedBack = "Better luck next time"
        if difference == 0 {
            points += 50
            feedBack = "Great Job!"
        }else if difference <= 5 {
            points += 20
            feedBack = "Well Done!"
        }else if difference <= 10 {
            points += 10
            feedBack = "Nice!"

        }
        
        
        scores += points
        
        let text = "Points : \(points)"
        let alert = UIAlertController(title: feedBack , message: text , preferredStyle: .alert)
        let action = UIAlertAction(title: "Awesome", style: .default, handler: {
            action in
            self.startNewRound()
            
        })
        
        
        
        alert.addAction(action)
        present(alert,animated: true)

    }

    
    
    
    
    
}

