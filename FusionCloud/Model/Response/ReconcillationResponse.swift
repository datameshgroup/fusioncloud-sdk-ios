//
//  ReconcillationResponse.swift
//  FusionCloud
//
//  Created by Loey Agdan on 5/30/22.
//

import Foundation
import ObjectMapper

public class ReconciliationResponse: Mappable {
    
    var reconType: String?
    var poiReconId: String?
    var response: Response?
    var transactionTotals: [TransactionTotal]?
    
    public required init?(map: Map) {}
    public required init(){}
    public func mapping(map: Map) {
        reconType           <-      map["ReconciliationType"]
        poiReconId          <-      map["POIReconciliationID"]
        response            <-      map["Response"]
        transactionTotals   <-      map["PaymentTotals"]
    }
}

public class TransactionTotal: Mappable {
    
    var paymentTotal: [PaymentTotal]?
    var paymentInstrumentType: String?
    var cardBrand: String?
    var shiftNumber: String?
    var totalGroupId: String?
    var paymentCurrency: String?
    
    public required init?(map: Map) {}
    public required init(){}
    public func mapping(map: Map) {
        paymentInstrumentType   <-  map["PaymentInstrumentType"]
        cardBrand               <-  map["CardBrand"]
        paymentTotal            <-  map["PaymentTotals"]
        shiftNumber             <-  map["ShiftNumber"]
        totalGroupId            <-  map["TotalsGroupID"]
        paymentCurrency         <-  map["PaymentCurrency"]
    }
}


public class PaymentTotal: Mappable {
    
    
    public var transactionType: String?
    public var transactionCount: String?
    public var transactionAmnt: String?
    public var tipAmount: String?
    public var surgeAmount: String?
    
    public required init?(map: Map) {}
    public required init(){}
    public func mapping(map: Map) {
        transactionType     <-      map["TransactionType"]
        transactionCount    <-      map["TransactionCount"]
        transactionAmnt     <-      map["TransactionAmount"]
        tipAmount           <-      map["TipAmount"]
        surgeAmount         <-      map["SurchargeAmount"]
    }
}
