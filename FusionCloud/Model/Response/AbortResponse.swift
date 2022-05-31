//
//  AbortResponse.swift
//  FusionCloud
//
//  Created by Loey Agdan on 5/30/22.
//

import Foundation
import ObjectMapper
/* REsponse */


public class EventNotification: Mappable {
    
    public var timeStamp: String?
    public var eventNotify: String?
    public var eventDetails: String?
    
    public required init?(map: Map) {}
    public required init(){}
    public func mapping(map: Map) {
        timeStamp       <-  map["TimeStamp"]
        eventNotify     <-  map["EventToNotify"]
        eventDetails    <-  map["EventDetails"]
    }
}
