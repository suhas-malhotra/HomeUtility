//
//  MoneyCardPage.swift
//  HomeUtlity
//
//  Created by Suhas Malhotra on 17/06/21.
//

import SwiftUI

struct MoneyCardPage: View {
   
    var body: some View {
        VStack(alignment: .leading){
            Text("YOUR MONEY CARDS")
                .font(.system(size: 32))
                .fontWeight(.bold)
                .padding(.horizontal)
                .offset(y:20)
            ScrollView{
                VStack{
                    MoneyCardView()
                    MoneyCardView()
                    MoneyCardView()
                }//: VSTACK
            }//: SCROLL VIEW
            .offset(y:15)
            Spacer()
        }//: VSTACK
    }
}

struct MoneyCardPage_Previews: PreviewProvider {
    static var previews: some View {
        MoneyCardPage()
    }
}
