//
//  ViewController.swift
//  TestApplication
//
//  Created by loey on 12/19/21.
//  Copyright © 2021 loey. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    var session: Session?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //requestPinning(pinning: true)
        requestPinning2()
    }
    
    @IBAction func btnLogin(_ sender: UIButton) {
        print("do login")
    }
    
    func requestPinning2(){
        SSlPinningManager.shared.callAnyApi(urlString: "https://www.cloudposintegration.io", isCertificatePinning: true) { (response) in
                   print(response)
    }
    
    func requestPinning(pinning: Bool){
        let url = URL(string:"wss://www.cloudposintegration.io/nexodev")
        
        if pinning {
            
//            let evaluators: [String: ServerTrustEvaluating] = ["root": PublicKeysTrustEvaluator()]
            let evaluators = [
              "cloudposintegration.io":
                PinnedCertificatesTrustEvaluator(certificates: [
                  Certificates.dataMesh
                ])
            ]
            let manager = ServerTrustManager(evaluators: evaluators)
            session = Session(serverTrustManager: manager)
        } else {
            session = Session()
        }
        
        session!
            .request(url!, method: .get)
        .validate()
        .response(completionHandler: { [weak self] response in
            switch response.result {
            case .success:
                    print("pinning success")
            case .failure(let error):
                switch error {
                case .serverTrustEvaluationFailed(let reason):
                    // The reason here is a place where you might fine-tune your
                    // error handling and possibly deduce if it's an actualy MITM
                    // or just another error, like certificate issue.
                    //
                    // In this case, this will show `noRequiredEvaluator` if you try
                    // testing against a domain not in the evaluators list which is
                    // the closest I'm willing to setting up a MITM. In production,
                    // it will most likely be one of the other evaluation errors.
                    print(reason)

                    print("error pining")
                default:
                    print("no pinning")
                }
            }
        })
        
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
