# ``fusionCloud-framework-ios``

## Overview

This repository contains a websocket client and security components to make it easy for developer to connect and communicate with Unify - a platform created by DataMesh.

## Getting Started

#### Configuration

FusionClientConfig

- <!--@START_MENU_TOKEN@-->certificateLocation (root CA location e.g., 'src/main/resources/root.crt')<!--@END_MENU_TOKEN@-->

- <!--@START_MENU_TOKEN@-->serverDomain (domain/server URI)<!--@END_MENU_TOKEN@-->

- <!--@START_MENU_TOKEN@-->socketProtocol (defaults to 'TLSv1.2' if not provided)<!--@END_MENU_TOKEN@-->

KEKConfig

- <!--@START_MENU_TOKEN@-->value (KEK provided by DataMesh)<!--@END_MENU_TOKEN@-->

- <!--@START_MENU_TOKEN@-->keyIdentifier (SpecV2TestMACKey or SpecV2ProdMACKey)<!--@END_MENU_TOKEN@-->

- <!--@START_MENU_TOKEN@-->keyVersion (version)<!--@END_MENU_TOKEN@-->

SalesSystemConfig (static sale system settings - provided by DataMesh)

- <!--@START_MENU_TOKEN@-->value (KEK provided by DataMesh)<!--@END_MENU_TOKEN@-->

- <!--@START_MENU_TOKEN@-->keyIdentifier (SpecV2TestMACKey or SpecV2ProdMACKey)<!--@END_MENU_TOKEN@-->

- <!--@START_MENU_TOKEN@-->keyVersion (version)<!--@END_MENU_TOKEN@-->

## Dependencies

This project uses the following dependencies

- [Starscream](https://cocoapods.org/pods/Starscream)- pod dependency that handle WebSocket

- [ObjectMapper](https://cocoapods.org/pods/ObjectMapper)- pod dependency that convert JSON into Swift model

- [IDZSwiftCommonCrypto](https://github.com/iosdevzone/IDZSwiftCommonCrypto)- pod dependency that help encryption/decryption

## Re-Building FusionCloud Framework

This is the instruction on rebuilding FusionCloud framework if there will be an update or new integration will be made.

- Pressf cmd + B or cmd + K + b to rebuild after the changes

- Once build successful, Select fusion cloud toolkit icon under FusionCloud Project, Show in Finder ( step 2 image under resources )

- After redirected to folder location copy the Framework to be pasted on App to which it will be integrated

- On the Workspace app to which it will be integrated. Select Workspace, Choose General and add to the library under (Frameworks, Libraries, and Embedded content section). ( step 4 image under resources )

- Show in Finder the selected framework and replace the existing framework or Embed and Sign if not yet integrated

- Finally rebuild your test application

## Usage

The com.dmg.fusion.client.WebSocketClient.connect(URI) method expects a valid wss URI to connect to. Unify utilises a self-signed root CA provided by DataMesh. The certificate must be added to the project directory and its location must be specified in the properties file (see Getting Started) with key certificate.location.


### Connecting to websocket server:
var request = URLRequest(url: URL(string: serverDomain!)!)
request.timeoutInterval = 10
socket = WebSocket(request: request)
socket.delegate = self
socket.connect() 

### Generate Security Trailer:
```
let securityTrailer = SecurityTrailer()
securityTrailer.contentType = "id-ct-authData"
let authenticatedData = AuthenticationData()
    authenticatedData.version = "v0"
    let recipient = Recipient()
        let KEK = KEK()
            KEK.version = "v4"
                let kekIdentifier = KEKIdentifier()
                    kekIdentifier.keyIdentifier = keyIdentifier
                    kekIdentifier.keyVersion = keyVersion
                let keyEncryptionAlgorithm = KeyEncryptionAlgorithm()
                    keyEncryptionAlgorithm.algorithm = "des-ede3-cbc"
            KEK.kekIdentifier = kekIdentifier
            KEK.kekAlgorithm = keyEncryptionAlgorithm
            KEK.encryptedKey = ""//encryptedString
        let macAlgorithm = MACAlgorithm()
            macAlgorithm.algorithm = "id-retail-cbc-mac-sha-256"
        let encapsulatedContent = EncapsulatedContent()
            encapsulatedContent.contentType = "id-data"
    recipient.kek = KEK
    recipient.macAlgorithm = macAlgorithm
    recipient.encapContent = encapsulatedContent
    recipient.mac = ""//MAC
authenticatedData.recipient = recipient
securityTrailer.authenticationData = authenticatedData
```

### Build a SaleToPOIRequest:
```
 let paymentRequest = PaymentRequest()
            
            let saleData = SaleData()
                saleData.tokenReqType = "Unknown"
                
                let saleTransID = SaleTransactionID()
                    saleTransID.timeStamp = dateFormat.string(from: Date())
                    saleTransID.transID = "30000004"
        
                saleData.saleTransID = saleTransID
        
            let paymentTransaction = PaymentTransaction()
        
                let amountReq = AmountsReq()
                    amountReq.currency = "AUD"
                    amountReq.requestedAmount = 2000
        
                let saleItem1 = SaleItem()
                    saleItem1.itemId = 1028903671
                    saleItem1.productCode = "RTX 3090"
                    saleItem1.unitMeasure = "Unit"
                    saleItem1.quantity = 1
                    saleItem1.unitPrice = 1999.99
                    saleItem1.productLabel = "NVIDIA GEFORCE"
        
                paymentTransaction.amountsReq = amountReq
                paymentTransaction.saleItem = [saleItem1]
            
            let paymentData = PaymentData()
                paymentData.paymentType = "Normal" //Refund - for refund
        
        paymentRequest.saleData = saleData
        paymentRequest.paymentTrans = paymentTransaction
        paymentRequest.paymentData  = paymentData
```
For more details on how to use the methods, please refer to the sample app.

