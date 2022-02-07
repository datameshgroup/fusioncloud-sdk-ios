//
//  ViewController.swift
//  TestApplication
//
//  Created by loey on 12/19/21.
//  Copyright © 2021 loey. All rights reserved.
//

import UIKit
import Alamofire
import Starscream
import ObjectMapper

class ViewController: UIViewController , WebSocketDelegate{
    
   var socket: WebSocket!
   var isConnected = false
   let server = WebSocketServer()
   var isCertPin = false
    
    var session: Session?

    override func viewDidLoad() {
        super.viewDidLoad()
        requestPinning2()
        
        //connect to websocket ->
       
    }
    
    //no need parsing json
    func parseJson(str: String){
        
        _ = str.data(using: .utf8)!

            
        //            if let jsonArray = try JSONSerialization.jsonObject(with: data, options : .allowFragments) as? [Dictionary<String,Any>]
        //            {
        //               print(jsonArray) // use the json here
        //            } else {
        //                print("bad json")
        //            }
                    
        //            let json = try JSONSerialization.jsonObject(with: data, options : .allowFragments) as! [String: AnyObject]
        //            let messageHeader = json["SaleToPOIResponse"] as? [String: AnyObject]
        //            let protocolVersion = messageHeader?["messageHeader"] as? String
        //            print("protocolVersion: \(String(describing: protocolVersion))")
        //        } catch let error as NSError {
        //            print(error)
        //        }
                //3rd Try
            
            let salePOIResponse = SalePOI(JSONString: str)
            print("protocol => \(String(describing: salePOIResponse?.salePOIResponse?.messageheader?.protocolVersion)) ")
        
            
        
    }
    
    func parseJson2(str: String){
        //todo:- do string manipulation
        let data = str.data(using: .utf8)!
        let json = try? JSONSerialization.jsonObject(with: data, options: [])
        
        if let dictionary = json as? [String: Any] {
            if let salePOI = dictionary["SaleToPOIResponse"] as? [String: Any] {
                
            }
        }
    
    }
    
    
    func startSocketConnection(){
        var request = URLRequest(url: URL(string: "wss://www.cloudposintegration.io/nexodev")!)
                      request.timeoutInterval = 5
                      socket = WebSocket(request: request)
                      socket.delegate = self
                      socket.connect()
    }
    
    /** WebSocket Delegate functions */
    
    func didReceive(event: WebSocketEvent, client: WebSocket) {
           switch event {
           case .connected(let headers):
               isConnected = true
               print("websocket is connected: \(headers)")
                write(message: "")
           case .disconnected(let reason, let code):
               isConnected = false
               print("websocket is disconnected: \(reason) with code: \(code)")
           case .text(let string):
               print("Received text: \(string)")
                parseJson(str: string)
           case .binary(let data):
               print("Received data: \(data.count)")
           case .ping(_):
               break
           case .pong(_):
               break
           case .viabilityChanged(_):
               break
           case .reconnectSuggested(_):
               break
           case .cancelled:
               isConnected = false
           case .error(let error):
               isConnected = false
               handleError(error)
           }
       }
       
       func handleError(_ error: Error?) {
           if let e = error as? WSError {
               print("websocket encountered an WS-error: \(e.message)")
           } else if let e = error {
               print("websocket encountered an error: \(e.localizedDescription)")
           } else {
               print("websocket encountered an error")
           }
       }
    
    func disconnectSocket(){
        if isConnected {
            socket.disconnect()
        } else {
            socket.connect()
        }
    }
    
    @IBAction func btnLogin(_ sender: UIButton) {
        //todo:- do start socket connection
        if self.isCertPin {
            startSocketConnection()
        } else {
            print("pinning required")
        }
    }
    
    func write(message: String){
        //buildLoginRequest()
        //socket.write(string: "\(sample)", completion: {})
        socket.write(string: buildLoginRequest(), completion: {})
    }
    
    func requestPinning2(){
        SSlPinningManager.shared.callAnyApi(urlString: "https://www.cloudposintegration.io", isCertificatePinning: true) { (response) in
                   print("pinning => \(response)")
            // print all response html
                if response.contains("successful"){
                    self.isCertPin = true
                }
            
        }
        
        
    //todo:- for login request
        /**
                        Add send request to handleMessage for Socket
                            SaleToPOI as Mesage
                                SaleToPOI Response
                        do instance checking if response of message is request or response
                    Build SecurityTrailer / Do same interface checking /
         */
    }
    
    func buildLoginRequest()-> String {
        let sale: SaleToPOILoginRequest?  = SaleToPOILoginRequest()
        
        let poiRequest = SalePOIRequest()
        
        //security trailer start =>
        
        let securityTrailer = SecurityTrailer()
            
            securityTrailer.contentData = "id-ct-authData"
        
            let authenticationData = AuthenticationData()
                authenticationData.version = "v0"
        
            let receipient = Recipient()
        
                //add KEK , MAC Algorithm, Encapsulated
        
                let kek = KEK()
                kek.encryptedKey = "19B4FE6F8F5EE2725C7E02DD04D31D0B"
                kek.version = "v4"
        
                let kekIdentifier = KEKIdentifier()
                let keyIncryption = KeyEncryptionAlgorithm()
        
                    keyIncryption.algorithm = "des-ede3-cbc"
                    kekIdentifier.keyIdentifier = "SpecV2TestMACKey"
                    kekIdentifier.keyVersion = "20191122164326.594"
                
                    kek.kekIdentifier = kekIdentifier
                    kek.kekAlgorithm = keyIncryption
        
                let encapsulated = EncapsulatedContent()
                let macAlgorithm = MACAlgorithm()
        
                let macAlgo = macAlgorithm
                let encapContent = encapsulated
        
                macAlgo.algorithm = "id-retail-cbc-mac-sha-256"
                encapContent.contentType = "id-data"
        
        receipient.kek = kek
        receipient.macAlgorithm = macAlgo
        receipient.encapContent = encapContent
        receipient.mac = "21347A272A992252"
        
            authenticationData.recipient = receipient
        
        securityTrailer.authenticationData = authenticationData
        
       //security trailer end
        
      //login request
             let loginRequest = LoginRequest()
             loginRequest.dateTime = "2021-12-09T13:17:06.851Z"
                 let saleSoftware = SaleSoftware()
                 let saleTerminalData = SaleTerminalData()
             
                 saleSoftware.providerIdentification = "BlackLabel"
                 saleSoftware.ApplicationName = "BlackLabel"
                 saleSoftware.softwareVersion = "1.0.0"
                 saleSoftware.certificationCode = "0x47CD40C6C54D9A"
                 saleSoftware.componentType = "Unknown"
             
                 saleTerminalData.saleCapabilities = ["PrinterReceipt","CashierStatus","CashierError"]
                 saleTerminalData.saleProfile = SaleProfile()
                 saleTerminalData.saleProfile?.genericProfile = "Basic"
             
             loginRequest.saleSoftware = saleSoftware
             loginRequest.saleTerminalData = saleTerminalData
             loginRequest.trainingModeFlag = false
             
        //poiRequest.securityTrailer = securityTrailer
        //poiRequest.loginRequest = loginRequest
        
        
        //end login request
        
        let messageHeader: MessageHeader? = MessageHeader()
            messageHeader?.protocolVersion = "3.1-dmg"
            messageHeader?.messageClass = "Service"
            messageHeader?.messageCategory = "Login"
            messageHeader?.messageType = "Request"
            messageHeader?.serviceId = "6E260F6CB"
            messageHeader?.saleId = "BlackLabelUAT1"
            messageHeader?.poiId = "BLBPOI01"
        
        poiRequest.messageHeader = messageHeader
        poiRequest.loginRequest = loginRequest
        
        sale?.saleToPOIRequest = poiRequest
        
        sale?.saleToPOIRequest?.securityTrailer = securityTrailer
        
        let str = Mapper().toJSONString(sale!, prettyPrint: false) ?? ""
        
        print("json string \(str)")
        
        return str
    }


//tofix:- create certificate from a file

struct Certificates {
  static let dataMesh =
    Certificates.certificate(filename: "root")
  
  private static func certificate(filename: String) -> SecCertificate {
    /** if let audioFileURL = Bundle.main.url(forResource: audioFileName, withExtension: "mp3", subdirectory: "audioFiles") {
        print(audioFileURL)
    }*/
    
    //let localFilePath = Bundle.main.path(forResource: filename, ofType:"crt")
    //      let data:Data = FileManager.default.contents(atPath: localFilePath!)!
    
    if let crtURL = Bundle.main.path(forResource: "root", ofType: "crt", inDirectory: "Utility"){
        print(crtURL)
    }
    
    
    //let filePath = Bundle.main.path(forResource: filename, ofType: "crt")!
    //let data = try! Data(contentsOf: URL(fileURLWithPath: filePath))
    //let certificate = SecCertificateCreateWithData(nil, crtURL as! CFData)!
//     return certificate
    return certificate as! SecCertificate
  }
}

    var sample = "{\"SaleToPOIRequest\":{\"MessageHeader\":{\"ProtocolVersion\":\"3.1-dmg\",\"MessageClass\":\"Service\",\"MessageCategory\":\"Login\",\"MessageType\":\"Request\",\"ServiceID\":\"6E260F6CB\",\"SaleID\":\"BlackLabelUAT1\",\"POIID\":\"BLBPOI01\"},\"LoginRequest\":{\"DateTime\":\"2021-12-09T13:17:06.851Z\",\"SaleSoftware\":{\"ProviderIdentification\":\"BlackLabel\",\"ApplicationName\":\"BlackLabel\",\"SoftwareVersion\":\"1.0.0\",\"CertificationCode\":\"0x47CD40C6C54D9A\",\"ComponentType\":\"Unknown\"},\"SaleTerminalData\":{\"TerminalEnvironment\":\"Attended\",\"SaleCapabilities\":[\"PrinterReceipt\",\"CashierStatus\",\"CashierError\"],\"SaleProfile\":{\"GenericProfile\":\"Basic\",\"ServiceProfiles\":[]}},\"TrainingModeFlag\":false},\"SecurityTrailer\":{\"ContentType\":\"id-ct-authData\",\"AuthenticatedData\":{\"Version\":\"v0\",\"Recipient\":{\"KEK\":{\"Version\":\"v4\",\"KEKIdentifier\":{\"KeyIdentifier\":\"SpecV2TestMACKey\",\"KeyVersion\":\"20191122164326.594\"},\"KeyEncryptionAlgorithm\":{\"Algorithm\":\"des-ede3-cbc\"},\"EncryptedKey\":\"19B4FE6F8F5EE2725C7E02DD04D31D0B\"},\"MACAlgorithm\":{\"Algorithm\":\"id-retail-cbc-mac-sha-256\"},\"EncapsulatedContent\":{\"ContentType\":\"id-data\"},\"MAC\":\"21347A272A992252\"}}}}}"
}


struct SalePOIResponse2 : Decodable {
    let messageHeader: MessageHeader2
}

struct MessageHeader2: Decodable {
    let protocolVersion:String
    let messageClass: String
    let messageCategory: String
    let messageType: String
    let serviceId: String
    let saleId: String
    let poiid: String
}



