//
//  ViewController.swift
//  SimpleCardGame
//
//  Created by 范桶 on 2021/3/10.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var cardButtons: [UIButton]!
    @IBOutlet weak var flipTimes: UILabel!
    @IBOutlet weak var ScoreLabel: UILabel!
    
    var numberOfPairsOfCard: Int {
        return (cardButtons.count + 1) / 2
    }
    
    lazy var game = MatchingGame(numberOfPairsOfCards: numberOfPairsOfCard)
    
    var isAllFaceUp: Bool = false
    var count: Int = 0 {
        didSet {
            // 隨著count的改變去更改顯示的text
            flipTimes.text = "Flips: " + String(count)
        }
    }
    
    var score: Int = 0 {
        didSet {
            ScoreLabel.text = "Score: " + String(score)
        }
    }
    
    
    var emojiChoices = ["🐭", "🐱", "🐷", "🙉", "🐶", "🐼", "🐤", "🐸"]
    var emojiDict = [Card: String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func touchCard(_ sender: UIButton) {
        if let cardIndex = cardButtons.firstIndex(of: sender) {
            game.chooseCard(at: cardIndex)
            score = game.getScore()
            count += 1
            updateViewFromModel()
        }
        else {
            print("not in the collection")
        }
        
    }
  
    @IBAction func flipAll(_ sender: Any) {
        if isAllFaceUp {
            game.flipAll(flag: false)
            isAllFaceUp = false
        }
        else {
            game.flipAll(flag: true)
            isAllFaceUp = true
        }
        updateViewFromModel()
    }
    
    @IBAction func reset(_ sender: Any) {
        count = 0
        game.reset()
        score = game.getScore()
        updateViewFromModel()
    }
    
    func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(getEmoji(for: card), for: UIControl.State.normal)
                if card.isMatched {
                    button.backgroundColor = UIColor.orange.withAlphaComponent(0.5)
                }
                else {
                    button.backgroundColor = UIColor.orange
                }
            }
            else {
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            }
        }
    }
    
    func getEmoji(for card: Card) -> String {
        if emojiDict[card] == nil, emojiChoices.count > 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))

            emojiDict[card] = emojiChoices.remove(at: randomIndex)
        }
        return emojiDict[card] ?? "?"
    }
}


