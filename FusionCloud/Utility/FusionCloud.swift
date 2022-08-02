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

    public var testEnvironment: Bool?
    public var serverDomain: String?
    public var kekValue: String?
    public var keyIdentifier: String?
    public var keyVersion: String?
    public var providerIdentification: String?
    public var applicationName: String?
    public var softwareVersion: String?
    public var certificationCode: String?
    public var saleID: String?
    public var poiID: String?
    public var messageHeader: MessageHeader?
    public var securityTrailer: SecurityTrailer?
    
    public required init() {}
    
    public func initConfig(testEnvironment: Bool, providerIdentification: String, applicationName: String, softwareVersion: String, certificationCode: String, saleID: String, poiID: String, kekValue: String) {
        
        self.testEnvironment = testEnvironment;
        self.providerIdentification = providerIdentification
        self.applicationName = applicationName
        self.softwareVersion = softwareVersion
        self.certificationCode = certificationCode
        self.saleID = saleID
        self.poiID = poiID
        self.kekValue = kekValue
        self.serverDomain = testEnvironment ? "wss://www.cloudposintegration.io/nexodev" : "wss://prod1.datameshgroup.io:5000"
        self.keyIdentifier = testEnvironment ? "SpecV2TestMACKey" : "SpecV2ProdMACKey"
        self.keyVersion = testEnvironment ? "20191122164326" : "20191122164326"

        createDefaultHeader()
        createDefaultSecurityTrailer()
    }
    
    // Creates a default MessageHeader based on the configured saleId and poiId
    public func createDefaultHeader() {
        messageHeader = MessageHeader()
        messageHeader!.protocolVersion = "3.1-dmg"
        messageHeader!.messageClass = "Service"
        messageHeader!.messageType = "Request"
        messageHeader!.saleID = self.saleID
        messageHeader!.poiID = self.poiID
    }
    
    // Creates a default MessageHeader based on the configured KEK
    public func createDefaultSecurityTrailer() {
        securityTrailer = SecurityTrailer()
        securityTrailer!.contentType = "id-ct-authData"
        
        let authenticatedData = AuthenticationData()
            authenticatedData.version = "v0"
            let recipient = Recipient()
                let KEK = KEK()
                    KEK.version = "v4"
                        
                    //inside kek
                    let kekIdentifier = KEKIdentifier()
                        kekIdentifier.keyIdentifier = self.keyIdentifier!
                        kekIdentifier.keyVersion = self.keyVersion!
                    
                    let keyEncryptionAlgorithm = KeyEncryptionAlgorithm()
                        keyEncryptionAlgorithm.algorithm = "des-ede3-cbc"
        
                    KEK.kekIdentifier = kekIdentifier
                    KEK.kekAlgorithm = keyEncryptionAlgorithm
                    KEK.encryptedKey = ""//encryptedString
                    
                //inside receipient
                let macAlgorithm = MACAlgorithm()
                    macAlgorithm.algorithm = "id-retail-cbc-mac-sha-256"
                
                let encapsulatedContent = EncapsulatedContent()
                    encapsulatedContent.contentType = "id-data"
        
            recipient.kek = KEK
            recipient.macAlgorithm = macAlgorithm
            recipient.encapContent = encapsulatedContent
            recipient.mac = ""//MAC
        
        authenticatedData.recipient = recipient
        securityTrailer!.authenticationData = authenticatedData
    }
    

}
