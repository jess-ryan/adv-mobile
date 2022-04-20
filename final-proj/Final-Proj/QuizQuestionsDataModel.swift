//
//  QuizQuestionsDataModel.swift
//  Final-Proj
//
//  Created by Jess Ryan on 3/13/22.
//

import Foundation
import UIKit

struct quizTopic: Codable{
    var title: String
    var progress: Double
    var saved: Bool
    var questions: [question]
}

struct question: Codable{
    var information: String
    var questionText: String
    //var graphic: UIImage
    var answers: [String]
    var correctAnswer: Int
    var completed: Bool
    //var references: [URL]
    //var referenceIcons: [UIImage]
}
