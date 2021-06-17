//
//  MoneyCardView.swift
//  HomeUtlity
//
//  Created by Suhas Malhotra on 17/06/21.
//

import SwiftUI

struct MoneyCard<Content>: View where Content:View {
    
    var content: () -> Content
    
    var body: some View {
       content()
    }
}
struct MoneyCardFront: View {
    var body: some View {
        GeometryReader{geometry in
            VStack(alignment: .leading) {
                HStack(alignment: .top){
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(Color.white)
                    Spacer()
                    Text("VISA")
                        .foregroundColor(Color.white)
                        .font(.system(size: 24))
                        .fontWeight(.bold)
                }//: HSTACK
                Spacer()
                Text("**** **** **** 1875")
                    .foregroundColor(Color.white)
                    .font(.system(size: 32))
                Spacer()
                HStack{
                    VStack(alignment: .leading ){
                        Text("CARD HOLDER")
                            .font(.caption)
                            .fontWeight(.bold)
                            .foregroundColor(Color.gray)
                        Text("Suhas Malhotra")
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                    }//: VSTACK
                    Spacer()
                    VStack{
                        Text("Expiry Date")
                            .font(.caption)
                            .fontWeight(.bold)
                            .foregroundColor(Color.gray)
                        Text("07/26")
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                    }//: VSTACK
                }//: HSTACK
               
            }//: VSTACK
            .padding()
            .frame(width:geometry.size.width , height: geometry.size.height)
            .background(LinearGradient(gradient: Gradient(colors: [Color.purple, Color.blue]), startPoint: .topLeading, endPoint: .bottomTrailing))
            .cornerRadius(10)
        }//: GEOMETRY READER
        .frame(height:200)
    }
}
struct MoneyCardBack: View {
    var body: some View {
        GeometryReader{geometry in
            VStack {
                HStack{
                    Spacer()
                    Text("123")
                        .foregroundColor(Color.black)
                        .rotation3DEffect(
                            .degrees(180),
                            axis: (x: 1.0, y: 0.0, z: 0.0))
                        .padding(5)
                        .frame(width: 100, height: 20)
                        .background(Color.white)
                  
                }.padding()
                Spacer()
                Rectangle()
                    .frame(maxWidth: .infinity , maxHeight: 20)
            }//: VSTACK
            .padding(.vertical)
            .frame(width:geometry.size.width , height: geometry.size.height)
            .background(LinearGradient(gradient: Gradient(colors: [Color.yellow, Color.pink]), startPoint: .leading, endPoint: .trailing))
            .cornerRadius(10)
        }//: GEOMETRY READER
        .frame(height:200)
       
    }
}





struct MoneyCard_Previews: PreviewProvider {
    static var previews: some View {
        MoneyCard<MoneyCardBack>(content: {MoneyCardBack()})
            .previewLayout(.sizeThatFits)
           
    }
}
