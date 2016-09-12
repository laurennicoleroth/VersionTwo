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

class RouteAPIManager {
  
  static let sharedInstance = RouteAPIManager()
  let sessionManager = Alamofire.SessionManager
  
  var baseURL = Config.sharedInstance.mobileAPIEndpoint()
  
  var AuthToken: String? {
    set {
      if let 
    }
  }
  
  func getEventsFromSearch(query: AnyObject, userLocation: AnyObject, completionHandler: (Result<Route>) -> Void) {
    /*
     let parameters = ["": ""]
      Alamofire.request(baseURL+"events", parameters: parameters)
     }
  
  func popular(userLocation: AnyObject, completionHandler: (Result<[Event]>) -> Void) {
    var token = ""

    Alamofire.request(.GET, baseUrl+"events", parameters: ["filter":"popular", "user_location": userLocation], headers: ["Authorization": "Token \(token)"])
      .validate()
      .responseArray { (request, response, result: Result<[Event]>) in
        completionHandler(result)
    } 
     */
  }
  
  func popular() {
    let userLocation = ["-71", "40"]
    let parameters: Parameters = ["filter": "popular", "user_location" : userLocation]
    let urlString = baseURL+"events"
    let token = "ajqp924fj"
  
    Alamofire.request(urlString, method: .get, parameters: parameters, encoding: JSONEncoding.default, headers: ["Authorization": "Token \(token)"])
      .downloadProgress(queue: DispatchQueue.main) { progress in
        print("Progress: \(progress.fractionCompleted)")
      }
  
      .validate { request, response, data in
        // Custom evaluation closure now includes data (allows you to parse data to dig out error messages if necessary)
        return .success
      }
  
      .responseJSON { response in
        //debugPrint(response)
        
        print("Response is: \(response)")
    }
  }
  
  func getPopularRoutes(completion: @escaping (JSON) -> () ) -> [RouteViewModel] {
    
    Alamofire.request(baseURL+"events", method: .get)
      .validate()
      .responseJSON { response in
        print("Response: \(response.result)")
        switch response.result {
        case .success:
          completion(JSON(data: response.data!))
        case .failure:
          print("Failure: \(response.result.error)")
        }
    }

  
    let routes: [RouteViewModel] = {
      let boston = Route(title: "Going to Boston", photoURL: "https://s3.amazonaws.com/skedaddle-production/uploads/2e38ac30-e324-4bb2-95da-73d64f7f6f16/image-24.jpg")
      let toronto = Route(title: "Going to Toronto", photoURL: "https://s3.amazonaws.com/skedaddle-production/uploads/08aa2c57-9703-4db7-8af9-9aef9e945b8d/image-18.jpg")
      let cape_cod = Route(title: "Going to Cape Cod", photoURL: "https://s3.amazonaws.com/skedaddle-production/uploads/5138b799-9363-4aa7-b909-49e4d5bac5ad/image-26.jpg")
      let tetons = Route(title: "Going to Tetons", photoURL: "https://s3.amazonaws.com/skedaddle-production/uploads/2e38ac30-e324-4bb2-95da-73d64f7f6f16/image-24.jpg")
      let boulder = Route(title: "Going to Boulder", photoURL: "https://s3.amazonaws.com/skedaddle-production/uploads/08aa2c57-9703-4db7-8af9-9aef9e945b8d/image-18.jpg")
      let los_angeles = Route(title: "Going to Los Angeles", photoURL: "https://s3.amazonaws.com/skedaddle-production/uploads/5138b799-9363-4aa7-b909-49e4d5bac5ad/image-26.jpg")
      let chicago = Route(title: "Going to Chicago", photoURL: "https://s3.amazonaws.com/skedaddle-production/uploads/2e38ac30-e324-4bb2-95da-73d64f7f6f16/image-24.jpg")
      let miami = Route(title: "Going to Miami", photoURL: "https://s3.amazonaws.com/skedaddle-production/uploads/08aa2c57-9703-4db7-8af9-9aef9e945b8d/image-18.jpg")
      let portland = Route(title: "Going to Portland", photoURL: "https://s3.amazonaws.com/skedaddle-production/uploads/5138b799-9363-4aa7-b909-49e4d5bac5ad/image-26.jpg")
      
      //return [RouteViewModel(route: boston), RouteViewModel(route: toronto), RouteViewModel(route: cape_cod), RouteViewModel(route: tetons), RouteViewModel(route: boulder), RouteViewModel(route: miami), RouteViewModel(route: los_angeles), RouteViewModel(route: chicago), RouteViewModel(route: portland)]
      
      return [RouteViewModel(route: boston)]
    }()
    
    return routes
  }
  
  func getRoutesJustForYou() -> [RouteViewModel] {
    let routes: [RouteViewModel] = {
      let toronto = Route(title: "Going to Toronto", photoURL: "https://s3.amazonaws.com/skedaddle-production/uploads/08aa2c57-9703-4db7-8af9-9aef9e945b8d/image-18.jpg")
      let cape_cod = Route(title: "Going to Cape Cod", photoURL: "https://s3.amazonaws.com/skedaddle-production/uploads/5138b799-9363-4aa7-b909-49e4d5bac5ad/image-26.jpg")
      
      return [ RouteViewModel(route: toronto), RouteViewModel(route: cape_cod)]
    }()
    
    return routes
  }
  
  func getNewRoutes() -> [RouteViewModel] {
    print("Get new routes")
    let routes: [RouteViewModel] = {
      let boston = Route(title: "Going to Boston", photoURL: "https://s3.amazonaws.com/skedaddle-production/uploads/2e38ac30-e324-4bb2-95da-73d64f7f6f16/image-24.jpg")
      
      return [RouteViewModel(route: boston)]
    }()
    
    return routes
  }
  
}
