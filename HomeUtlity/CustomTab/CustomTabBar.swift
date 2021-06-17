//
//  CustomTabBar.swift
//  HomeUtlity
//
//  Created by Suhas Malhotra on 16/06/21.
//

import SwiftUI

struct CustomTabBar: View {
    @StateObject var viewRouter :ViewRouter
    var assignedPage: Page = .home
    var body: some View {
        GeometryReader{ geometry in
            VStack{
                Spacer()
                switch viewRouter.currentPage {
                case .home:
                   HomePage()
                case .chat:
                    Text("chat")
                case .people:
                    Text("People")
                case .weCards:
                  MoneyCardPage()
                case .add:
                    Text("Add")
                }//: SWITCH CASE
                Spacer()
                HStack{
                    TabBarIcon(viewRouter: viewRouter,assignedPage: .chat,width: geometry.size.width/5, height: geometry.size.height/28, systemIconName: "homekit", tabName: "Chat")//: VSTACK
                    TabBarIcon(viewRouter: viewRouter,assignedPage: .people , width: geometry.size.width/5, height: geometry.size.height/28, systemIconName: "person.fill", tabName: "People")//: VSTACK
                    ZStack{
                        Circle()
                            .foregroundColor(.white)
                            .frame(width:  geometry.size.width/6, height:  geometry.size.width/6)
                            .shadow(radius: 4)
                        Image(systemName: "homekit")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width:  geometry.size.width/8, height:  geometry.size.width/8)
                            .offset(y:-2)
                            .foregroundColor(.black)
                    }//: ZSTACK
                    .offset(y:-geometry.size.height/8/2)
                    .onTapGesture {
                        withAnimation(.linear){
                            viewRouter.currentPage = assignedPage
                        }
                    }
                    TabBarIcon(viewRouter: viewRouter,assignedPage: .add,width: geometry.size.width/5, height: geometry.size.height/28, systemIconName: "plus", tabName: "Add")//: VSTACK
                    TabBarIcon(viewRouter: viewRouter,assignedPage: .weCards,width: geometry.size.width/5, height: geometry.size.height/28, systemIconName: "car", tabName: "WeCards")//: VSTACK
                }//: HSTACK
                .frame(width: geometry.size.width, height: geometry.size.height/8)
                .background(Color("TabBarBackground"))
            
                .shadow(radius: 2)
            }//: VSTACK
            .edgesIgnoringSafeArea(.bottom)
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        }//: GEOMETRY READER
    }
}
struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabBar(viewRouter: ViewRouter())
            .preferredColorScheme(.light)
    }
}
struct TabBarIcon: View {
    @StateObject var viewRouter: ViewRouter
    let assignedPage: Page
    let width , height : CGFloat
    let systemIconName , tabName: String
    var body: some View {
        VStack{
            Image(systemName: systemIconName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: width, height: height)
                .padding(.top,10)
            Text(tabName)
                .font(.footnote)
            Spacer()
        }
        .padding(.horizontal,-4)
        .onTapGesture {
                viewRouter.currentPage = assignedPage
        }
        .foregroundColor(viewRouter.currentPage == assignedPage ? Color("TabBarIconPressed") : Color("TabBarIcon"))
    }
}
