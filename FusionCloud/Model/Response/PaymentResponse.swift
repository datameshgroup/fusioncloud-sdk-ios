//
//  PaymentResponse.swift
//  TestAppDM
//
//  Created by Loey Agdan on 4/21/22.
//

import Foundation
import ObjectMapper


public class PaymentResponse: Mappable{
    
    
    /**
     * Input Request/Response3e
     * Print Request/Response
     * Transaction Status Request/Response
     * Abort Transaction Request/Response
     * Reconciliation Request/Response
     * Card Acquisition Request/Response**/
    
    public var response: PResponse?
    public var saleData: SaleData?
    public var poiData: POIData?
    public var paymentResult: PaymentResult?
    public var paymentReceipt: PaymentReceipt?
    
    
    public required init?(map: Map) {}
    public init(){}
    public func mapping(map: Map) {
        response        <-  map["Response"]
        saleData        <-  map["SaleData"]
        poiData         <-  map["POIData"]
        paymentResult   <-  map["PaymentResult"]
        paymentReceipt  <-  map["PaymentReceipt"]
    }
}

    public class PResponse: Mappable {
        
        public var result: String?
        public var errorCondition: String?
        public var addResponse: String?
        
        public init(){}
        public required init?(map: Map) {}
        public func mapping(map: Map) {
            result              <-  map["Result"]
            errorCondition      <-  map["ErrorCondition"]
            addResponse         <-  map["AdditionalResponse"]
        }
    }



public class POIData: Mappable{
    
    public var poiReconID: String?
    public var poiTransID: POITransactionID?
    
    public init(){}
    public required init?(map: Map) {}
    public func mapping(map: Map) {
        poiTransID      <-  map["POITransactionID"]
        poiReconID      <-  map["POIReconciliationID"]
    }
}

public class POITransactionID: Mappable {
    
    public var transactionID:String?
    public var timeStamp: String?
    
    public init(){}
    public required init?(map: Map) {}
    public func mapping(map: Map) {
        transactionID       <-  map["TransactionID"]
        timeStamp           <-  map["TimeStamp"]
    }
}

public class PaymentResult: Mappable{
    
    public var paymentType: String?
    public var onlineFlag: Bool?
    public var amountResp: AmountsResp?
    public var paymentInstrument: PaymentInstrumentData?
    public var paymentAcquirerData: PaymentAcquirerData?
    
    public init(){}
    public required init?(map: Map) {}
    public func mapping(map: Map) {
        paymentType         <-      map["PaymentType"]
        onlineFlag          <-      map["OnlineFlag"]
        amountResp          <-      map["AmountsResp"]
        paymentInstrument   <-      map["PaymentInstrumentData"]
        paymentAcquirerData <-      map["PaymentAcquirerData"]
    }
}

    public class AmountsResp: Mappable {
        
        public var currency: String?
        public var authAmount: Int?
        public var totalFeeAmount: Int?
        public var cashbackAmount: Int?
        
        public init(){}
        public required init?(map: Map) {
            
        }
        public func mapping(map: Map) {
            currency        <-      map["Currency"]
            authAmount      <-      map["AuthorizedAmount"]
            totalFeeAmount  <-      map["TotalFeesAmount"]
            cashbackAmount  <-      map["CashBackAmount"]
        }
    }

    public class PaymentAcquirerData: Mappable {
        
        public var acquirerId: String?
        public var merchantId: String?
        public var acquirerPOIID: String?
        public var approvalCode: String?
        public var responseCode: String?
        public var hostReconcilationID: String?
        public var acquirerTransactionID: AcquirerTransactionID?
        
        public init(){}
        public required init?(map: Map) {}
        public func mapping(map: Map) {
            acquirerId              <-  map["AcquirerID"]
            merchantId              <-  map["MerchantID"]
            acquirerPOIID           <-  map["AcquirerPOIID"]
            approvalCode            <-  map["ApprovalCode"]
            acquirerTransactionID   <-  map["AcquirerTransactionID"]
            responseCode            <-  map["ResponseCode"]
            hostReconcilationID     <-  map["HostReconciliationID"]
        }
    }


        public class AcquirerTransactionID: Mappable {
            
            public var transactionId: String?
            public var timeStamp: String?
            
            public init(){}
            public required init?(map: Map) {}
            public func mapping(map: Map) {
                transactionId       <-  map["TransactionID"]
                timeStamp           <-  map["TimeStamp"]
            }
        }

    public class PaymentInstrumentData: Mappable {
        
        public var paymentInsType: String?
        public var cardData: CardData?
        public var paymentToken: PaymentToken?
        
        public required init(){}
        public required init?(map: Map) {}
        public func mapping(map: Map) {
            paymentInsType      <-      map["PaymentInstrumentType"]
            cardData            <-      map["CardData"]
            paymentToken        <-      map["PaymentToken"]
        }
    }

    public class PaymentToken: Mappable {
        
        public var tokenRequestType:String?
        public var tokenValue:String?
        public var expiryDate: String?
        
        public required init(){}
        public required init?(map: Map) {}
        public func mapping(map: Map) {
            tokenRequestType        <-      map["TokenRequestedType"]
            tokenValue              <-      map["TokenValue"]
            expiryDate              <-      map["ExpiryDateTime"]
        }
    }

    public class CardData: Mappable {
        
        public var entryMode: String?
        public var paymentBrand: String?
        public var maskPan: String?
        
        public required init(){}
        public required init?(map: Map) {}
        public func mapping(map: Map) {
            entryMode       <-      map["EntryMode"]
            paymentBrand    <-      map["PaymentBrand"]
            maskPan         <-      map["MaskedPAN"]
        }
    }

public class PaymentReceipt: Mappable{
    
    public var outputContent: OutputContent?
    
    public required init(){}
    public required init?(map: Map) {}
    public func mapping(map: Map) {
        outputContent       <-      map["OutputContent"]
    }
    
}


