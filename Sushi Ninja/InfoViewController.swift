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
        
        dateFormatter.dateFormat = "MM-dd-yyyy"
        calculateDates()
        let milestones = populateEvents()
        infoTextBox.text = milestones
        
    }
    
    //    func printInfo(from event: Dictionary<String, String>) -> String {
    //        var finalText = ""
    //        for item in event {
    //            //finalText.append(contentsOf: item.key + "\n" + item.value + "\n\n")
    //            finalText.append(item.key + "\n" + item.value + "\n\n")
    //        }
    //        return finalText
    //    }
    
    
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
            
            "A. Jira Epic created by Cerner PM" : startDate!,
            "B. Cerner PM to document verbiage, UX Designer to export visuals as PDF" : kickoffDate!,
            "C. EPAM PO to breakdown stories, write Acceptance Criteria, clarify questions with PM, UXD, Tech Leads" : roadToReadyEnd!,
            "D. Acceptance Criteria to be reviewed by PM, story moved to Incep Spec Done" : specDoneEnd!,
            "E. EPAM Dev Team to Groom and Plan next Sprint": sprintStart!,
            "F. EPAM PO to refine requirements in DNG" : requirementDocking!,
            "G. DNG requirements to be reviewed by PM, PO to link Jira, Dev Team to trace tests to requirements" : threePointReviewEnd!
        ]
        
        let dictionaryKeys = Array(eventDictionary.keys).sorted()
        print(dictionaryKeys)
        
//        for item in dictionaryKeys {
////            finalText.append(eventDictionary.value(forKey: item)) + "\n" + item + "\n\n" )
//            finalText.append(contentsOf: (eventDictionary.))
////            finalText.append(event.value + "\n" + event.key + "\n\n")
//        }
        
//        for event in eventDictionary {
//            finalText.append(event.value + "\n" + event.key + "\n\n")
//
//        }
        return finalText
        
    }
    
}
