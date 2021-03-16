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

    var calendars : [EKCalendar]?
    
//    func generateEvent(){
//        let status = EKEventStore.authorizationStatus(for: .event)
//        
//        switch status {
//        case EKAuthorizationStatus.notDetermined:
//            // this happens on first run
//            requestAccessToCalendar()
//        case EKAuthorizationStatus.authorized:
//            // User has access
//            print("User has access")
//            self.createEvent()
//        case EKAuthorizationStatus.restricted:
//            // Ask permission
//            askPermission()
//        default:
//            break
//        }
//    }
    
    func askPermission(){
        print("User has to change settings")
        // create an Alert
    }
    
    //    func requestAccessToCalendar() {
    //        appleEventStore.requestAccess(to: .event, completion: { (granted, error ) in
    //            if (granted) && (error == nil) {
    //                DispatchQueue.main.async {
    //                    print("User has access to calendar")
    //                    self.createEvent()
    //                }
    //            } else {
    //                DispatchQueue.main.async {
    //                    self.askPermission()
    //                }
    //            }
    //        })
    //    }
    
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
                    print("events added with dates:")
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
