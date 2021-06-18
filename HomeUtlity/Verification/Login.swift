//
//  Login.swift
//  HomeUtlity
//
//  Created by Suhas Malhotra on 18/06/21.
//

import SwiftUI

struct Login: View {
    @StateObject var loginData = LoginViewModel()
    @State var isSmall = UIScreen.main.bounds.height < 750
    var body: some View {
        ZStack{
            VStack {
                VStack {
                    Text("Continue with Phone")
                        .font(.title2)
                        .fontWeight(.bold)
                    Image("Logo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding()
                    Text("You will receive a 6 digit code\n to verify next")
                        .multilineTextAlignment(.center)
                        .font(isSmall ? .none : .title2)
                        .padding()
                    //PHONE NUMBER FEILD
                    HStack{
                        VStack(alignment: .leading, spacing:6){
                            Text("Enter your mobile number")
                                .font(.caption)
                            Text("+91 \(loginData.phoneNumber)")
                                .font(.title2)
                                .fontWeight(.bold)
                        }//: VSTACK
                        Spacer(minLength: 0)
                        
                        NavigationLink(destination: Verification(loginData: loginData),isActive: $loginData.gotoVerify){
                            Text("")
                                .hidden()
                           
                        }
                        Button(action: loginData.sendCode){
                            Text("Continue")
                                .foregroundColor(Color("NormalText"))
                                .padding(.vertical,18)
                                .padding(.horizontal,38)
                                .background(Color("TabBarIcon"))
                                .cornerRadius(15)
                        }//: BUTTON
                        .disabled(loginData.phoneNumber == "" ? true : false)
                    }//: HSTACK
                    .padding()
                    .cornerRadius(15)
                    .shadow(color: Color("Text").opacity(0.1), radius: 5, x: 0, y: -5)
                }//: VSTACK
                .frame(height: UIScreen.main.bounds.height/1.8)
                CustomNumberPad(value: $loginData.phoneNumber, isVerify: false)
          
            }//: VSTACK
            .ignoresSafeArea(.all ,edges: .bottom)
            
            if loginData.error{
                AlertView(msg: loginData.errorMessage, show: $loginData.error)
            }
        }//: ZSTACK
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
            .preferredColorScheme(.dark)
            
            
    }
}
