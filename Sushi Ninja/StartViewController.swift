//
//  StartViewController.swift
//  Sushi Ninja
//
//  Created by Yajnavalkya on 2021. 03. 11..
//  Copyright © 2021. Yajnavalkya. All rights reserved.
//

import UIKit

class StartViewController: UIViewController, UITextFieldDelegate {

    var jiraAlignEpicAddedDate: String?
    let dateFormatter = DateFormatter()
    
    @IBOutlet weak var jiraTextField: UITextField!
    @IBOutlet weak var greetingLabel: UILabel!
    @IBOutlet weak var instructionLabel: UILabel!
    @IBOutlet weak var startDatePicker: UIDatePicker!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dateFormatter.dateFormat = "MMM d, yyyy"
        self.jiraTextField.delegate = self
        
        startDatePicker.datePickerMode = .date
        greetingLabel.text = "If the Epic is created in Jira Align and you're ready to set reminders for milestones on the road to development"
        instructionLabel.text = "Pick the date the Epic was added:"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        jiraTextField.clearsOnInsertion = true
    }
    
    // select date
    @IBAction func selectDate(_ sender: UIDatePicker) {
        jiraAlignEpicAddedDate = dateFormatter.string(from: sender.date)
    }
    
    // make the keyboard vanish on return key press
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let infoVC = segue.destination as? InfoViewController else { return }
        infoVC.epicJiraTicketNumber = jiraTextField.text
        infoVC.startDate = jiraAlignEpicAddedDate
    }
}

