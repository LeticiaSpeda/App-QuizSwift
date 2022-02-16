//
//  Quiz.swift
//  SwiftQuiz
//
//  Created by Paolo Prodossimo Lopes on 02/12/21.
//  Copyright © 2021 Leticia de Oliveira Speda. All rights reserved.
//

import Foundation

class Quiz {
    
    let question: String
    let options: [String]
  private let correctedAnswer: String
    
    init(question: String, options: [String], correctedAnswer: String ) {
        self.question = question
        self.options = options
        self.correctedAnswer = correctedAnswer
        
    }
    
    func validateOption (_ index: Int) -> Bool {
        let answer = options[index]
        return answer == correctedAnswer
        
    }
    deinit {
        
    }
    
}
