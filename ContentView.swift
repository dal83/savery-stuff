//
//  ContentView.swift
//  Savery
//
//  Created by Deborah Lilly on 7/21/20.
//  Copyright © 2020 SaveryApp. All rights reserved.
//

import SwiftUI
import GoogleMobileAds
import Firebase

let db = Firestore.firestore()

struct ContentView: View {
    var user = Auth.auth().currentUser
    @State var navigationSetting = true
    @State private var newView: Int? = nil
    @State private var totalMoney = UserDefaults.standard.integer(forKey: "points")
    @State private var globalTotal = 0
    
    private let BUTTON_WIDTH_FACTOR: CGFloat = 0.8
    private let BUTTON_HEIGHT_FACTOR: CGFloat = 0.12
    private let BUTTON_TEXT_COLOR = Color(red: 244/255, green: 252/255, blue: 235/255)
    private let BUTTON_BACKGROUND_COLOR = Color(red: 186/255, green: 209/255, blue: 161/255)
    private let BUTTON_CORNER_RADIUS: CGFloat = 15.0
    private let CUSTOM_FONT = "Muli-Light"
    private let TEXT_SIZE_FACTOR: CGFloat = 0.032

    var body: some View {
        GeometryReader { geometry in
            NavigationView{
                ZStack {
                    // home page background
                    Rectangle()
                        .foregroundColor(Color(red: 163/255, green: 194/255, blue: 131/255))
                        .edgesIgnoringSafeArea(.all)
                    
                    VStack {
                        
                        Spacer()
                        
                        VStack {
                            //Text(self.user?.uid ?? "failed")
                            
                            //amount of $ raised by user
                            Text("Your total points: \(self.totalMoney)")
                                .font(Font.custom(self.CUSTOM_FONT, size: geometry.size.height * self.TEXT_SIZE_FACTOR))
                                .foregroundColor(.white)
                            
                            //global amount of $ raised
                            /*Text("Global points: \(self.globalTotal)")
                                .font(Font.custom(self.CUSTOM_FONT, size: geometry.size.height * self.TEXT_SIZE_FACTOR))
                                .foregroundColor(Color(red: 244/255, green: 252/255, blue: 235/255))*/

                            // logo image
                            Image("applecore")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: geometry.size.height * 0.15)
                        }
                        
                        Spacer()
                        
                        VStack (spacing: geometry.size.height * 0.008) {
                            
                            // 'play' nav link
                            VStack {
                                NavigationLink(destination: QuizGameView(totalPoints: self.$totalMoney), tag: 0, selection: self.$newView) {
                                    EmptyView()
                                }
                                Button (action: {
                                    self.newView = 0
                                    //self.navigationSetting = false
                                })
                                { Text("Play Quiz")
                                    .font(Font.custom("Helvetica-Neue", size: geometry.size.height * self.TEXT_SIZE_FACTOR))
                                    .frame(width: geometry.size.width * (self.BUTTON_WIDTH_FACTOR), height: geometry.size.height * (self.BUTTON_HEIGHT_FACTOR))
                                    .foregroundColor(Color(red: 163/255, green: 194/255, blue: 131/255))
                                }
                                .background(RoundedRectangle(cornerRadius: self.BUTTON_CORNER_RADIUS)
                                .fill(Color(red: 217/255, green: 229/255, blue: 205/255)))
                            }
                            
                            
                            // 'learn more' nav link
                            VStack {
                                NavigationLink(destination: LearnMoreView(), tag: 1, selection: self.$newView) {
                                    EmptyView()
                                }
                                Button (action: {
                                    self.newView = 1
                                    //self.navigationSetting = false
                                })
                                { Text("Learn More")
                                    .font(Font.custom(self.CUSTOM_FONT, size: geometry.size.height * self.TEXT_SIZE_FACTOR))
                                    .frame(width: geometry.size.width * (self.BUTTON_WIDTH_FACTOR), height: geometry.size.height * (self.BUTTON_HEIGHT_FACTOR))
                                    .foregroundColor(self.BUTTON_TEXT_COLOR)
                                    
                                }
                                .background(RoundedRectangle(cornerRadius: self.BUTTON_CORNER_RADIUS)
                                .fill(self.BUTTON_BACKGROUND_COLOR))
                                
                            }
                            
                            // 'DONATE' nav link
                            VStack {
                                NavigationLink(destination: DonateView(), tag: 2, selection: self.$newView) {
                                    EmptyView()
                                }
                                Button (action: {
                                    //self.navigationSetting = false
                                    //self.newView = 2
                                    UIApplication.shared.open(URL(string: "https://secure.feedingamerica.org/site/Donation2;jsessionid=00000000.app20126a?idb=2054553565&df_id=26876&26876.donation=form1&mfc_pref=T&NONCE_TOKEN=ABFC0ADD397130C62A47F7A3EAC62208&s_channel=google&s_onsite_promo=MainNav_Donate&s_subsrc=https://www.feedingamerica.org/&s_src=W208ORGSC&26876_donation=form1&s_referrer=google&_ga=2.82466710.1675573247.1597370054-32005431.1597370054")!)
                                })
                                { Text("Donate")
                                    .font(Font.custom(self.CUSTOM_FONT, size: geometry.size.height * self.TEXT_SIZE_FACTOR))
                                    .frame(width: geometry.size.width * (self.BUTTON_WIDTH_FACTOR), height: geometry.size.height * (self.BUTTON_HEIGHT_FACTOR))
                                    .foregroundColor(self.BUTTON_TEXT_COLOR)
                                }
                                .background(RoundedRectangle(cornerRadius: self.BUTTON_CORNER_RADIUS)
                                .fill(self.BUTTON_BACKGROUND_COLOR))
                            }
                            
                            // 'in the news' nav link
                            /*VStack {
                                NavigationLink(destination: NewsView(), tag: 3, selection: self.$newView) {
                                    EmptyView()
                                }
                                Button (action: {
                                    self.navigationSetting = false
                                    self.newView = 3
                                })
                                { Text("in the news")
                                    .font(Font.custom(self.CUSTOM_FONT, size: geometry.size.height * self.TEXT_SIZE_FACTOR))
                                    .frame(width: geometry.size.width * (self.BUTTON_WIDTH_FACTOR), height: geometry.size.height * (self.BUTTON_HEIGHT_FACTOR))
                                    .foregroundColor(.white)
                                }
                                .background(RoundedRectangle(cornerRadius: self.BUTTON_CORNER_RADIUS)
                                .fill(self.BUTTON_BACKGROUND_COLOR))
                            }*/
                        }
                        
                        
                        Spacer()
                        
                        //adverts on bottom of screen
                        VStack {
                            // double banner ad
                            HStack {
                                Spacer()
                                GADBannerViewController()
                                    .frame(width: kGADAdSizeBanner.size.width, height: kGADAdSizeBanner.size.height)
                                Spacer()
                            }
                            HStack {
                                Spacer()
                                GADBannerViewController()
                                    .frame(width: kGADAdSizeBanner.size.width, height: kGADAdSizeBanner.size.height)
                                Spacer()
                            }
                        }
                        
                    }
                }
                .onAppear() {
                    //self.spot = whichQuestion(listOfQuestions: self.fetchedQuestions)
                    db.collection("users").addSnapshotListener { querySnapshot, error in
                        guard let documents = querySnapshot?.documents else {
                            print ("error fetching")
                            return
                        }
                        let amount = documents.map { $0["moneyRaised"]! }
                        self.globalTotal = 0
                        for i in 0..<amount.count {
                            self.globalTotal += amount[i] as? Int ?? 0
                        }
                    }
                    
                    self.navigationSetting = true
                }
                    
                .navigationBarTitle(Text("Home"), displayMode: .inline)
                //.navigationBarHidden(self.navigationSetting)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
