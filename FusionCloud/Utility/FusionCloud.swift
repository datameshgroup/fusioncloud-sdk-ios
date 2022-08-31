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

public class FusionCloudConfig{
    public var serverDomain: String?
    public var kekValue: String?
    public var keyIdentifier: String?
    public var keyVersion: String?
    public var providerIdentification: String?
    public var applicationName: String?
    public var softwareVersion: String?
    public var certificationCode: String?
    public var saleID: String!
    public var poiID: String!
    public var testEnvironment: Bool
    
    public required init(testEnvironmentui: Bool?) {
        testEnvironment = testEnvironmentui ?? true
        
        self.providerIdentification = testEnvironment ? "Company A" : "H_L"
        self.applicationName = testEnvironment ? "POS Retail" : "Exceed"
        self.softwareVersion = testEnvironment ? "01.00.00" : "9.0.0.0"
        self.certificationCode = testEnvironment ? "98cf9dfc-0db7-4a92-8b8cb66d4d2d7169" : "01c99f18-7093-4d77-b6f6-2c762c8ed698"
        
        self.kekValue = testEnvironment ? "44DACB2A22A4A752ADC1BBFFE6CEFB589451E0FFD83F8B21" : "ba92ab29e9918943167325f4ea1f5d9b5ee679ea89a82f2c"
        self.serverDomain = testEnvironment ? "wss://www.cloudposintegration.io/nexodev" : "wss://www.prod1.datameshgroup.io:5000"
        self.keyIdentifier = testEnvironment ? "SpecV2TestMACKey" : "SpecV2ProdMACKey"
        self.keyVersion = testEnvironment ? "20191122164326" : "20191122164326"
        self.poiID = "POI ID";
        self.saleID = "SALE ID";
    }
    
}
