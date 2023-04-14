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
    public var abortResponse: AbortResponse?
    public var paymentResponse: PaymentResponse?
    public var loginResponse: LoginResponse?
    public var cardAcquisitionResponse: CardAcquisitionResponse?
    public var displayResponse: DisplayResponse?
    public var inputResponse: InputResponse?
<<<<<<< HEAD
    public var logoutResponse: LogoutResponse?
    public var printResponse: PrintResponse?
    public var reconciliationResponse: ReconciliationResponse?
    public var transactionStatusResponse: TransactionStatusResponse?
    public var reversalResponse: ReversalResponse?
    public var eventNotification: EventNotification?
    public var securityTrailer: SecurityTrailer?
=======
    public var abortResponse: EventNotification?
    public var transactionStatusResponse: TransactionStatusResponse?
    public var printResponse: PrintResponse?
    public var reconciliationResponse: ReconciliationResponse?
    public var logoutResponse: LogoutResponse?
    public var cardAcquisitionResponse: CardAcquisitionResponse?
    public var eventNotification: EventNotification?
    
>>>>>>> f7e749e92059c07f702ed069f84858d2bf0a3841
    public required init?(map: Map) {}
    public required init(){}
    public func mapping(map: Map) {
        messageheader               <-  map["MessageHeader"]
<<<<<<< HEAD
        abortResponse               <-  map["EventNotification"]
        paymentResponse             <-  map["PaymentResponse"]
        loginResponse               <-  map["LoginResponse"]
        cardAcquisitionResponse     <-  map["CardAcquisitionResponse"]
        displayResponse             <-  map["DisplayResponse"]
        inputResponse               <-  map["InputResponse"]
        logoutResponse              <-  map["LogoutResponse"]
        printResponse               <-  map["PrintResponse"]
        reconciliationResponse      <-  map["ReconciliationResponse"]
        transactionStatusResponse   <-  map["TransactionStatusResponse"]
        reversalResponse            <-  map["ReversalResponse"]
        eventNotification           <-  map["EventNotification"]
        securityTrailer             <-  map["SecurityTrailer"]
        
        
=======
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
>>>>>>> f7e749e92059c07f702ed069f84858d2bf0a3841
    }
}

