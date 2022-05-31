//
//  TransactionStatusResponse.swift
//  FusionCloud
//
//  Created by Loey Agdan on 5/30/22.
//

import Foundation
import ObjectMapper

//response

public class TransactionStatusResponse: Mappable {
    
    public var response: Response?
    public var messageReference: MessageReference?
    public var repeatedMessageResponse: RepeatedMessageResponse?
    
    
    public required init?(map: Map) {}
    public required init(){}
    public func mapping(map: Map) {
        response                    <-  map["Response"]
        messageReference            <-  map["MessageReference"]
        repeatedMessageResponse     <-  map["RepeatedMessageResponse"]
    }
}

public class RepeatedMessageResponse: Mappable {
    public required init?(map: Map) {}
    public required init(){}
    public func mapping(map: Map) {
    }
}
