//
//  ContentView.swift
//  HomeUtlity
//
//  Created by Suhas Malhotra on 16/06/21.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("log_Status") var status = false
    var body: some View {
        ZStack{
            if status{
                CustomTabBar(viewRouter: ViewRouter())
            } else {
                NavigationView{
                        VStack{
                            Login()
                        }//: VSTACK
                        .navigationBarHidden(true)
                        .navigationBarBackButtonHidden(true)
                }//: NAVIGATION VIEW
            }
        }//: ZSTACK
    }
}


