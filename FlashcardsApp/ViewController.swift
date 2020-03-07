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
    @IBOutlet weak var firstOptionCard: UIButton!
    @IBOutlet weak var secondOptionCard: UIButton!
    @IBOutlet weak var thirdOptionCard: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        card.layer.cornerRadius = 20.0
        card.layer.shadowRadius = 15.0
        card.layer.shadowOpacity = 4.0
        card.clipsToBounds = true
        
        firstOptionCard.layer.cornerRadius = 20.0
        firstOptionCard.layer.borderWidth = 3.0
        firstOptionCard.layer.borderColor = #colorLiteral(red: 1, green: 0.7436705232, blue: 0.480723083, alpha: 1)
        firstOptionCard.layer.shadowRadius = 15.0
        firstOptionCard.layer.shadowOpacity = 4.0
        firstOptionCard.clipsToBounds = true
        
        secondOptionCard.layer.cornerRadius = 20.0
        secondOptionCard.layer.borderWidth = 3.0
        secondOptionCard.layer.borderColor = #colorLiteral(red: 1, green: 0.7436705232, blue: 0.480723083, alpha: 1)
        secondOptionCard.layer.shadowRadius = 15.0
        secondOptionCard.layer.shadowOpacity = 4.0
        secondOptionCard.clipsToBounds = true
        
        thirdOptionCard.layer.cornerRadius = 20.0
        thirdOptionCard.layer.borderWidth = 3.0
        thirdOptionCard.layer.borderColor = #colorLiteral(red: 1, green: 0.7436705232, blue: 0.480723083, alpha: 1)
        thirdOptionCard.layer.shadowRadius = 15.0
        thirdOptionCard.layer.shadowOpacity = 4.0
        thirdOptionCard.clipsToBounds = true

        
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
    

