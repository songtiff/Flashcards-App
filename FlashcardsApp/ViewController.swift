//
//  ViewController.swift
//  FlashcardsApp
//
//  Created by Tiffany  on 2/15/20.
//  Copyright © 2020 Tiffany. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var answerPie: UILabel!
    @IBOutlet weak var questionPie: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func didTapOnFlashcard(_ sender: Any) {
        if(questionPie.isHidden){
            questionPie.isHidden = false
            answerPie.isHidden = true
            
            
        }else{ //if the question label is showing and the answer label is hidden
            questionPie.isHidden = true
            answerPie.isHidden = false
            
        }
    }
    
}

