//
//  Verification.swift
//  HomeUtlity
//
//  Created by Suhas Malhotra on 18/06/21.
//

import SwiftUI

struct Verification: View {
    @ObservedObject var loginData : LoginViewModel
    @Environment(\.presentationMode) var present
    var body: some View {
        VStack{
            VStack{
                HStack{
                    Button(action:{present.wrappedValue.dismiss()}){
                        Image(systemName: "arrow.left")
                            .font(.title2)
                            .foregroundColor(Color("Text"))
                    }//: BUTTON
                    Spacer()
                    
                    Text("Verify Phone Number")
                        .font(.title2)
                        .fontWeight(.bold)
                    Spacer()
                }//: HSTACK
                .padding()
                
                Text("Code send to \(loginData.phoneNumber)")
                    .padding(.bottom)
                Spacer(minLength: 0)
                
                HStack(spacing:15){
                    ForEach(0..<6, id: \.self){index in 
                        CodeView(code: getCodeAtIndex(index: index))
                    }//: FOREACH
                }//: HSTACK
                .padding()
                .padding(.horizontal,20)
                Spacer(minLength: 0)
                
                HStack(spacing:6){
                    Text("Did't receive code?")
                    
                    Button(action:{}){
                        Text("Request Again")
                            .fontWeight(.bold)
                                
                    }//: BUTTON
                }//: HSTACK
                Button(action:{}){
                    Text("Get via Call")
                        .fontWeight(.bold)
                }//: BUTTON
                .padding(.top,6)
                
                NavigationLink(
                    destination: CustomTabBar(viewRouter: ViewRouter()),
                    label: {
                        Text("Verify and Create Account")
                            .padding(.vertical)
                            .foregroundColor(Color("NormalText"))
                            .frame(width: UIScreen.main.bounds.width - 30)
                            .background(Color("Text"))
                            .cornerRadius(15)
                    })
                .padding()
            }//: VSTACK
            .frame(height: UIScreen.main.bounds.height/1.8)
            .cornerRadius(20)
            
            CustomNumberPad(value: $loginData.code, isVerify: true) 
        }//: VSTACK
        .ignoresSafeArea(.all , edges: .bottom)
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
    
    func getCodeAtIndex(index:Int)-> String{
        if loginData.code.count > index{
            let start = loginData.code.startIndex
            let current = loginData.code.index(start, offsetBy: index)
            
            return String(loginData.code[current])
        }
        return ""
    }
}

struct CodeView : View {
    var code : String
    var body: some View{
        VStack(spacing:10){
            Text(code)
                .fontWeight(.bold)
                .font(.title2)
                .frame(height:45)
            Capsule()
                .fill(Color.gray.opacity(0.5))
                .frame(height:4)
        }//: VSTACK
    }
}

