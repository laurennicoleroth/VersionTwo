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
import RxCocoa
import RxSwift

class RouteAPIManager {

  private struct Constants {
    static let baseURL = Config.sharedInstance.mobileAPIEndpoint() as String
  }
  
  enum ResourcePath: String {
    case Popular = "routes"
    
    var path: String {
      return Constants.baseURL + rawValue
    }
  }
  
  
  func popular()-> Observable<Route> {
//    return Observable.create { (observer) -> Disposable in
//      Route
//        //Make the request
//      .doRequest(
//        Alamofire.request(ResourcePath.Popular.path, method: .get, encoding: JSONEncoding.default)
//          .downloadProgress { progress in
//            print("Progress: \(progress.fractionCompleted)")
//        }
//      )
//      
//    }
    
  }
//  func popular() -> [Route] {
//    
//    let urlString = baseURL+"routes"
//    
//    Alamofire.request(urlString, method: .get, encoding: JSONEncoding.default)
//      .downloadProgress() { progress in
//        print("Progress: \(progress.fractionCompleted)")
//      }
//      .validate { request, response, data in
//
//        return .success
//      }
//      .responseJSON { response in
//        
//        let json = JSON(data: response.data!)
//        let routes = JSONParser.createRoutesFrom(incomingJSON: json)
//        
//    }
//    
//  }
  
}
