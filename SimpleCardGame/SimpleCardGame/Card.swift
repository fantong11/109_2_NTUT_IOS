//
//  Card.swift
//  SimpleCardGame
//
//  Created by 范桶 on 2021/3/17.
//

import Foundation

struct Card: Hashable {
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func ==(lhs: Card, rhs: Card) -> Bool {
        return lhs.id == rhs.id
    }
    
    var isFaceUp = false
    var isMatched = false
    private var id: Int
    static var identifierFactory = 0
    
    init() {
        self.id = Card.getUniqueIdentifier()
    }
    
    // 每次init去增加id值
    static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
}
