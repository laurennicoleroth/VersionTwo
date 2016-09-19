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
  
  static let sharedInstance = RouteAPIManager()
  
  private struct Constants {
    static let baseURL = Config.sharedInstance.mobileAPIEndpoint() as String
  }
  
  enum ResourcePath: String {
    case Popular = "routes"
    
    var path: String {
      return Constants.baseURL + rawValue
    }
  }
  
  func popular() -> Observable<[Route]> {
    // Return routes observable
    
    return Observable<[Route]>.create { observer in
      let request = Alamofire.request(ResourcePath.Popular.path, method: .get, encoding: JSONEncoding.default)
        .responseJSON (completionHandler:  { response in
          
          debugPrint(response)
          
          let json = JSON(data: response.data!)
          let routes = JSONParser.createRoutesFrom(incomingJSON: json)
            observer.on(.next(routes))
        });
      return Disposables.create {
        request.cancel()
      }
    }
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
