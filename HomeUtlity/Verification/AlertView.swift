//
//  AlertView.swift
//  HomeUtlity
//
//  Created by Suhas Malhotra on 18/06/21.
//

import SwiftUI

struct AlertView: View {
    var msg: String
    @Binding var show : Bool
    var body: some View {
        VStack(alignment: .leading, spacing: 15, content: {
            Text("Message")
                .fontWeight(.bold)
                .foregroundColor(.gray)
            Text(msg)
                .foregroundColor(.gray)
            Button(action:{
               show.toggle()
            }, label: {
                Text("Close")
                    .foregroundColor(.black)
                    .padding(.vertical)
                    .frame(width: UIScreen.main.bounds.width - 100)
                    .cornerRadius(15)
                    .background(Color(.yellow))
            })//: BUTTON
            .frame(alignment: .center)
        })//: VSTACK
        .padding()
        .background(Color.white)
        .cornerRadius(15)
        .padding(.horizontal,25)
        .frame(maxWidth: .infinity , maxHeight: .infinity)
        .background(Color.black.opacity(0.3).ignoresSafeArea())
    }
}

