//
//  ContentView.swift
//  StafordStart
//
//  Created by shehan karunarathna on 2022-01-27.
//

import SwiftUI

struct EmojiGameView: View {
    var emojies = ["🚙","🚁","🚀","🛶","🚘","⛵️","🛳","🚌","🛻","🛴","🛺","🚑","🚜","🚒","🛸"]
    @ObservedObject var viewModel : EmojiMemoryGame
    @State var emojiCount = 5
    
    var selectVehicle : some View{
        return Button {
            
        } label : {
            VStack{
                Image(systemName: "car")
                Text("vahicle").font(.system(size: 20))
            }
        }
    }
    var selectFood : some View{
        return Button {
            
        } label : {
            VStack{
                Image(systemName: "car")
                Text("vahicle").font(.system(size: 20))
            }
        }
    }
    var remove : some View{
        return  Button {
            if(emojiCount > 1){
                emojiCount-=1
            }
           
        } label: {
            VStack{
                Image(systemName: "minus.circle")
                Text("remove").font(.system(size: 20))
            }
        }
    }
    var add : some View{
        Button {
            if(emojiCount < emojies.count){
                emojiCount+=1
            }
            
        } label: {
            VStack{
                Image(systemName: "plus.circle")
            }
        }
    }
    
    @ViewBuilder
    private func cardViewNew (card: MemoryGame<String>.Card) -> some View {
        if card.ismatched && !card.faceUp {
             Rectangle().opacity(0)
        } else {
             CardView(card: card)
                .aspectRatio(2/3, contentMode: .fit)
                .onTapGesture {
                    viewModel.choose(card)
                }
        }
    }
    
    var body: some View {
        return
        
        VStack{
            Text("Memorize!")
            AspectVGrid(items: viewModel.cards, spectRatio: 2/3, content: {card in
                cardViewNew(card:card)
                
            })
//                .foregroundColor(Color.red)
//                .padding(.all)
//            ScrollView{
//                LazyVGrid(columns:[GridItem(.adaptive(minimum: 70))]){
//                    ForEach(viewModel.cards) { card in
//                        CardView(card: card)
//                            .aspectRatio(2/3, contentMode: .fit)
//                            .onTapGesture {
//                                viewModel.choose(card)
//                            }
//                    }
//
//                }
//                .padding(.all)
//            }
            .foregroundColor(Color.red)
            Spacer(minLength: 20)
            HStack{
                selectVehicle
                Spacer()
                selectFood
                Spacer()
                add
                
                
            }
            .padding(.horizontal)
            

        }
        .font(.largeTitle)
        .padding()
        
        
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        EmojiGameView(viewModel: game)
//            .preferredColorScheme(.dark)
    }
}

struct CardView: View {
//    @State var faceUp:Bool = true
    let card : MemoryGame<String>.Card
//    var text:String
    var body: some View {
        return
        GeometryReader{
            geometry in
            ZStack{
                let baseShape = RoundedRectangle(cornerRadius: DrawingConstants.cornerRadius)
                if(card.faceUp){
                    baseShape.fill(.white)
                    baseShape.stroke(lineWidth: DrawingConstants.lineWidth)
                    Pie(startAngle: Angle(degrees: 0-90), endAngle: Angle(degrees: 110-90)).padding(5).opacity(0.5)
               
                    Text(card.cardContent)
                        .padding(.vertical)
                        .font(.system(size: min(geometry.size.height, geometry.size.width) * DrawingConstants.fontScale ))
                  
                } else if(card.ismatched){
                    baseShape.opacity(0)
                }
                
                else {
                    baseShape.fill()
                }
                
            }
        }
        
//        .onTapGesture {
//            card.faceUp = !card.faceUp
//        }
    }
    
    private struct DrawingConstants{
        static let cornerRadius : CGFloat = 25
        static let lineWidth : CGFloat = 3
        static let fontScale : CGFloat = 0.6
    }
}
