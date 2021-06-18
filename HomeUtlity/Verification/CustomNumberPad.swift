//
//  CustomNumberPad.swift
//  HomeUtlity
//
//  Created by Suhas Malhotra on 18/06/21.
//

import SwiftUI

struct CustomNumberPad: View {
    @Binding var value: String
    var rows = ["1", "2" , "3","4","5","6","7","8","9","","0","delete.left"]
    var isVerify: Bool
    var body: some View {
        GeometryReader{reader in
            VStack{
                LazyVGrid(columns:Array(repeating: GridItem(.flexible(),spacing: 20), count: 3),spacing: 15){
                    ForEach(rows,id: \.self){value in
                        Button(action:{buttonAction(value: value)}){
                            
                            ZStack{
                                if value == "delete.left"{
                                    Image(systemName: value)
                                        .font(.title)
                                        .foregroundColor(Color("Text"))
                                }else {
                                    Text(value)
                                        .font(.title2)
                                        .fontWeight(.bold)
                                        .foregroundColor(Color("Text"))
                                }
                            }//: ZSTACK
                            .frame(width: getWidth(frame: reader.frame(in: .global)), height:getHeight(frame: reader.frame(in: .global)))
                            .cornerRadius(10)
                        }//: BUTTON
                        .disabled(value == "" ? true : false)
                    }//: FOREACH
                }//: LAZYVGRID
            }//: VSTACK
        }//: GEOMETRY READER
        .padding()
    }
    func getWidth(frame: CGRect) -> CGFloat{
        let width = frame.width
        
        let actualWidth = width - 40
        
        return actualWidth / 3
    }
    func getHeight(frame: CGRect)-> CGFloat{
        let height = frame.height
        
        let actualHeight = height - 30
        
        return actualHeight / 4
        
    }

    func buttonAction(value: String){
        if value == "delete.left" && self.value != "" {
            self.value.removeLast()
        }
        if value != "delete.left"{
            if isVerify{
                if self.value.count < 6 {
                    self.value.append(value)
                }
            }else{
                self.value.append(value)
            }
        }
    }
}

