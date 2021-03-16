//
//  InfoViewController.swift
//  Sushi Ninja
//
//  Created by Yajnavalkya on 2021. 03. 11..
//  Copyright © 2021. Yajnavalkya. All rights reserved.
//

import UIKit
import EventKit


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
        makeDateStrings()
        let milestones = printMilestones(from: getAllEvents())
        
        infoTextBox.text = milestones
    }

    func makeDateStrings() {
        let now = dateFormatter.date(from: startDate!)
        kickoffDate = dateFormatter.string(from: now!.addingTimeInterval(week))
        roadToReadyEnd = dateFormatter.string(from: now!.addingTimeInterval(week * 2.0))
        specDoneEnd = dateFormatter.string(from: now!.addingTimeInterval(week * 3.0))
        sprintStart = dateFormatter.string(from: now!.addingTimeInterval(week * 4.0))
        requirementDocking = dateFormatter.string(from: now!.addingTimeInterval(week * 5.0))
        threePointReviewEnd = dateFormatter.string(from: now!.addingTimeInterval(week * 6.0))
    }
    

    func getAllEvents() -> Dictionary<String, String> {
        let eventDictionary = [
            
            "A Jira Epic is created by the Cerner PM" : startDate!,
            "Cerner PM should document verbiage, UX Designer will export visuals as PDF" : kickoffDate!,
            "EPAM BA to breakdown stories, write Acceptance Criteria, clarify questions with PM, UXD, Tech Leads" : roadToReadyEnd!,
            "Get the Acceptance Criteria reviewed by Cerner PM and User Stories moved to Incep Spec Done" : specDoneEnd!,
            "Help the EPAM Dev Team to Groom and Plan next Sprint": sprintStart!,
            "Jazz(DNG) should be populated by refined requirements by EPAM BA during first half of the associated Sprint" : requirementDocking!,
            "Must get DNG requirements reviewed by Cerner PM & Tech Lead, EPAM story owner, then add links to Jira and Tests with help of the EPAM Dev Team" : threePointReviewEnd!
        ]
        return eventDictionary
    }

    
    func printMilestones(from events: Dictionary<String, String>) -> String {
        
        var finalText = ""
        let sortedKeysAndValues = events.sorted(by: { $0.0 < $1.0 })
        
        for (key,value) in sortedKeysAndValues {
            finalText.append(value + "\n" + key + "\n\n")
        }
        return finalText
    }
    
    // Creating Calendar Events
    @IBAction func markCalendar(_ sender: UIButton) {
        
        let helper = EventHelper()
        // dates
        let now = dateFormatter.date(from: startDate!)
        let kickoffEnd = dateFormatter.date(from: kickoffDate!)
        let readyRoad = dateFormatter.date(from: roadToReadyEnd!)
        let incepSpec = dateFormatter.date(from: specDoneEnd!)
        let groomPlan = dateFormatter.date(from: sprintStart!)
        let dockReq = dateFormatter.date(from: requirementDocking!)
        let threep = dateFormatter.date(from: threePointReviewEnd!)

        // calendar events
        
        helper.createEvent(title: "\(epicJiraTicketNumber!) Kickoff Planning", description: "Cerner PM should document verbiage, UX Designer will export visuals as PDF", startDate: now!, endDate: kickoffEnd!, completion: nil)
        helper.createEvent(title: "\(epicJiraTicketNumber!) Road to Ready", description: "EPAM BA to breakdown stories, write Acceptance Criteria, clarify questions with PM, UXD, Tech Leads", startDate: kickoffEnd!, endDate: readyRoad!, completion: nil)
        helper.createEvent(title: "\(epicJiraTicketNumber!) Incep Spec", description: "Get the Acceptance Criteria reviewed by Cerner PM and User Stories moved to Incep Spec Done", startDate: readyRoad!, endDate: incepSpec!, completion: nil)
        helper.createEvent(title: "\(epicJiraTicketNumber!) Groom & Plan", description: "Help the EPAM Dev Team to Groom and Plan next Sprint", startDate: incepSpec!, endDate: groomPlan!, completion: nil)
        helper.createEvent(title: "\(epicJiraTicketNumber!) Dock Requirements", description: "Jazz(DNG) should be populated by refined requirements by EPAM BA during first half of the associated Sprint", startDate: groomPlan!, endDate: dockReq!, completion: nil)
        helper.createEvent(title: "\(epicJiraTicketNumber!) 3 Point Review", description: "Must get DNG requirements reviewed by Cerner PM & Tech Lead, EPAM story owner, then add links to Jira and Tests with help of the EPAM Dev Team", startDate: dockReq!, endDate: threep!, completion: nil)
        
        // show Alert after dates were added
        let alert = UIAlertController(title: "Calendar Populated", message: "All milestone dates for \(epicJiraTicketNumber!) have been added to your default Calendar with alerts set for one day in advance.", preferredStyle: .alert)
        
        let okayAction = UIAlertAction(title: "Okay", style: .default, handler: nil)
        alert.addAction(okayAction)
        present(alert, animated: true, completion: nil)
        
        
    }
    
    
}
