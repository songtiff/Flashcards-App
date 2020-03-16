//
//  ViewController.swift
//  FlashcardsApp
//
//  Created by Tiffany  on 2/15/20.
//  Copyright © 2020 Tiffany. All rights reserved.
//

import UIKit

struct Flashcard {
    var question: String
    var answer: String
}

class ViewController: UIViewController {

    @IBOutlet weak var answerPie: UILabel!
    @IBOutlet weak var questionPie: UILabel!
    @IBOutlet weak var card: UIView!
    @IBOutlet weak var firstOptionCard: UIButton!
    @IBOutlet weak var secondOptionCard: UIButton!
    @IBOutlet weak var thirdOptionCard: UIButton!
    @IBOutlet weak var prevButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    var flashcards = [Flashcard]()
    //Current flashcard index
    var currentIndex = 0
    
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
        
        //read saved flashcards
        readSavedFlashcards()
        
        if flashcards.count == 0 {
            updateFlashcard(question: "What is the Italian word for pie?", answer: "Pizza")
        }
        else {
            updateLabels()
            updateNextPrevButtons()
        }

        
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
        let flashcard = Flashcard(question: question, answer: answer)
        questionPie.text = flashcard.question
        answerPie.text = flashcard.answer
        flashcards.append(flashcard)
        
        // logging to the console
        print("added new flashcard")
        print("we now have \(flashcards.count) flashcards")
        
        //update current index
        currentIndex = flashcards.count - 1
        print("our current index is \(currentIndex)")
        
        updateNextPrevButtons()
        updateLabels()
    }
    
    func updateNextPrevButtons() {
        //disable next button if at the end
        if currentIndex == flashcards.count - 1 {
            nextButton.isEnabled = false
        }
        else {
            nextButton.isEnabled = true
        }
        //disable prev button if at the beginning
        if currentIndex == 0 {
            prevButton.isEnabled = false
        }
        else {
            prevButton.isEnabled = true
        }
    }
    
    func updateLabels() {
        //get current flashcard
        let currentFlashcard = flashcards[currentIndex]
        
        //update labels
        questionPie.text = currentFlashcard.question
        answerPie.text = currentFlashcard.answer
    }
    
    @IBAction func didTapOnPrev(_ sender: Any) {
        //decrease current index
        currentIndex = currentIndex - 1
        //update labels
        updateLabels()
        //update buttons
        updateNextPrevButtons()
    }
    

    @IBAction func didTapOnNext(_ sender: Any) {
        //increase current index
        currentIndex = currentIndex + 1
        //update labels
        updateLabels()
        //update buttons
        updateNextPrevButtons()
    }
    
    func saveAllFlashcardsToDisk() {
        //from flashcard array to dictionary array
        let dictionaryArray = flashcards.map { (card) -> [String: String] in
            return["question": card.question, "answer": card.answer]
        }
        //save array to disk using user defaults
        UserDefaults.standard.set(dictionaryArray, forKey: "flashcards")
        
        //log it
        print("flashcards saved to user default")
        
    }
    
    func readSavedFlashcards() {
        //read dictionary array from disk (if any)
        if let dictionArray = UserDefaults.standard.array(forKey: "flashcards") as? [[String: String]] {
             //dictionary array
            let savedCards = dictionArray.map { (dictionary) -> Flashcard in
                return Flashcard(question: dictionary["question"]!, answer: dictionary["answer"]!)
            }
            flashcards.append(contentsOf: savedCards)
        }
        //put all these cards into our array
    }


    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let navigationController = segue.destination as! UINavigationController
        let creationContoller = navigationController.topViewController as! CreationViewController
        creationContoller.flashcardsController = self
     
        
    }
    
    }
    

