//
//  InfoViewController.swift
//  Sushi Ninja
//
//  Created by Yajnavalkya on 2021. 03. 11..
//  Copyright © 2021. Yajnavalkya. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {
    
    
    // local variables
    var startDate: String?
    var kickoffDate: String?
    var roadToReadyEnd: String?
    var specDoneEnd: String?
    var sprintStart: String?
    var requirementDocking: String?
    var threePointReviewEnd: String?
    var epicJiraTicketNumber: String?
    
    let week : TimeInterval = 7.0 * 24.0 * 3600.0
    
    @IBOutlet weak var infoTextBox: UITextView!
    
    // Date Formatting
    let dateFormatter = DateFormatter()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Milestones for \(epicJiraTicketNumber!)"
        
        dateFormatter.dateFormat = "MMM d, yyyy"
        calculateDates()
        let milestones = populateEvents()
        
        infoTextBox.text = milestones
    }

    func calculateDates() {
        let now = dateFormatter.date(from: startDate!)
        kickoffDate = dateFormatter.string(from: now!.addingTimeInterval(week))
        roadToReadyEnd = dateFormatter.string(from: now!.addingTimeInterval(week * 2.0))
        specDoneEnd = dateFormatter.string(from: now!.addingTimeInterval(week * 3.0))
        sprintStart = dateFormatter.string(from: now!.addingTimeInterval(week * 4.0))
        requirementDocking = dateFormatter.string(from: now!.addingTimeInterval(week * 5.0))
        threePointReviewEnd = dateFormatter.string(from: now!.addingTimeInterval(week * 6.0))
    }
    
    
    func populateEvents() -> String {
        
        var finalText = ""
        let eventDictionary = [
            
            "A Jira Epic is created by the Cerner PM" : startDate!,
            "Cerner PM should document verbiage, UX Designer will export visuals as PDF" : kickoffDate!,
            "EPAM BA to breakdown stories, write Acceptance Criteria, clarify questions with PM, UXD, Tech Leads" : roadToReadyEnd!,
            "Get the Acceptance Criteria reviewed by Cerner PM and User Stories moved to Incep Spec Done" : specDoneEnd!,
            "Help the EPAM Dev Team to Groom and Plan next Sprint": sprintStart!,
            "Jazz(DNG) should be populated by refined requirements by EPAM BA during first half of the associated Sprint" : requirementDocking!,
            "Must get DNG requirements reviewed by Cerner PM & Tech Lead, EPAM story owner, then add links to Jira and Tests with help of the EPAM Dev Team" : threePointReviewEnd!
        ]
        
        let sortedKeysAndValues = eventDictionary.sorted(by: { $0.0 < $1.0 })
        
        for (key,value) in sortedKeysAndValues {
            finalText.append(value + "\n" + key + "\n\n")
        }
        
        return finalText
    }
    
}
