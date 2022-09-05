//
//  MockBullsEyeGame.swift
//  BullsEye
//
//  Created by Adarsh A on 05/09/22.
//

import Foundation

class MockBullsEyeGame:GameController{
    var score: Int = 0
    var round: Int = 0
    var targetValue: Int = 0
    
    var startNewGameMethodCalls:Int = 0
    var startNewRoundMethodCalls:Int = 0
    var checkAndUpdateScoreMethodCalls:[[Int]] = []
    var checkAndUpdateScoreMethodSideEffect:(title: String, message: String)? = nil
    
    func startNewGame() {
        startNewGameMethodCalls += 1
    }
    
    func startNewRound() {
        startNewRoundMethodCalls += 1
    }
    
    func checkAndUpdateScore(guess: Int) -> (title: String, message: String) {
        checkAndUpdateScoreMethodCalls.append([guess])
        score += 100
        round = 2
        if let returnValue = checkAndUpdateScoreMethodSideEffect{
            return returnValue
        }
        return (title:"",message:"")
    }
    
    
}
