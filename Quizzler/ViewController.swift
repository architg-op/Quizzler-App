//
//  ViewController.swift
//  Quizzler
//
//  Created by Archit Garg on 9/11/2018.
//  Copyright (c) 2018 Archit Tech. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Place your instance variables here
    
    let allQuestions = QuestionBank()
    var pickedAnswer : Bool = false
    var questionNumber : Int = 0
    var currentScore : Int = 0
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextQuestion()
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
        if (sender.tag == 1) {
            pickedAnswer = true
        }
        else {
            pickedAnswer = false
        }
        checkAnswer()
    }
    
    
    func updateUI() {
        scoreLabel.text = "Score : \(currentScore)"
        if (questionNumber <= 12) {
            progressLabel.text = "\(questionNumber + 1) / 13"
        }
        progressBar.frame.size.width = (view.frame.size.width / 13) * CGFloat(questionNumber + 1)
    }
    

    func nextQuestion() {
        if questionNumber <= 12 {
            questionLabel.text = allQuestions.list[questionNumber].questionText
        }
        else {
            
            let alert = UIAlertController(title: "Awesome", message: "You've finished all your questions, do you want to start over?", preferredStyle: .alert)
            let restartAction = UIAlertAction(title: "Restart", style: .default) { (UIAlertAction) in
                self.startOver()
            }
            alert.addAction(restartAction)
            present(alert, animated: true, completion: nil)
        }
    }
    
    
    func checkAnswer() {
            let correctAnswer = allQuestions.list[questionNumber].answer
            if (pickedAnswer == correctAnswer) {
                print("Answer is Correct")
                ProgressHUD.showSuccess("Correct")
                currentScore += 1
            }
            else {
                print("Answer is Incorrect")
                ProgressHUD.showError("Wrong")
            }
            questionNumber = questionNumber + 1
            updateUI()
        
            nextQuestion()
        
    }
    
    
    func startOver() {
       questionNumber = 0
        currentScore = 0
        updateUI()
        nextQuestion()
    }
    

    
}
