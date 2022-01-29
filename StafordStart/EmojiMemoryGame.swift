//
//  EmojiMemoryGame.swift
//  StafordStart
//
//  Created by shehan karunarathna on 2022-01-27.
//

import SwiftUI

func makeCardContent(index:Int) -> String{
    return "😀"
}

class EmojiMemoryGame: ObservableObject {
    
 
   static var emojies = ["🚙","🚁","🚀","🛶","🚘","⛵️","🛳","🚌","🛻","🛴","🛺","🚑","🚜","🚒","🛸"]
    
    static func createMemoryGame () -> MemoryGame<String> {
         MemoryGame.init(noOfCards: 4, createCardContent: {(index:Int) -> String in
           EmojiMemoryGame.emojies[index]
           
           
       })
    }
    
    @Published private var model : MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    var cards : Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    func choose(_ card : MemoryGame<String>.Card){
        model.choose(card)
     
    }
    
    func shuffle(){
        model.shuffle()
    }
    
    func restart(){
        model =  EmojiMemoryGame.createMemoryGame()
    }
}
