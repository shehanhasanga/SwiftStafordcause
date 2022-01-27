//
//  ContentView.swift
//  StafordStart
//
//  Created by shehan karunarathna on 2022-01-27.
//

import SwiftUI

struct ContentView: View {
    var emojies = ["🚙","🚁","🚀","🛶","🚘","⛵️","🛳","🚌","🛻","🛴","🛺","🚑","🚜","🚒","🛸"]
    @State var emojiCount = 5
    var remove : some View{
        return  Button {
            if(emojiCount > 1){
                emojiCount-=1
            }
           
        } label: {
            VStack{
                Image(systemName: "minus.circle")
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
    
    var body: some View {
        return
        
        VStack{
            ScrollView{
                LazyVGrid(columns:[GridItem(.adaptive(minimum: 70))]){
                    ForEach(emojies[1..<emojiCount], id: \.self) { emoji in
                        CardView(text: emoji).aspectRatio(2/3, contentMode: .fit)
                    }

                }
                .padding(.all)
            }
            .foregroundColor(Color.red)
            Spacer(minLength: 20)
            HStack{
                remove
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
        ContentView()
            .preferredColorScheme(.dark)
    }
}

struct CardView: View {
    @State var faceUp:Bool = true
    var text:String
    var body: some View {
        return
        ZStack{
            let baseShape = RoundedRectangle(cornerRadius: 25)
            if(faceUp){
                baseShape.fill(.white)
                baseShape.stroke(lineWidth: 3)
                Text(text)
                    .padding(.vertical)
            } else {
                baseShape.fill()
            }
            
        }
        .onTapGesture {
            faceUp = !faceUp
        }
    }
    
}
