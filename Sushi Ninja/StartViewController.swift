//
//  StartViewController.swift
//  Sushi Ninja
//
//  Created by Yajnavalkya on 2021. 03. 11..
//  Copyright © 2021. Yajnavalkya. All rights reserved.
//

import UIKit

class StartViewController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet weak var jiraTextField: UITextField!
    
    @IBOutlet weak var greetingLabel: UILabel!
    @IBOutlet weak var instructionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.jiraTextField.delegate = self
        
        greetingLabel.text = "If you've created the Epic in Jira Align and are ready to set reminders for milestones on the road to development, go ahead"
        instructionLabel.text = "and press the funky Japanese START button below!"
       
    
    }
    
    // make the keyboard vanish on return key press
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let infoVC = segue.destination as? InfoViewController else { return }
        infoVC.epicJiraTicketNumber = jiraTextField.text
        
    }
}

