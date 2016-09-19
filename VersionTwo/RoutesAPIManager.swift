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
  
  func popular(completionHandler: @escaping ([Route]) -> Void ) {
    
    let urlString = baseURL+"routes"
    
    Alamofire.request(urlString, method: .get, encoding: JSONEncoding.default)
      .downloadProgress() { progress in
        print("Progress: \(progress.fractionCompleted)")
      }
      .validate { request, response, data in

        return .success
      }
      .responseJSON { response in
        
        let json = JSON(data: response.data!)
        let routes = JSONParser.createRoutesFrom(incomingJSON: json)
        
        completionHandler(routes)

    }
    
  }
  
}
