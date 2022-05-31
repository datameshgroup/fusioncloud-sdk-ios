//
//  ReconcillationRequest.swift
//  TestAppDM
//
//  Created by Loey Agdan on 5/8/22.
//

import Foundation
import ObjectMapper

public class ReconcillationRequest: Mappable {
    
    var reconType: String?
    var poiReconId: String?
    
    public required init?(map: Map) {}
    public required init(){}
    public func mapping(map: Map) {
        reconType           <-      map["ReconciliationType"]
        poiReconId          <-      map["POIReconciliationID"]
    }
}


