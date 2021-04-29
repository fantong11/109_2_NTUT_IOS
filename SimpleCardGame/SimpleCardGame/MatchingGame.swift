//
//  MatchingGame.swift
//  SimpleCardGame
//
//  Created by 范桶 on 2021/3/17.
//

import Foundation

class MatchingGame {
    var cards: [Card] = []
    var score: Int = 0
    var indexOfOneAndOnlyFaceUpCard: Int? {
        get {
            var foundIndex:Int?
            for index in cards.indices{
                if cards[index].isFaceUp, !cards[index].isMatched{
                    if foundIndex == nil{
                        foundIndex = index
                    } else {
                        return nil
                    }
                }
            }
            return foundIndex
        }
        set(newIndex) {
            for index in cards.indices {
                if !cards[index].isMatched {
                    cards[index].isFaceUp = (index == newIndex)
                }
            }
        }
    }
    
    init(numberOfPairsOfCards: Int) {
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
            
        }
        shuffleCards()
    }
    
    func chooseCard(at index: Int){
        if !cards[index].isMatched {
            //has another previous card face up
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                // 跟上次選擇的牌一樣的話 兩的都標記isMatched
                if cards[matchIndex] == cards[index] {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                    score += 5
                }
                else {
                    score -= 1
                }
                cards[index].isFaceUp = true
            }
            else {
                score -= 1
                indexOfOneAndOnlyFaceUpCard = index
            }
        print(score)
        }
    }
    
    func getScore() -> Int {
        return score
    }
    
    func flipAll(flag: Bool) -> Void {
        for index in cards.indices {
            cards[index].isFaceUp = flag
        }
    }
    
    func setUnmatch() -> Void {
        for index in cards.indices {
            cards[index].isMatched = false
        }
    }
    
    func reset() -> Void {
        setUnmatch()
        flipAll(flag: false)
        score = 0
        shuffleCards()
    }
    
    func shuffleCards() -> Void {
        cards.shuffle()
    }
}
