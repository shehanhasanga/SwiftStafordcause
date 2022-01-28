//
//  Cardify.swift
//  StafordStart
//
//  Created by shehan karunarathna on 2022-01-28.
//

import SwiftUI
struct Cardify : ViewModifier {
    var faceUp:Bool
    func body(content: Content) -> some View {
        ZStack{
            let baseShape = RoundedRectangle(cornerRadius: DrawingConstants.cornerRadius)
            if(faceUp){
                baseShape.fill(.white)
                baseShape.stroke(lineWidth: DrawingConstants.lineWidth)
                
              
            }
            else {
                baseShape.fill()
            }
            content.opacity(faceUp ? 1 : 0)
            
        }
    }
    private struct DrawingConstants{
        static let cornerRadius : CGFloat = 25
        static let lineWidth : CGFloat = 3
        static let fontScale : CGFloat = 0.6
    }
}

extension View{
    func cardify(faceup:Bool) -> some View{
        return self.modifier(Cardify(faceUp: faceup))
    }
}


