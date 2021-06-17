//
//  PolicyView.swift
//  HomeUtlity
//
//  Created by Suhas Malhotra on 17/06/21.
//

import SwiftUI

struct PolicyView: View {
    var body: some View {
        GeometryReader{ geometry in
            NavigationLink(destination: PolicyPage(), label:{
                VStack {
                    Text("Policies")
                        .font(.title)
                        .fontWeight(.bold)
                        .shadow(radius: 20)
                        .foregroundColor(.white)
                }//: VSTACK
                .frame(width: geometry.size.width, height: geometry.size.height)
                .background(Color.purple)
                .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
                .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 10)
                .cornerRadius(10)
            })
        }//: GEOMETRY READER
        .frame(height:50)
        .padding()
    }
}

struct PolicyView_Previews: PreviewProvider {
    static var previews: some View {
        PolicyView()
    }
}
