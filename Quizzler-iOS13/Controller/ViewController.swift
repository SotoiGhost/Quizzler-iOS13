//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var choose1Button: UIButton!
    @IBOutlet weak var choose2Button: UIButton!
    @IBOutlet weak var choose3Button: UIButton!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        
        if userGotItRight {
            sender.backgroundColor = .green
            quizBrain.increaseScore()
        } else {
            sender.backgroundColor = .red
        }
        
        quizBrain.moveToNextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateUI() {
        questionLabel.text = quizBrain.getCurrentQuestion()
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        
        let answers = quizBrain.getPossibleAnswers()
        choose1Button.setTitle(answers[0], for: .normal)
        choose2Button.setTitle(answers[1], for: .normal)
        choose3Button.setTitle(answers[2], for: .normal)
        
        choose1Button.backgroundColor = .clear
        choose2Button.backgroundColor = .clear
        choose3Button.backgroundColor = .clear
    }
}
