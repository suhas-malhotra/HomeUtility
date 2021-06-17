//
//  MoneyCardViews.swift
//  HomeUtlity
//
//  Created by Suhas Malhotra on 17/06/21.
//

import SwiftUI

struct MoneyCardViews: View {
    var body: some View {
        GeometryReader{ geometry in
            
            RoundedRectangle(cornerRadius: 20)
                .fill(Color("MoneyCardsBackground"))
                .frame(width:geometry.size.width , height: geometry.size.height)
                .shadow(color: Color("MoneyCardsLightShadow"), radius: 8, x: -8, y: -8)
                .shadow(color: Color("MoneyCardsDarkShadow"), radius: 8, x: 8, y: 8)
        }//: GEOMETRY READER
        .frame(maxHeight:200)
        .padding()
    }
}

struct MoneyCardViews_Previews: PreviewProvider {
    static var previews: some View {
        MoneyCardViews()
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
    }
}
