//
//  ViewRouter.swift
//  HomeUtlity
//
//  Created by Suhas Malhotra on 16/06/21.
//

import SwiftUI

class ViewRouter : ObservableObject{
    @Published var currentPage : Page = .home
}

enum Page{
    case home
    case chat
    case people
    case weCards
    case add
}
