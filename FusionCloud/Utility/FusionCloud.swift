//
//  FusionCloud.swift
//  FusionCloud
//
//  Created by Loey Agdan on 6/25/22.
//

import Foundation

public protocol FusionCloudDelegate {
    func dataReceive(response: String)
}

public class FusionCloudConfig {

    public var serverDomain: String?
    public var kekValue: String?
    public var keyIdentifier: String?
    public var keyVersion: String?
    public var providerIdentification: String?
    public var applicationName: String?
    public var softwareVersion: String?
    public var certificationCode: String?
    public var saleId: String?
    public var poiId: String?
    public var messageHeader: MessageHeader?
    public var securityTrailer: SecurityTrailer?
    public required init(){}
    
}
