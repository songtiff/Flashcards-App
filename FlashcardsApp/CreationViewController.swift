//
//  CreationViewController.swift
//  FlashcardsApp
//
//  Created by Tiffany  on 3/6/20.
//  Copyright © 2020 Tiffany. All rights reserved.
//

import UIKit

class CreationViewController: UIViewController {
    var flashcardsController: ViewController!
   

    @IBOutlet weak var questionTextField: UITextField!
    @IBOutlet weak var answerTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        // Do any additional setup after loading the view.
    }
    
    @IBAction func didTapOnCancel(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func didTapOnDone(_ sender: Any) {
        let question = questionTextField.text ?? ""
        let answer = answerTextField.text ?? ""
        
        flashcardsController.updateFlashcard(question: question, answer: answer)
        dismiss(animated: true)
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
       // let navigationController = segue.destination as!
    }

}
