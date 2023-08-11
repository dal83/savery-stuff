//
//  QuizGame.swift
//  Savery
//
//  Created by Deborah Lilly on 7/21/20.
//  Copyright © 2020 SaveryApp. All rights reserved.
//

import SwiftUI
import GoogleMobileAds
import Firebase
import FirebaseFirestore

struct QuizGameView: View {
    @State private var fetchedQuestions: [QuestionItem] = []
    @State private var spot: Int = 0
    @State private var showSource = false
    @State private var showAnswer = false
    @State private var isCorrect = false
    @State private var pointsEarned = 0
    @Binding var totalPoints: Int
    
    private let POINT_VALUE = 1
    private let BUTTON_WIDTH_FACTOR: CGFloat = 0.8
    private let BUTTON_HEIGHT_FACTOR: CGFloat = 0.11
    private let BUTTON_TEXT_COLOR = Color(red: 244/255, green: 252/255, blue: 235/255)
    private let BUTTON_BACKGROUND_COLOR = Color(red: 186/255, green: 209/255, blue: 161/255)
    private let BUTTON_CORNER_RADIUS: CGFloat = 15.0
    private let CUSTOM_FONT = "Helvetica Neue Light"
    private let CHECKMARK_COLOR = Color(red: 68/255, green: 146/255, blue: 86/255)
    private let EX_COLOR = Color(red: 146/255, green: 68/255, blue: 68/255)
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Rectangle()
                    .foregroundColor(Color(red: 163/255, green: 194/255, blue: 131/255))
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    if !fetchedQuestions.isEmpty {
                        QuizQuestionView(
                            questionItem: fetchedQuestions[spot],
                            onAnswerSelected: handleAnswerSelected
                        )
                    } else {
                        Text("Loading...")
                            .font(Font.custom(CUSTOM_FONT, size: geometry.size.height * 0.28 * BUTTON_HEIGHT_FACTOR))
                            .foregroundColor(Color(red: 163/255, green: 194/255, blue: 131/255))
                            .padding(.vertical)
                    }
                    
                    Spacer()
                    
                    CheckScoreView(
                        showAnswer: $showAnswer,
                        isCorrect: $isCorrect,
                        pointsEarned: $pointsEarned
                    )
                    .padding(5)
                    
                    Spacer()
                    
                    AdBannerView()
                        .frame(width: kGADAdSizeBanner.size.width, height: kGADAdSizeBanner.size.height)
                }
            }
        }
        .onAppear(perform: fetchQuestions)
        .navigationBarTitle("Trivia")
        .navigationBarBackButtonHidden(false)
        .navigationBarItems(
            trailing: Button(action: {
                if !fetchedQuestions.isEmpty {
                    showSource.toggle()
                }
            }) {
                Image(systemName: "info.circle")
            }
            .alert(isPresented: $showSource) {
                Alert(
                    title: Text("Source"),
                    message: Text(fetchedQuestions[spot].source),
                    dismissButton: .default(Text("Got it!"))
                )
            }
        )
    }
    
    private func fetchQuestions() {
        db.collection("Questions 1").addSnapshotListener { querySnapshot, error in
            guard let documents = querySnapshot?.documents else {
                print("Error fetching")
                return
            }
            
            let questionItems = documents.compactMap { document in
                QuestionItem(
                    question: document["q"] as? String ?? "",
                    correctAns: document["c"] as? String ?? "",
                    wrongAns: document["w"] as? [String] ?? [],
                    source: document["s"] as? String ?? ""
                )
            }
            
            fetchedQuestions = questionItems
            if !fetchedQuestions.isEmpty {
                spot = whichQuestion(listOfQuestions: fetchedQuestions)
            }
        }
    }
    
    private func handleAnswerSelected(isCorrectAnswer: Bool) {
        if !showAnswer {
            if isCorrectAnswer {
                pointsEarned += POINT_VALUE
                totalPoints += POINT_VALUE
                UserDefaults.standard.set(totalPoints, forKey: "points")
                isCorrect = true
            } else {
                isCorrect = false
            }
            
            withAnimation(.easeIn(duration: 0.5)) {
                showAnswer = true
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                showAnswer = false
                if isCorrect {
                    fetchedQuestions.remove(at: spot)
                }
                spot = whichQuestion(listOfQuestions: fetchedQuestions)
            }
        }
    }
}

struct QuizQuestionView: View {
    let questionItem: QuestionItem
    let onAnswerSelected: (Bool) -> Void
    
    var body: some View {
        VStack {
            Spacer()
            
            Text(questionItem.question)
                .font(.custom(CUSTOM_FONT, size: geometry.size.height * 0.28 * BUTTON_HEIGHT_FACTOR))
                .bold()
                .multilineTextAlignment(.center)
                .padding()
                .frame(width: geometry.size.width * BUTTON_WIDTH_FACTOR, height: geometry.size.height * 2.6 * BUTTON_HEIGHT_FACTOR)
                .background(
                    RoundedRectangle(cornerRadius: 16)
                        .fill(BUTTON_BACKGROUND_COLOR)
                )
            
            Spacer()
            
            VStack(spacing: geometry.size.height * 0.008) {
                ForEach(questionItem.getOrder(), id: \.self) { num in
                    Button(action: {
                        onAnswerSelected(questionItem.getAll()[num] == questionItem.correctAns)
                    }) {
                        Text(questionItem.getAll()[num])
                            .font(.custom(CUSTOM_FONT, size: geometry.size.height * 0.225 * BUTTON_HEIGHT_FACTOR))
                            .multilineTextAlignment(.center)
                            .padding(8)
                            .frame(width: geometry.size.width * BUTTON_WIDTH_FACTOR, height: geometry.size.height * BUTTON_HEIGHT_FACTOR)
                            .foregroundColor(BUTTON_TEXT_COLOR)
                    }
                    .background(
                        RoundedRectangle(cornerRadius: BUTTON_CORNER_RADIUS)
                            .fill(BUTTON_BACKGROUND_COLOR)
                    )
                }
            }
        }
    }
}

struct CheckScoreView: View {
    @Binding var showAnswer: Bool
    @Binding var isCorrect: Bool
    @Binding var pointsEarned: Int
    
    var body: some View {
        HStack {
            Image(systemName: "checkmark.circle.fill")
                .foregroundColor(CHECKMARK_COLOR)
                .font(.system(size: geometry.size.height * 0.075))
                .opacity((showAnswer && isCorrect) ? 1 : 0)
                .animation(Animation.easeOut)
            
            Text("\(pointsEarned)")
                .foregroundColor(BUTTON_TEXT_COLOR)
                .font(.custom(CUSTOM_FONT, size: geometry.size.height * 0.6 * BUTTON_HEIGHT_FACTOR))
            
            Image(systemName: "xmark.circle.fill")
                .foregroundColor(EX_COLOR)
                .font(.system(size: geometry.size.height * 0.075))
                .opacity((showAnswer && !isCorrect) ? 1 : 0)
                .animation(Animation.easeOut)
        }
        .padding(5)
    }
}

struct AdBannerView: View {
    var body: some View {
        HStack {
            Spacer()
            GADBannerViewController()
                .frame(width: kGADAdSizeBanner.size.width, height: kGAD
