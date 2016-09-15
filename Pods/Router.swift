//
//  Router.swift
//  Pods
//
//  Created by Lauren Nicole Roth on 9/15/16.
//
//

import Foundation
import Alamofire

/* Routes Router
 This router is for routes requests only. 
 
 letskedaddle.com/mobile_api/v2/routes/#{id} */

enum RoutesRouter: URLRequestConvertible {
  static let baseURLString = Config.sharedInstance.mobileAPIEndpoint()
  static var OAuthToken: String?
  
  case Get(Int)
  case Create([String: AnyObject])
  case Delete(Int)
  
  var method: Alamofire.Method {
    switch self {
    case .Get:
      return .get
    case .Create:
      return .create
    case .Delete:
      return .delete
    }
  }
  
  let url:NSURL = {
    let relativePath:String?
    switch self {
    case .get(let routeNumber):
      relativePath = "routes/\(routeNumber)"
    case .create(let routeNumber):
      relativePath = "routes/\(routeNumber)"
    case .delete(let routeNumber):
      relativePath = "routes/\(routeNumber)"
    }
  }
  
  var urlRequest: URLRequest {
    let url = URL(string: Router.baseURLString)!
    var mutableURLRequest = URLRequest(url: url.appendingPathComponent(path))
    mutableURLRequest.httpMethod = method.rawValue
    
    if let oAuthToken = Router.OAuthToken {
      mutableURLRequest.setValue("Token \(oAuthToken)", forHTTPHeaderField: "Authorization")
    }
    
    switch self {
    case .Get(let parameters):
      return try! Alamofire.URLEncoding().encode(mutableURLRequest, with: parameters)
    case .Create(let parameters):
      do {
        return try Alamofire.JSONEncoding().encode(mutableURLRequest, with: parameters)
        
      } catch {
        // handle any error thrown by doing the JSON encoding with parameters
      }
    }
    
  }
  
  
  
}
