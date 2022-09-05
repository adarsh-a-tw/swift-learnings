//
//  ViewController.swift
//  BullsEye
//
//  Created by Adarsh A on 31/08/22.
//

import UIKit

class ViewController: UIViewController {
    
    var gameController:GameController!
    
    @IBOutlet weak var slider:UISlider!
    @IBOutlet weak var targetLabel:UILabel!
    @IBOutlet weak var roundLabel:UILabel!
    @IBOutlet weak var scoreLabel:UILabel!

    
    override var shouldAutorotate: Bool {return true}
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {return UIInterfaceOrientationMask.landscape}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gameController = BullsEyeGame()
        startNewGame()
        
        let sliderThumbImage = UIImage(named: "SliderThumb-Normal")!
        let sliderThumbHighlightedImage = UIImage(named: "SliderThumb-Highlighted")
        slider.setThumbImage(sliderThumbImage, for: .normal)
        slider.setThumbImage(sliderThumbHighlightedImage, for: .highlighted)
        
        let minimumTrackImage = UIImage(named: "SliderTrackLeft")!.resizableImage(withCapInsets:UIEdgeInsets(top: 0, left:14 , bottom: 0, right: 14))
        
        let maximumTrackImage = UIImage(named: "SliderTrackRight")!.resizableImage(withCapInsets: UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14))
        
        slider.setMinimumTrackImage(minimumTrackImage, for: .normal)
        slider.setMaximumTrackImage(maximumTrackImage, for: .normal)
        slider.value = 50
    }
    
    

    @IBAction func showAlert(){
        let guessValue = Int(slider.value.rounded())
       
        let result = gameController.checkAndUpdateScore(guess: guessValue)
        
        let alert = UIAlertController(title: result.title, message: result.message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default, handler:{(action:UIAlertAction)->Void in self.startNewRound()})
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func startNewGame(){
        gameController.startNewGame()
        updateLabels()
    }
    
    
    private func updateLabels(){
        targetLabel.text = String(gameController.targetValue)
        roundLabel.text = String(gameController.round)
        scoreLabel.text = String(gameController.score)
    }
    
    func startNewRound(){
        gameController.startNewRound()
        slider.value = 50
        updateLabels()
    }

}

