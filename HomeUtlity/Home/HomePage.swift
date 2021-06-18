//
//  HomePage.swift
//  HomeUtlity
//
//  Created by Suhas Malhotra on 17/06/21.
//

import SwiftUI
import Firebase

struct HomePage: View {
    @State private  var notification = false
    @AppStorage("log_Status") var status = false
    var body: some View {
        NavigationView{
            GeometryReader{ geometry in
                ScrollView(.vertical,showsIndicators:false){
                    VStack(alignment: .leading) {
                        HStack {
                            VStack(alignment: .leading , spacing:10) {
                                Text("Hello Suhas")
                                    .font(.system(size: 40))
                                    .fontWeight(.bold)
                                Text("Welcome to your Home")
                            }//: VSTACK
                            .foregroundColor(Color("Text"))
                            Spacer(minLength: 0)
                            NavigationLink(destination: ProfilePage(),label:{
                                ZStack{
                                    Circle()
                                        .foregroundColor(.white)
                                        .frame(width:  geometry.size.width/10, height:  geometry.size.width/10)
                                        .shadow(radius: 4)
                                    Image(systemName: "person")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width:  geometry.size.width/15, height:  geometry.size.width/15)
                                        .offset(y:-2)
                                        .foregroundColor(.black)
                                }//: ZSTACK
                              
                            })//: NAVIGATION LINK
                            .padding(.horizontal,10)
                            Button(action: {
                                try? Auth.auth().signOut()
                                withAnimation{status = false}
                            },label:{
                                ZStack{
                                    Circle()
                                        .foregroundColor(.white)
                                        .frame(width:  geometry.size.width/10, height:  geometry.size.width/10)
                                        .shadow(radius: 4)
                                    if notification == true {
                                        Image(systemName: "bell.fill")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width:  geometry.size.width/15, height:  geometry.size.width/15)
                                            .offset(y:-2)
                                            .foregroundColor(.black)
                                    } else {
                                        Image(systemName: "bell")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width:  geometry.size.width/15, height:  geometry.size.width/15)
                                            .offset(y:-2)
                                            .foregroundColor(.black)
                                    }
                                }//: ZSTACK
                            })//: BUTTON
                           
                        }//: HSTACK
                        .padding()
                     
                        ReminderView()
                            .offset(y:-20)
                        HStack{
                            FamilyMemberView()
                            WarrantyCardView()
                        }
                        .offset(y:-50)
                        PolicyView()
                            .offset(y:-75)
                        AddReminderView()
                            .offset(y:-85)
                        HStack{
                            FamilyMemberView()
                            WarrantyCardView()
                        }
                        .offset(y:-95)
                        
                    }//: VSTACK
                    .navigationBarTitle("")
                    .navigationBarHidden(true)  
                }//: SCROLLVIEW
            }//: GEOMETRY READER
        } //: NAVIGATION VIEW
    }
}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
            .preferredColorScheme(.light)
    }
}
