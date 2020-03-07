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
    @IBOutlet weak var card: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        card.layer.cornerRadius = 20.0
        card.clipsToBounds = true
        card.layer.shadowRadius = 15.0
        card.layer.shadowOpacity = 0.2
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
    func updateFlashcard(question: String, answer: String) {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let navigationController = segue.destination as! UINavigationController
        let creationContoller = navigationController.topViewController as! CreationViewController
        creationContoller.flashcardsController = self
     
        
    }
    
    }
    

