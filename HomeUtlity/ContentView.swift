//
//  ContentView.swift
//  HomeUtlity
//
//  Created by Suhas Malhotra on 16/06/21.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationView{
            VStack{
                Login()
            }
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        }
       
//        CustomTabBar(viewRouter: ViewRouter())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
    ContentView()
            .preferredColorScheme(.light)
    }
}

