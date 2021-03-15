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
    
    // Date Formatting
    let dateFormatter = DateFormatter()

    
    @IBOutlet weak var infoTextBox: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dateFormatter.dateFormat = "d MMM, yyyy"
        calculateDates()
        let milestones = populateEventDictionary()
        infoTextBox.text = printInfo(from: milestones)
        
    }
    
    func printInfo(from event: Dictionary<String?, String>) -> String {
        var finalText = ""
        for item in event {
            finalText.append(contentsOf: item.key! + "\n" + item.value + "\n\n")
        }
        return finalText
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

    func populateEventDictionary() -> Dictionary<String?, String> {
        let eventDictionary = [
            kickoffDate : "Cerner PM to document verbiage, UX Designer to export visuals as PDF",
            roadToReadyEnd : "EPAM PO to breakdown stories, write Acceptance Criteria, clarify questions with PM, UXD, Tech Leads",
            specDoneEnd : "Acceptance Criteria to be reviewed by PM, story moved to Incep Spec Done",
            sprintStart : "EPAM Dev Team to Groom and Plan next Sprint",
            requirementDocking : "EPAM PO to refine requirements in DNG",
            threePointReviewEnd : "DNG requirements to be reviewed by PM, PO to link Jira, Dev Team to trace tests to requirements"
        ]
        
        return eventDictionary
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
