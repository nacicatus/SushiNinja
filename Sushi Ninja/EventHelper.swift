//
//  EventHelper.swift
//  Sushi Ninja
//
//  Created by Yajnavalkya on 2021. 03. 16..
//  Copyright © 2021. Yajnavalkya. All rights reserved.
//

import Foundation
import EventKit

class EventHelper {
    
    
    func createEvent(title: String, description: String?, startDate: Date, endDate: Date, completion: ((_ success: Bool, _ error: NSError?) -> Void)? = nil) {
        
        let appleEventStore = EKEventStore()
        appleEventStore.requestAccess(to: .event, completion: { (granted, error) in
            if (granted) && (error == nil) {
                let event: EKEvent = EKEvent(eventStore: appleEventStore)
                event.title = title
                event.startDate = startDate
                event.endDate = endDate
                event.addAlarm(.init(relativeOffset: -86400.0))
                event.calendar = appleEventStore.defaultCalendarForNewEvents
                
                do {
                    try appleEventStore.save(event, span: .thisEvent)
                } catch let e as NSError {
                    completion?(false, e)
                    return
                }
                completion?(true, nil)
            } else {
                completion?(false, error as NSError?)
            }
        })
    }
    
}
