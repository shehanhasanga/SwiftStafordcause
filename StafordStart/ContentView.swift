//
//  ContentView.swift
//  StafordStart
//
//  Created by shehan karunarathna on 2022-01-27.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        return
        HStack{
            CardView()
            CardView()
            CardView()
            CardView()
        }
        .padding()
        .foregroundColor(Color.red)
        
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}

struct CardView: View {
    var faceUp:Bool = false
    var body: some View {
       
        return
        ZStack{
            if(faceUp){
                RoundedRectangle(cornerRadius: 25)
                    .fill()
                RoundedRectangle(cornerRadius: 25)
                    .stroke(lineWidth: 3)
                Text("Hello, world!")
                    .padding(.vertical)
            } else {
                RoundedRectangle(cornerRadius: 25)
                    .stroke(lineWidth: 3)
                Text("Hello, world!")
                    .padding(.vertical)
            }
            
        }
       
        
       
    }
}
