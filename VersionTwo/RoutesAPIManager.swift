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
  
  func popular(userLocation: AnyObject) {
    
    Alamofire.request(baseURL+"events").response { response in // method defaults to `.get`
      debugPrint(response)
    }
    
    
  }
  
 /* V1 API call:
 func getPopularEvents(userLocation: AnyObject, completionHandler: (Result<[Event]>) -> Void) {
    var token = ""
    //   let token = returnAuthToken()
    if hasToken(){
      token = returnAuthToken()
    }
    Alamofire.request(.GET, baseUrl+"events", parameters: ["filter":"popular", "user_location": userLocation], headers: ["Authorization": "Token \(token)"])
      .validate()
      .responseArray { (request, response, result: Result<[Event]>) in
        completionHandler(result)
    }
  }
 */
  
}
