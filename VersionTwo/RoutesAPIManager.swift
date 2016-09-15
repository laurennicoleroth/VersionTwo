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
  
}
