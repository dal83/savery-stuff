//
//  QuizQuestionFormat.swift
//  Savery
//
//  Created by Deborah Lilly on 7/24/20.
//  Copyright © 2020 SaveryApp. All rights reserved.
//

import Foundation

class QuestionItem {
    var question: String
    var correctAns: String
    let wrongAns: [String]
    let source: String
    var id = UUID()
    let order = setOrder()
    
    init (question: String, correctAns: String, wrongAns: [String], source: String) {
        self.question = question
        self.correctAns = correctAns
        self.wrongAns = wrongAns
        self.source = source
    }
    
    func getAll() -> [String] {
        var x = self.wrongAns
        x.append(self.correctAns)
        return(x)
    }
    
    func getReal() -> String {
        return correctAns
    }
    
    func getOrder() -> [Int] { return order }
    
}

func whichQuestion(listOfQuestions: [QuestionItem]) -> Int {
    var spot = 0
    if (listOfQuestions.count > 0) {
        spot = Int.random(in: 0 ..< listOfQuestions.count)
    }
    return spot
}

func setOrder() -> [Int] {
    var ansOrder: [Int] = [0, 0, 0, 0]
    var possibleSpots: [Int] = [0, 1, 2, 3]
    for x in 0...3 {
        let thisIndex = Int.random(in: 0 ..< possibleSpots.count)
        ansOrder[x] = possibleSpots[thisIndex]
        possibleSpots.remove(at: thisIndex)
    }
    return ansOrder
}
