//
//  FusionCloud.swift
//  FusionCloud
//
//  Created by Loey Agdan on 6/25/22.
//

import Foundation

public protocol FusionCloudDelegate: class {
    func messageReceived(message: String)
}

/** Manage delegate */

public class FusionCloud {
    public weak var delegate: FusionCloudDelegate?
    
   
    
    public func getSocketMessage(message: String, completion: (String)->()){
        completion(message)
    }
}
