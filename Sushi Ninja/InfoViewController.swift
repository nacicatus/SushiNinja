//
//  InfoViewController.swift
//  Sushi Ninja
//
//  Created by Yajnavalkya on 2021. 03. 11..
//  Copyright © 2021. Yajnavalkya. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {

    
    // some variables
    
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
        calculate()
        infoTextBox.text = printInfo()
        
    }
    
    func printInfo() -> String {
        
        let aText = "Planning for Epic \(epicJiraTicketNumber!) started on \(startDate!).\n"
        let bText = "CernerPM should document verbiage and UX Designer should export visuals as PDF before the feature will kickoff on \(kickoffDate!).\n\n"
        let cText = "After that, EPAM PO should breakdown stories, write acceptance criteria and clarify questions with Cerner PM, UXD and Tech leads until \(roadToReadyEnd!).\nEPAM Dev team may optionally pre-groom the stories during this time.\n"
        let dText = "By \(specDoneEnd!) the Acceptance Criteria should have been reviewed and the story moved to Incep Spec Done by Cerner PM.\n"
        let eText = "Sprint will start on \(sprintStart!).\nEPAM Dev team should groom and plan the next Sprint before then and EPAM PO should start refining requirements in DNG and clarify any new questions before \(requirementDocking!).\n\n"
        let fText = "Afer that, the DNG requirements should be reviewed by Cerner PM and Tech Leads, and EPAM Story Owner.\n PO should link requirements to Jira and Dev team should trace tests to requirements before the Sprint ends on \(threePointReviewEnd!)."
        
        let finalText = aText + bText + cText + dText + eText + fText
        return finalText
    }
    
    
    func calculate() {
        let now = Date()
        
        startDate = dateFormatter.string(from: now)
        kickoffDate = dateFormatter.string(from: now.addingTimeInterval(week))
        roadToReadyEnd = dateFormatter.string(from: now.addingTimeInterval(week * 2.0))
        specDoneEnd = dateFormatter.string(from: now.addingTimeInterval(week * 3.0))
        sprintStart = dateFormatter.string(from: now.addingTimeInterval(week * 4.0))
        requirementDocking = dateFormatter.string(from: now.addingTimeInterval(week * 5.0))
        threePointReviewEnd = dateFormatter.string(from: now.addingTimeInterval(week * 6.0))
        
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
