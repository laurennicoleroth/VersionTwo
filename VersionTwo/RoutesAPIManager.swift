//
//  RoutesAPIManager.swift
//  VersionTwo
//
//  Created by Lauren Nicole Roth on 9/7/16.
//  Copyright © 2016 Skedaddle. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import Locksmith

class RouteAPIManager {
  
  static let sharedInstance = RouteAPIManager()
  var baseURL = Config.sharedInstance.mobileAPIEndpoint()
  
  func popular() {
    
    let urlString = baseURL+"routes"
    print(urlString)
    
    Alamofire.request(urlString, method: .get, encoding: JSONEncoding.default)
      .downloadProgress() { progress in
        print("Progress: \(progress.fractionCompleted)")
      }
      .validate { request, response, data in
        // Custom evaluation closure now includes data (allows you to parse data to dig out error messages if necessary)
        return .success
      }
      .responseJSON { response in
        
        let json = JSON(data: response.data!)
        print(json[0])
        
        if let pickUpAddress = json[0]["origin"].string {
          let photoURL = json[0]["route_image"].string
          print(photoURL)
          debugPrint(pickUpAddress)
          let firstRoute = Route(title: pickUpAddress, photoURL: photoURL!)
          print(firstRoute)
        }
    }
    
  }
  
}
