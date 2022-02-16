//
//  ResultViewController.swift
//  SwiftQuiz
//
//  Created by Paolo Prodossimo Lopes on 28/11/21.
//  Copyright © 2021 Leticia de Oliveira Speda. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var lbAnswered: UILabel!
    @IBOutlet weak var lbCorrect: UILabel!
    @IBOutlet weak var lbWrong: UILabel!
    @IBOutlet weak var lbScore: UILabel!
    
    var totalCorrectAnswer: Int = 0
    var totalAnswer: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lbAnswered.text = "Perguntas Respondidas: \(totalAnswer)"
        lbCorrect.text = "Perguntas Corretas: \(totalCorrectAnswer)"
        lbWrong.text = "Perguntas Erradas \(totalAnswer - totalCorrectAnswer)"
        
        let score = totalCorrectAnswer*100/totalAnswer
        lbScore.text = "\(score)%"
    }

    @IBAction func close(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    

}
