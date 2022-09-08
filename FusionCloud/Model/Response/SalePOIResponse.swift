//
//  SalePOIResponse.swift
//  TestApplication
//
//  Created by loey on 1/30/22.
//  Copyright © 2022 loey. All rights reserved.
//

import Foundation
import ObjectMapper

public class SaleToPOIResponse: Mappable {
    
    public var messageheader: MessageHeader?
    public var loginResponse: LoginResponse?
    public var securityTrailer: SecurityTrailer?

    public var paymentResponse: PaymentResponse?
    public var inputResponse: InputResponse?
    public var abortResponse: EventNotification?
    public var transactionStatusResponse: TransactionStatusResponse?
    public var printResponse: PrintResponse?
    public var reconciliationResponse: ReconciliationResponse?
    public var logoutResponse: LogoutResponse?
    public var cardAcquisitionResponse: CardAcquisitionResponse?
    public var eventNotification: EventNotification?
    
    public required init?(map: Map) {}
    public required init(){}
    public func mapping(map: Map) {
        messageheader               <-  map["MessageHeader"]
        loginResponse               <-  map["LoginResponse"]
        paymentResponse             <-  map["PaymentResponse"]
        inputResponse               <-  map["InputResponse"]
        abortResponse               <-  map["EventNotification"]
        transactionStatusResponse   <-  map["TransactionStatusResponse"]
        printResponse               <-  map["PrintResponse"]
        reconciliationResponse      <-  map["ReconciliationResponse"]
        logoutResponse              <-  map["LogoutResponse"]
        securityTrailer             <-  map["SecurityTrailer"]
        cardAcquisitionResponse     <-  map["CardAcquisitionResponse"]
        eventNotification           <-  map["EventNotification"]
    }
}

