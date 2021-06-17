//
//  ContentView.swift
//  HomeUtlity
//
//  Created by Suhas Malhotra on 16/06/21.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        CustomTabBar(viewRouter: ViewRouter())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
    ContentView()
            .preferredColorScheme(.light)
    }
}

