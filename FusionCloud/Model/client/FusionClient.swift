//
//  FusionClient.swift
//  FusionCloud
//
//  Created by Clinton on 23/8/2022.
//

import Foundation
import Starscream
import ObjectMapper

@available(iOS 15.0, *)
public class FusionClient {

    public var fusionCloudConfig: FusionCloudConfig?
    public var socket: WebSocket?
    public var messageHeader: MessageHeader?
    public var securityTrailer: SecurityTrailer?
    
    let crypto = Crypto()
    var logs: String = ""

    public init(){
    }
    
    public init(fusionCloudConfig: FusionCloudConfig){
        self.fusionCloudConfig = fusionCloudConfig
        self.socket = WebSocket(request: URLRequest(url: URL(string: fusionCloudConfig.serverDomain!)!))
        createDefaultHeader()
        createDefaultSecurityTrailer()
        
    }

      // Creates a default MessageHeader based on the configured saleId and poiId
      public func createDefaultHeader() {
          messageHeader = MessageHeader()
          messageHeader!.protocolVersion = "3.1-dmg"
          messageHeader!.messageClass = "Service"
          messageHeader!.messageType = "Request"
          messageHeader!.saleID = fusionCloudConfig!.saleID
          messageHeader!.poiID = fusionCloudConfig!.poiID
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
                          kekIdentifier.keyIdentifier = fusionCloudConfig!.keyIdentifier!
                          kekIdentifier.keyVersion = fusionCloudConfig!.keyVersion!
                      
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

    public func sendMessage<T: Mappable>(requestBody: T, type: String
//                                         messageHeader: MessageHeader,securityTrailer: SecurityTrailer
    ){
        
        
        let request = crypto.buildRequest(kek: fusionCloudConfig!.kekValue!, request: requestBody, header: self.messageHeader!, security: self.securityTrailer!, type: type)

        appendLog(content: "\n\nRequest: \(request)")
        socket!.write(data: request.data(using: .utf8)!, completion: {})
    }
    func appendLog(content: String) {
        logs.append(contentsOf: Date().ISO8601Format() + " " + content + "\n\n")
        print(logs)
        logs = ""
    }
    
}
