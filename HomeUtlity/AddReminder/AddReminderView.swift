//
//  AddReminderView.swift
//  HomeUtlity
//
//  Created by Suhas Malhotra on 17/06/21.
//

import SwiftUI

struct AddReminderView: View {
    @State private var isShowingRemainder:Bool = false
    var body: some View {
        GeometryReader{ geometry in
           
            Button(action: {
                isShowingRemainder = true
            } ){
                VStack {
                    Text("Add A Remainder")
                        .font(.title)
                        .fontWeight(.bold)
                        .shadow(radius: 20)
                        .foregroundColor(.white)
                }//: VSTACK
                .frame(width: geometry.size.width, height: geometry.size.height)
                .background(Color.orange)
                .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
                .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 10)
                .cornerRadius(10)
                .sheet(isPresented: $isShowingRemainder){
                    AddReminderPage()
                }
            }
        }//: GEOMETRY READER
        .frame(height:50)
        .padding(.horizontal)
    }
}

struct AddReminderView_Previews: PreviewProvider {
    static var previews: some View {
        AddReminderView()
    }
}
