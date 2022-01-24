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
           case .disconnected(let reason, let code):
               isConnected = false
               print("websocket is disconnected: \(reason) with code: \(code)")
           case .text(let string):
               print("Received text: \(string)")
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
    
    func requestPinning2(){
        SSlPinningManager.shared.callAnyApi(urlString: "https://www.cloudposintegration.io", isCertificatePinning: true) { (response) in
                   print("pinning => \(response)")
            // print all response html
                if response.contains("successful"){
                    self.isCertPin = true
                }
            
    }
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


}
