//
//  Cardify.swift
//  StafordStart
//
//  Created by shehan karunarathna on 2022-01-28.
//

import SwiftUI
struct Cardify : ViewModifier , AnimatableModifier{
//    var faceUp:Bool
    var rotation :Double
    init(faceUp:Bool){
        rotation = faceUp ? 0 : 180
    }
    var animatableData: Double {
        get{
            rotation
        }
        
        set{
            rotation = newValue
        }
    }
    
    func body(content: Content) -> some View {
        ZStack{
            let baseShape = RoundedRectangle(cornerRadius: DrawingConstants.cornerRadius)
            if(rotation < 90){
                baseShape.fill(.white)
                baseShape.stroke(lineWidth: DrawingConstants.lineWidth)
                
              
            }
            else {
                baseShape.fill()
            }
            content.opacity(rotation < 90 ? 1 : 0)
            
        }.rotation3DEffect(Angle.degrees(rotation), axis: (x: 0, y: 1, z: 0))
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


