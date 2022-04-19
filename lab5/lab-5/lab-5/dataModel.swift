//
//  dataModel.swift
//  lab-5
//
//  Created by Jess Ryan on 2/28/22.
//

import Foundation

struct Trivia: Codable{
    let question: String
    let correct_answer: String
    
    enum CodingKeys: String, CodingKey {
            case question = "question"
            case correct_answer = "correct_answer"
            
        }
}

struct TriviaData: Codable{
    var trivias =  [Trivia]()
    
    enum CodingKeys: String, CodingKey{
            case trivias = "results"
        }
}
