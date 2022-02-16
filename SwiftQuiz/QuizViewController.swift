//
//  QuizViewController.swift
//  SwiftQuiz
//
//  Created by Paolo Prodossimo Lopes on 28/11/21.
//  Copyright © 2021 Leticia de Oliveira Speda. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {

    @IBOutlet weak var viTimer: UIView!
    @IBOutlet weak var lbQuestion: UILabel!
    @IBOutlet var btAnswers: [UIButton]!
    
    let duration: Double = 25.0
    
    let quizManager = QuizManager()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        getNewQuiz()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        viTimer.frame.size.width = view.frame.size.width
        UIView.animate(withDuration: duration, delay: 0, options: .curveLinear, animations: {
            self.viTimer.frame.size.width = 0
        }) { (sucess) in
            self.showResults()
        }
    }
    
    func getNewQuiz() {
        quizManager.refreshQuiz()
        lbQuestion.text = quizManager.question
        for i in 0..<quizManager.options.count{
            let option = quizManager.options[i]
            let button = btAnswers[i]
            button.setTitle(option, for: .normal)
        }
    }
    
    func showResults(){
        performSegue(withIdentifier: "resultSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let resultViewcontroller = segue.destination as! ResultViewController
        let validateNumberOfAnswers = (quizManager.totalAnswers == 0) ? 1 : quizManager.totalAnswers
        resultViewcontroller.totalAnswer = validateNumberOfAnswers
        resultViewcontroller.totalCorrectAnswer = quizManager.totalCorrectAnswers
    }
    
    
    @IBAction func selectAnswer(_ sender: UIButton) {
        guard let index = btAnswers.firstIndex(of: sender) else { return }
        quizManager.validadeAnswers(index: index)
        getNewQuiz()
    }
    
  

}
