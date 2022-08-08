import Foundation
import ObjectMapper

public class PaymentRequest: Mappable {

  public var saleData: SaleData?
  public var paymentTransaction: PaymentTransaction?
  public var paymentData: PaymentData?

  public func mapping(map: Map) {
    saleData <- map["SaleData"]
      paymentTransaction <- map["PaymentTransaction"]
    paymentData <- map["PaymentData"]
  }

  public required init?(map: Map) {}
  public required init() {}
}

public class SaleData: Mappable {

  public var operatorID: String?
  public var operatorLanguage: String?
  public var shiftNumber: String?
  public var customerLanguage: String?
  public var saleTransactionID: SaleTransactionID?
  public var saleReferenceID: String?
  public var saleTerminalData: SaleTerminalData?
  /// Transaction, Customer
  public var tokenRequestedType: String?

  public func mapping(map: Map) {
    operatorID <- map["OperatorID"]
    operatorLanguage <- map["OperatorLanguage"]
    shiftNumber <- map["ShiftNumber"]
    customerLanguage <- map["CustomerLanguage"]
    saleTransactionID <- map["SaleTransactionID"]
    saleReferenceID <- map["SaleReferenceID"]
    saleTerminalData <- map["SaleTerminalData"]
    tokenRequestedType <- map["TokenRequestedType"]
  }

  public required init?(map: Map) {}
  public required init() {}
}

public class SaleTransactionID: Mappable {

  public var transactionID: String?
  public var timeStamp: Date?

  public func mapping(map: Map) {
      transactionID <- map["TransactionID"]
    timeStamp <- (map["TimeStamp"], ISO8601DateTransform())
  }

  public required init?(map: Map) {}
  public required init() {}
    public required init(transactionID: String) {
        self.transactionID = transactionID;
        self.timeStamp = Date()
    }
}

public class PaymentData: Mappable {

  public var paymentType: String?

  public func mapping(map: Map) {
    paymentType <- map["PaymentType"]
  }

  public required init?(map: Map) {
  }
  public required init() {
      paymentType = "Normal"
  }
    public required init(paymentType: String) {
        self.paymentType = paymentType;
    }
    
    
}

public class PaymentTransaction: Mappable {
    public var amountsReq: AmountsReq?
    public var origionalPOITransaction: OrigionalPOITransaction?
    public var saleItem: [SaleItem]?

  public func mapping(map: Map) {
    amountsReq <- map["AmountsReq"]
    saleItem <- map["SaleItem"]
  }

  public required init?(map: Map) {}
  public required init() {}
}

public class OrigionalPOITransaction: Mappable {
    public var saleID: String?
    public var poiID: String?
    public var poiTransactionID: POITransactionID?
    
    public func mapping(map: Map) {
        saleID <- map["SaleID"]
        poiID <- map["POIID"]
        poiTransactionID <- map["POITransactionID"]
    }
    
    public required init?(map: Map) {}
    public required init() {}
}



public class AmountsReq: Mappable {
  public var currency: String?
  public var requestedAmount: NSDecimalNumber?
  public var cashBackAmount: NSDecimalNumber?
  public var tipAmount: NSDecimalNumber?
  public var surchargeAmount: NSDecimalNumber?
  public var paidAmount: NSDecimalNumber?

  public func mapping(map: Map) {
    currency <- map["Currency"]
    requestedAmount <- (map["RequestedAmount"], NSDecimalNumberTransform())
    cashBackAmount <- (map["CashBackAmount"], NSDecimalNumberTransform())
    tipAmount <- (map["TipAmount"], NSDecimalNumberTransform())
    surchargeAmount <- (map["surchargeAmount"], NSDecimalNumberTransform())
    paidAmount <- (map["paidAmount"], NSDecimalNumberTransform())
  }

  public required init?(map: Map) {}
  public required init() {}
}

public class SaleItem: Mappable {

  public var itemID: Int64?
  public var productCode: String?
  public var unitMeasure: String?
  public var quantity: NSDecimalNumber?
  public var unitPrice: NSDecimalNumber?
  public var productLabel: String?

  public func mapping(map: Map) {
    itemID <- map["ItemID"]
    productCode <- map["ProductCode"]
    unitMeasure <- map["UnitOfMeasure"]
    quantity <- (map["Quantity"], NSDecimalNumberTransform())
    unitPrice <- (map["UnitPrice"], NSDecimalNumberTransform())
    productLabel <- map["ProductLabel"]
  }

  public required init?(map: Map) {}
  public required init() {}
}


