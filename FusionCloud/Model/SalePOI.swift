//
//  SalePOI.swift
//  TestApplication
//
//  Created by loey on 1/30/22.
//  Copyright © 2022 loey. All rights reserved.
//

import Foundation
import ObjectMapper

public class SalePOI : Mappable{
   
    public var salePOIResponse: SalePOIResponse?
    public required init?(){}
    public required init?(map: Map) {}
    public func mapping(map: Map) {
          salePOIResponse <- map["SaleToPOIResponse"]
    }
}
