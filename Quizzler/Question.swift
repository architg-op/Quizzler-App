//
//  Question.swift
//  Quizzler
//
//  Created by Archit Garg on 9/11/2018.
//  Copyright (c) 2018 Archit Tech. All rights reserved.
//

import Foundation

class Question {
    let questionText : String
    let answer : Bool
    init(text : String, correctAnswer : Bool) {
        questionText = text
        answer = correctAnswer
    }
}

