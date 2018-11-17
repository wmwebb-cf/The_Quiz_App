//
//  Question1.swift
//  Quizzler
//
//  Created by william webb on 11/14/18.
//  Copyright © 2018 London App Brewery. All rights reserved.
//

import Foundation

class Question {
    
    // --> variables/constants are PROPERTIES of a class when declared inside a class
    let questionText : String
    let answer : Bool
    
    // --> the INIT method determines what happens to objects of that class, the EVENT
    init(text: String, correctAnswer: Bool) {
        questionText = text
        answer = correctAnswer
    }
    

    
}



