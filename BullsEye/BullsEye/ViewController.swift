//
//  ViewController.swift
//  BullsEye
//
//  Created by Adarsh A on 31/08/22.
//

import UIKit

class ViewController: UIViewController {
    
    var targetValue:Int = 0
    var score = 0
    var round = 0
    
    @IBOutlet weak var slider:UISlider!
    @IBOutlet weak var targetLabel:UILabel!
    @IBOutlet weak var roundLabel:UILabel!
    @IBOutlet weak var scoreLabel:UILabel!

    
    override var shouldAutorotate: Bool {return true}
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {return UIInterfaceOrientationMask.landscapeRight}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startNewGame()
        
        let sliderThumbImage = UIImage(named: "SliderThumb-Normal")!
        let sliderThumbHighlightedImage = UIImage(named: "SliderThumb-Highlighted")
        slider.setThumbImage(sliderThumbImage, for: .normal)
        slider.setThumbImage(sliderThumbHighlightedImage, for: .highlighted)
        
        let minimumTrackImage = UIImage(named: "SliderTrackLeft")!.resizableImage(withCapInsets:UIEdgeInsets(top: 0, left:14 , bottom: 0, right: 14))
        
        let maximumTrackImage = UIImage(named: "SliderTrackRight")!.resizableImage(withCapInsets: UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14))
        
        slider.setMinimumTrackImage(minimumTrackImage, for: .normal)
        slider.setMaximumTrackImage(maximumTrackImage, for: .normal)
    }
    
    

    @IBAction func showAlert(){
        let currentValue = Int(self.slider.value.rounded())
        let difference = (targetValue - currentValue).magnitude
        
        let message:String
        let title:String
        
        switch(difference){
        case 0:
            score += 200
            message = "200 points"
            title = "Bull's Eye!"
        case 1...5:
            score += 100
            message = "100 points"
            title = "Almost there!"
        case 6...10:
            score += 50
            message = "50 points"
            title = "You are close!"
        default:
            message = "Try again"
            title = "Too far!"
        }
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default, handler:{(action:UIAlertAction)->Void in self.startNewRound()})
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func startNewGame(){
        round = 0
        score = 0
        startNewRound()
    }
    
    private func assignTarget(){
        targetValue = Int.random(in: 1...100)
        targetLabel.text = String(self.targetValue)
    }
    
    private func assignRound(){
        round += 1
        roundLabel.text = String(round)
    }
    
    private func updateScore(){
        scoreLabel.text = String(score)
    }
    
    private func startNewRound(){
        assignTarget()
        assignRound()
        updateScore()
        slider.value = 50
    }

}

