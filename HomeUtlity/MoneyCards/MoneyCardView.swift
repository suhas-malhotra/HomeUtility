//
//  MoneyCardView.swift
//  HomeUtlity
//
//  Created by Suhas Malhotra on 17/06/21.
//

import SwiftUI

struct MoneyCardView: View {
    @State private var degrees:Double = 0
    @State private var flipped : Bool = false
    var body: some View {
        MoneyCard{
            VStack {
                Group{
                    if flipped {
                        MoneyCardBack()
                    } else {
                        MoneyCardFront()
                    }
                }//: GROUP
            }.rotation3DEffect(
                .degrees(degrees),
                axis: (x: 1.0, y: 0.0, z: 0.0)
            )
            
           
        }
        .padding(5)
        .onTapGesture {
            withAnimation{
                degrees += 180
                flipped.toggle()
            }//: WITH ANIMATIOn
         
        }//: ON TAP
    }
}

struct MoneyCardView_Previews: PreviewProvider {
    static var previews: some View {
        MoneyCardView()
            .previewLayout(.sizeThatFits)
    }
}
