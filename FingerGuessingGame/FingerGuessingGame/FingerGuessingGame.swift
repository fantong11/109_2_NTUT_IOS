//
//  FingerGuessingGame.swift
//  FingerGuessingGame
//
//  Created by 范桶 on 2021/5/19.
//

import Foundation

class FingerGuessingGame: ObservableObject {
    @Published var playerGuess: Finger?
    @Published var computerGuess: Finger?
    @Published var result: GameResult?
    
    func play() {
        playerGuess = Finger.allCases.randomElement()
        computerGuess = Finger.allCases.randomElement()
        result = checkResult()
    }
    
    func checkResult() -> GameResult? {
        if playerGuess?.rawValue == computerGuess?.rawValue {
            return GameResult.tie
        }
        else if playerGuess == .rock {
            if computerGuess == .scissor {
                return GameResult.win
            }
            else {
                return GameResult.lose
            }
        }
        else if playerGuess == .scissor {
            if computerGuess == .paper {
                return GameResult.win
            }
            else {
                return GameResult.lose
            }
        }
        else if playerGuess == .paper {
            if computerGuess == .rock {
                return GameResult.win
            }
            else {
                return GameResult.lose
            }
        }
        return nil
    }
    
    func getResult() -> String {
        switch result {
        case .win:
            return "玩家獲勝"
        case .lose:
            return "電腦獲勝"
        case .tie:
            return "平手"
        default:
            return "請按出拳開始猜拳"
        }
    }
}
