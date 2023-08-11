//
//  LearnMoreFormat.swift
//  Savery
//
//  Created by Deborah Lilly on 8/22/20.
//  Copyright © 2020 SaveryApp. All rights reserved.
//


import Foundation
import SwiftUI

extension Int: Identifiable {
    public var id: Int { self }
}

struct LearnMoreFormat: View {
    @State var isPresented = false
    @State var selected = "Error"
    var row: [Int]
    var geoW: CGFloat
    var geoH: CGFloat
    let textColor = Color(red: 244/255, green: 252/255, blue: 235/255)
    let darkGreen = Color(red: 163/255, green: 194/255, blue: 131/255)
    let lightGreen = Color(red: 186/255, green: 209/255, blue: 161/255)
    let CUSTOM_FONT = "Helvetica Neue Light"
    let titles = ["food waste prevention", "where should food waste go?"]
    @State var methods: [methodItem]
    @State var specific: Int? = nil
    
    var body: some View {
        ForEach(row, id:\.self) { button in
            HStack(spacing: self.geoW * 0.012) {
                
                
                Button(action: {
                    self.selected = self.methods[button].description
                    self.isPresented.toggle()
                    self.specific = button
                    
                }) { ZStack {
                    Image(self.methods[button].imageName)
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    VStack{
                        Spacer()
                        Text("\(self.methods[button].methodName)")
                            .font(Font.custom(self.CUSTOM_FONT, size: self.geoH * 0.035))
                            .font(.body)
                            .foregroundColor(self.textColor)
                            .multilineTextAlignment(.center)
                            .padding(.top, self.geoH * 0.2)
                        Spacer()
                    }
                }
                .frame(width: self.geoW * 0.482, height: self.geoW * 0.482)
                .clipShape(RoundedRectangle(cornerRadius: 16))
                }
                
                .sheet(item: self.$specific, onDismiss: {self.isPresented = false}) { d in
                    //Text(self.methods[$0].methodName)
                    ZStack{
                        Rectangle()
                            .foregroundColor(Color(red: 163/255, green: 194/255, blue: 131/255))
                            .edgesIgnoringSafeArea(.all)
                        ScrollView {
                            VStack {
                                //category title
                                Text(self.methods[d].methodName)
                                    .font(Font.custom(self.CUSTOM_FONT, size: geoH * 0.06 ))
                                    .bold()
                                    .foregroundColor(self.textColor)
                                    .multilineTextAlignment(.center)
                                    .padding(3)
                                
                                Image(self.methods[d].smallImage)
                                    .renderingMode(.original)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: self.geoW * 0.4, height: self.geoW * 0.25)
                                    .clipped()
                                
                                Text(self.methods[d].description)
                                    .multilineTextAlignment(.leading)
                                    .font(Font.custom(self.CUSTOM_FONT, size: geoH * 0.03 ))
                                    .foregroundColor(self.textColor)
                                    .padding(15)
                                
                                Text("What can you do to help?")
                                    .bold()
                                    .multilineTextAlignment(.center)
                                    .font(Font.custom(self.CUSTOM_FONT, size: geoH * 0.036))
                                    .foregroundColor(self.textColor)
                                    .padding(5)
                                
                                Text(self.methods[d].actionItems)
                                    .multilineTextAlignment(.leading)
                                    .font(Font.custom(self.CUSTOM_FONT, size: geoH * 0.03 ))
                                    .foregroundColor(self.textColor)
                                    .padding(15)
                                
                                VStack(spacing: 10) {
                                    ForEach((0..<(self.methods[d].links.count)), id: \.self) {
                                        self.methods[d].links[$0]
                                            .font(Font.custom(self.CUSTOM_FONT, size: geoH * 0.03 ))
                                            .foregroundColor(Color(red: 163/255, green: 194/255, blue: 131/255))
                                            .multilineTextAlignment(.center)
                                            .padding()
                                            .frame(width: self.geoW * 0.92)
                                            .background(RoundedRectangle(cornerRadius: 15)
                                                            .fill(self.textColor))
                                    }
                                }

                                
                            }.frame(width: self.geoW)
                            
                        }.padding()
                    }
                }
                
            }
        }
        /*
                .sheet(isPresented: self.$isPresented, onDismiss: {
                    self.isPresented = false
                }) {
                    ZStack{
                        Rectangle()
                            .foregroundColor(Color(red: 163/255, green: 194/255, blue: 131/255))
                            .edgesIgnoringSafeArea(.all)
                        ScrollView {
                            VStack {
                                Text("\(self.methods[button].methodName)")
                                    .font(.body)
                                Text("\(button)")
                                
                                self.methods[button].links[0]
                            }
                        }.padding()
                    }
            }*/
        
    }
}
