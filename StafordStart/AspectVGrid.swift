//
//  AspectVGrid.swift
//  StafordStart
//
//  Created by shehan karunarathna on 2022-01-28.
//

import SwiftUI

struct AspectVGrid<Item, ItemView>: View where ItemView:View, Item:Identifiable{
    var items: [Item]
    var spectRatio : CGFloat
    var content: (Item) -> ItemView
    
    init( items: [Item],spectRatio : CGFloat, @ViewBuilder content: @escaping (Item) -> ItemView){
        self.items = items
        self.spectRatio = spectRatio
        self.content = content
    }
    var body: some View {
        var width:CGFloat = 70
        
        ScrollView{
            LazyVGrid(columns:[GridItem(.adaptive(minimum: 70))]){
                ForEach(items) { item in
                    content(item)
                        .aspectRatio(spectRatio, contentMode: .fit)
                }

            }
            .padding(.all)
        }
    }
    
//    private func widthThatFits(itemCount:Int, size : CGSize, itemRatio:CGFloat) -> CGFloat{
//        var columnCount = 1
//        var rowCount = itemCount
//        repeat {
//            let itemWidth = size.width / CGFloat(columnCount)
//            let itemHeight = itemWidth / itemRatio
//            if CGFloat(rowCount) = itemHeight < size.height {
//                break
//            }
//            columnCount +=1
//            rowCount = (itemCount + (columnCount-1))
//        }
//
//    }
}

//struct AspectVGrid_Previews: PreviewProvider {
//    static var previews: some View {
//        AspectVGrid()
//    }
//}
