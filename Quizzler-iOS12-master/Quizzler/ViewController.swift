//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Place your instance variables here
    let allQuestions = QuestionBank()
    var pickedAnswer : Bool = false
    var questionNumber : Int = 0
    var score : Int = 0
    
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nextQuestion() // this replaces the code below
        
        
//        let firstQuestion = allQuestions.list[0]
//        // QUESTIONLABEL is using the TEXT parameter of the QUESTION class
//        // FIRSTQUESTION is using the QUESTIONTEXT property of the QUESTION class that has been set to the TEXT parameter of the INIT method for the QUESTION class
//        questionLabel.text = firstQuestion.questionText
        
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
        
        if sender.tag == 1 {
            pickedAnswer = true
        }
        else if sender.tag == 2 {
            pickedAnswer = false
        }
        
        checkAnswer()
        questionNumber = questionNumber + 1
        nextQuestion()
    
    }
    
    
    func updateUI() {
        
        scoreLabel.text = "SCORE:  \(score)" // String(score) will also work
        progressLabel.text = "\(questionNumber + 1) / 13"
        progressBar.frame.size.width = (view.frame.size.width / 13) * CGFloat(questionNumber + 1)
        
    }
    

    func nextQuestion() {
        
        if questionNumber <= 12 {
            questionLabel.text = allQuestions.list[questionNumber].questionText
            
            updateUI()
        }
        else {
            scoreLabel.text = "SCORE:  \(score)" 
            let alert = UIAlertController (title: "Great Job!", message: "Would you like to try again?", preferredStyle: .alert)
            let restartAction = UIAlertAction (title: "Restart", style: .default, handler: { (UIAlertAction) in
                self.startOver()
            })
            
            alert.addAction(restartAction)
            
            present (alert, animated: true, completion: nil)
            
        }
        
    }
    
    
    func checkAnswer() {
        
        // sets the correct answer for the propsed question to the ANSWER property of the indexed question
        let correctAnswer = allQuestions.list[questionNumber].answer
        
        if correctAnswer == pickedAnswer {
            ProgressHUD.showSuccess("You Got It Right!")   //print("correct answer")
            score += 100
        }
        else {
            ProgressHUD.showError("Wrong Answer")   //print("wrong answer")
            score -= 100
        }
        
    }
    
    
    func startOver() {
        
        questionNumber = 0
        score = 0
        updateUI()
        nextQuestion()
       
    }
    

    
}
