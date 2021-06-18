//
//  LoginViewModel.swift
//  HomeUtlity
//
//  Created by Suhas Malhotra on 18/06/21.
//

import SwiftUI
import Firebase

class LoginViewModel: ObservableObject {
    @Published var phoneNumber = ""
    
    @Published var code = ""

    @Published var errorMessage = ""
    @Published var error = false

    @Published var CODE = ""

    @Published var gotoVerify = false
    
    @AppStorage("log_Status") var status = false
    
    @Published var loading = false
    
    func getCountryCode() -> String{
        let regionCode = Locale.current.regionCode ?? ""
        return countries[regionCode] ?? ""
    }
    func sendCode(){
        
        Auth.auth().settings?.isAppVerificationDisabledForTesting = true
        
        let number = "+91\(phoneNumber)"
        PhoneAuthProvider.provider().verifyPhoneNumber(number, uiDelegate: nil){
            (CODE,err) in
            if let error = err{
                self.errorMessage = error.localizedDescription
                withAnimation{ self.error.toggle()}
                return
            }
            self.CODE = CODE ?? ""
            self.gotoVerify = true
        }
    }
    
    func verifyCode(){
        let credential = PhoneAuthProvider.provider().credential(withVerificationID: self.CODE, verificationCode: code)
        loading = true
        Auth.auth().signIn(with: credential){ (result , err) in
            self.loading = false
            if let error = err {
                self.errorMessage = error.localizedDescription
                withAnimation{ self.error.toggle()}
                return
            }
            withAnimation{self.status = true}
        }
    }
    
    func requestCode(){
        sendCode()
        withAnimation{
            self.errorMessage = "Code sent successfully"
            self.error.toggle()
        }
    }
}
