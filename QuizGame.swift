//
//  QuizGame.swift
//  Savery
//
//  Created by Deborah Lilly on 7/21/20.
//  Copyright © 2020 SaveryApp. All rights reserved.
//

import Foundation
import SwiftUI
import GoogleMobileAds
import Firebase
import FirebaseFirestore

struct QuizGameView: View {
    @State var fetchedQuestions: [QuestionItem] = [] // holds list of question items retrieved from database
    @State var spot: Int = 0 // which question item is to be displayed
    @State var showSource = false // enables alert with source to be shown
    @State private var showAnswer = false // when true, the check or ex will appear to show whether the user answered the question correctly or incorrectly
    @State private var isCorrect = false // when true, user answered trivia question correctly; when false, user answered trivia question incorrectly
    @State private var pointsEarned = 0 // points earned by user this round
    @Binding var totalPoints: Int // total money raised by this user
    private let POINT_VALUE = 1 // money earned per question
    
    private let BUTTON_WIDTH_FACTOR: CGFloat = 0.8
    private let BUTTON_HEIGHT_FACTOR: CGFloat = 0.11
    private let BUTTON_TEXT_COLOR = Color(red: 244/255, green: 252/255, blue: 235/255)
    private let BUTTON_BACKGROUND_COLOR = Color(red: 186/255, green: 209/255, blue: 161/255)
    private let BUTTON_CORNER_RADIUS: CGFloat = 15.0
    private let CUSTOM_FONT = "Helvetica Neue Light"
    
    private let CHECKMARK_COLOR = Color(red: 68/255, green: 146/255, blue: 86/255)
    private let EX_COLOR = Color(red: 146/255, green: 68/255, blue: 68/255)
    
    var body: some View {
        // using GeometryReader to size different elements
        GeometryReader { geometry in
            
            ZStack {
                //background
                Rectangle()
                    .foregroundColor(Color(red: 163/255, green: 194/255, blue: 131/255))
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                                        
                    if !(self.fetchedQuestions.isEmpty) {
                        
                        VStack {
                            Spacer()
                            
                            // question text
                            Text(self.fetchedQuestions[self.spot].question)
                                .foregroundColor(Color(red: 163/255, green: 194/255, blue: 131/255))
                                .font(Font.custom(self.CUSTOM_FONT, size: geometry.size.height * 0.28 * (self.BUTTON_HEIGHT_FACTOR)))
                                .bold()
                                .multilineTextAlignment(.center)
                                .padding()
                                .frame(width: geometry.size.width * (self.BUTTON_WIDTH_FACTOR), height: geometry.size.height * 2.6 * (self.BUTTON_HEIGHT_FACTOR))
                                .background( //.overlay(
                                    RoundedRectangle(cornerRadius: 16)
                                        .fill(Color(red: 244/255, green: 252/255, blue: 235/255)))
                            
                            Spacer()
                            
                            // answer buttons
                            VStack(spacing: geometry.size.height * 0.008) {
                                ForEach(self.fetchedQuestions[self.spot].getOrder(), id: \.self) { num in
                                    Button(action: {
                                        
                                        // don't check answer if the check/ex is currently being displayed
                                        if (!self.showAnswer) {
                                            // checks if this button is correct answer
                                            if (self.fetchedQuestions[self.spot].getAll()[num] == self.fetchedQuestions[self.spot].correctAns) {
                                                
                                                self.pointsEarned += self.POINT_VALUE
                                                self.totalPoints += self.POINT_VALUE
                                                UserDefaults.standard.set(self.totalPoints, forKey: "points")
                                                
                                                self.isCorrect = true
                                                
                                                
                                                /*let databasePoint = Auth.auth().currentUser?.uid ?? "failed"
                                                 db.collection("users").document(databasePoint).setData([
                                                 "moneyRaised": self.totalPoints])*/
                                                
                                                print(self.fetchedQuestions.map({ $0.question }))
                                                
                                                
                                            } else {
                                                print("wrong")
                                                self.isCorrect = false
                                                
                                                // action when incorrect
                                            }
                                            
                                            withAnimation(.easeIn(duration: 0.5), {
                                                self.showAnswer = true
                                            })
                                            
                                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                                                self.showAnswer = false // hide check/ex symbol
                                                if (self.isCorrect) { self.fetchedQuestions.remove(at: self.spot) } // prevents question item from being repeated
                                                self.spot = whichQuestion(listOfQuestions: self.fetchedQuestions) // display new trivia question
                                                
                                            }
                                        }
                                        
                                        
                                        // find a new question item by assigning a random index of fetchedQuestions to spot
                                        
                                    }) { Text(self.fetchedQuestions[self.spot].getAll()[num])
                                        .font(Font.custom(self.CUSTOM_FONT, size: geometry.size.height * 0.225 * (self.BUTTON_HEIGHT_FACTOR)))
                                        .multilineTextAlignment(.center)
                                        .padding(8)
                                        .frame(width: geometry.size.width * (self.BUTTON_WIDTH_FACTOR), height: geometry.size.height * (self.BUTTON_HEIGHT_FACTOR))
                                        .foregroundColor(self.BUTTON_TEXT_COLOR)
                                    }
                                    .background(RoundedRectangle(cornerRadius: self.BUTTON_CORNER_RADIUS)
                                                    .fill(self.BUTTON_BACKGROUND_COLOR))
                                }
                            }
                            
                            
                        }
                    } else {
                        VStack {
                            Spacer()
                            Text ("Loading...")
                                .foregroundColor(Color(red: 163/255, green: 194/255, blue: 131/255))
                                .font(Font.custom(self.CUSTOM_FONT, size: geometry.size.height * 0.28 * (self.BUTTON_HEIGHT_FACTOR)))
                            Spacer()
                        }
                    }
                    
                    
                    Spacer()
                    
                    // checkmark, score, and ex
                    HStack{
                        
                        // checkmark
                        Image(systemName: "checkmark.circle.fill")
                            .foregroundColor(self.CHECKMARK_COLOR)
                            .font(.system(size: geometry.size.height * 0.075))
                            .opacity((self.showAnswer && self.isCorrect) ? 1 : 0)
                            .animation(Animation.easeOut)
                        
                        // score
                        Text("\(self.pointsEarned)")
                            .foregroundColor(self.BUTTON_TEXT_COLOR)
                            .font(Font.custom(self.CUSTOM_FONT, size: geometry.size.height * 0.6 * (self.BUTTON_HEIGHT_FACTOR)))
                        
                        // ex
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(self.EX_COLOR)
                            .font(.system(size: geometry.size.height * 0.075))
                            .opacity((self.showAnswer && !self.isCorrect) ? 1 : 0)
                            .animation(Animation.easeOut)
                    }
                    .padding(5)
                    
                    Spacer()
                    
                    // ad
                    HStack {
                        Spacer()
                        GADBannerViewController()
                            .frame(width: kGADAdSizeBanner.size.width, height: kGADAdSizeBanner.size.height)
                        Spacer()
                    }
                    
                }
                
            }
        }
        
        // when QuizGameView appears: reads questions data from firebase, appends every question item to fetchedQuestions
        .onAppear() {
            //self.spot = whichQuestion(listOfQuestions: self.fetchedQuestions)
            db.collection("Questions 1").addSnapshotListener { querySnapshot, error in
                guard let documents = querySnapshot?.documents else {
                    print ("error fetching")
                    return
                }
                let question = documents.map { $0["q"]! }
                let correctAns = documents.map { $0["c"]! }
                let source = documents.map { $0["s"]! }
                let wrongAns = documents.map { $0["w"]! }
                
                for i in 0..<question.count {
                    self.fetchedQuestions.append(QuestionItem(
                                                    question: question[i] as? String ?? "",
                                                    correctAns: correctAns[i] as? String ?? "",
                                                    wrongAns: wrongAns[i] as? [String] ?? [""],
                                                    source: source[i] as? String ?? ""))
                }
                if (self.fetchedQuestions.count > 0) { self.spot = whichQuestion(listOfQuestions: self.fetchedQuestions)}
            }
            
        }
        .navigationBarHidden(false)
        .navigationBarTitle("Trivia")
        .navigationBarBackButtonHidden(false)
        .navigationBarItems(
            trailing: Button(action: {
                if (self.fetchedQuestions.count > 0) {
                    self.showSource.toggle()
                }
            }) {
                Image(systemName: "info.circle")
            }
            .alert(isPresented: $showSource) {
                Alert(title: Text("Source"), message: Text(self.fetchedQuestions[self.spot].source), dismissButton: .default(Text("Got it!"))) // show course as alert
            }
        )
        
    }
    
}

