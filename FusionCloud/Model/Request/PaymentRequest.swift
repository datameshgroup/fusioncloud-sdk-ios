//
//  PaymentRequest.swift
//  TestAppDM
//
//  Created by Loey Agdan on 4/15/22.
//

import Foundation
import ObjectMapper


public class PaymentRequest: Mappable {
    
    public var saleData: SaleData?
    public var paymentTrans: PaymentTransaction?
    public var paymentData: PaymentData?
    
    public func mapping(map: Map) {
        saleData        <-  map["SaleData"]
        paymentTrans    <-  map["PaymentTransaction"]
        paymentData     <-  map["PaymentData"]
    }
    
    public required init?(map: Map) {}
    public required init(){}
}


public class SaleData: Mappable {
    
    public var tokenReqType: String?
    public var saleTransID: SaleTransactionID?
    public var saleTerminalData: SaleTerminalData?
    public var operatorId: String?
    public var operatorLang: String?
    public var shiftNumber: String?
    public var customerLang: String?
    
    public func mapping(map: Map) {
        shiftNumber    <-   map["ShiftNumber"]
        operatorId     <-   map["OperatorID"]
        operatorLang   <-   map["OperatorLanguage"]
        customerLang   <-   map["CustomerLanguage"]
        tokenReqType   <-   map["TokenRequestedType"]
        saleTransID    <-   map["SaleTransactionID"]
        saleTerminalData <-  map["SaleTerminalData"]
    }
    
    public required init?(map: Map) {}
    public required init(){}
}

    public class SaleTransactionID: Mappable {
        
        public var transID: String?
        public var timeStamp: String?
        
        public func mapping(map: Map) {
            transID     <-  map["TransactionID"]
            timeStamp   <-  map["TimeStamp"]
        }
        
        public required init?(map: Map) {}
        public required init(){}
    }

public class PaymentData: Mappable {
    
    public var paymentType: String?
    
    public func mapping(map: Map) {
        paymentType <-  map["PaymentType"]
    }
    
    public required init?(map: Map) {}
    public required init(){}
}

public class PaymentTransaction: Mappable {
    
    public var amountsReq: AmountsReq?
    public var saleItem: [SaleItem]?
    
    public func mapping(map: Map) {
        amountsReq  <-  map["AmountsReq"]
        saleItem    <-  map["SaleItem"]
    }
    
    public required init?(map: Map) {}
    public required init(){}
    
    

}


    public class AmountsReq: Mappable {
        
        public var currency: String?
        public var requestedAmount: Int?
        
        public func mapping(map: Map) {
            currency            <-  map["Currency"]
            requestedAmount     <-  map["RequestedAmount"]
        }
        
        public required init?(map: Map) {}
        public required init(){}
    }

    public class SaleItem: Mappable {
        
        public var itemId: Int64?
        public var productCode: String?
        public var unitMeasure: String?
        public var quantity: Int?
        public var unitPrice: Double?
        public var productLabel: String?
        
        public func mapping(map: Map) {
            itemId      <-  map["ItemID"]
            productCode <-  map["ProductCode"]
            unitMeasure <-  map["UnitOfMeasure"]
            quantity    <-  map["Quantity"]
            unitPrice   <-  map["UnitPrice"]
            productLabel    <-  map["ProductLabel"]
        }
        
        public required init?(map: Map) {}
        public required init(){}
    }


