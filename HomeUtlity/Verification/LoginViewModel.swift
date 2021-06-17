//
//  LoginViewModel.swift
//  HomeUtlity
//
//  Created by Suhas Malhotra on 18/06/21.
//

import SwiftUI

class LoginViewModel: ObservableObject {
    @Published var phoneNumber = ""
    
    @Published var code = ""
    
    func getCountryCode() -> String{
        let regionCode = Locale.current.regionCode ?? ""
        return countries[regionCode] ?? ""
    }
}
