//
//  ReconcillationResponse.swift
//  FusionCloud
//
//  Created by Loey Agdan on 5/30/22.
//

import Foundation
import ObjectMapper

public class ReconciliationResponse: Mappable {
    
    var reconciliationType: String?
    var poiReconciliationID: String?
    var response: Response?
    var transactionTotals: [TransactionTotal]?
    
    public required init?(map: Map) {}
    public required init(){}
    public func mapping(map: Map) {
        reconciliationType           <-      map["ReconciliationType"]
        poiReconciliationID          <-      map["POIReconciliationID"]
        response            <-      map["Response"]
        transactionTotals   <-      map["PaymentTotals"]
    }
}

public class TransactionTotal: Mappable {
    
    var paymentTotals: [PaymentTotal]?
    var paymentInstrumentType: String?
    var cardBrand: String?
    var shiftNumber: String?
    var totalsGroupID: String?
    var paymentCurrency: String?
    
    public required init?(map: Map) {}
    public required init(){}
    public func mapping(map: Map) {
        paymentInstrumentType   <-  map["PaymentInstrumentType"]
        cardBrand               <-  map["CardBrand"]
        paymentTotals            <-  map["PaymentTotals"]
        shiftNumber             <-  map["ShiftNumber"]
        totalsGroupID            <-  map["TotalsGroupID"]
        paymentCurrency         <-  map["PaymentCurrency"]
    }
}


public class PaymentTotal: Mappable {
    
    
    public var transactionType: String?
    public var transactionCount: String?
    public var transactionAmount: String?
    public var tipAmount: String?
    public var surchargeAmount: String?
    
    public required init?(map: Map) {}
    public required init(){}
    public func mapping(map: Map) {
        transactionType     <-      map["TransactionType"]
        transactionCount    <-      map["TransactionCount"]
        transactionAmount     <-      map["TransactionAmount"]
        tipAmount           <-      map["TipAmount"]
        surchargeAmount         <-      map["SurchargeAmount"]
    }
}
