//
//  MemoryGame.swift
//  StafordStart
//
//  Created by shehan karunarathna on 2022-01-27.
//

import Foundation

struct MemoryGame<CardContent> where CardContent:Equatable{
    private(set) var cards: Array<Card>
    private var onlyFaceUpCard:Int?
    
    mutating func shuffle(){
        cards.shuffle()
    }
    
    mutating func choose(_ card :Card){
        
        if let choose =  cards.firstIndex(where: { cardnew in cardnew.id == card.id && !card.faceUp}) {
            if let faceupcard = onlyFaceUpCard {
                if cards[choose].cardContent == cards[faceupcard].cardContent {
                    cards[choose].ismatched = true
                    cards[faceupcard].ismatched = true
                    
                }
                onlyFaceUpCard = nil
            } else {
                for index in 0..<cards.count {
                    cards[index].faceUp = false
                }
                onlyFaceUpCard = choose
            }
            cards[choose].faceUp.toggle()
        }
//        if let chosenIndex = index(of: card) {
//            cards[chosenIndex].faceUp.toggle()
//        }
       
    }
    
    func index(of:Card) -> Int?{
        for index in 0..<cards.count{
            if(cards[index].id == of.id){
                return index
            }
        }
        return nil
    }
    
    init(noOfCards:Int, createCardContent: (Int) -> CardContent) {
        cards = Array<Card> ()
        for index in 0..<noOfCards {
            var content:CardContent = createCardContent(index*2)
            var content1:CardContent = createCardContent(index*2+1)
            cards.append(Card(cardContent: content, id: index*2))
            cards.append(Card(cardContent: content, id: index*2+1))
        }
        cards.shuffle()
    }
    
    struct Card :Identifiable{
      
        var faceUp:Bool = false
        var ismatched:Bool = false
        var cardContent:CardContent
        var id: Int
    }
}
