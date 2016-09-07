//
//  RoutesAPIManager.swift
//  VersionTwo
//
//  Created by Lauren Nicole Roth on 9/7/16.
//  Copyright © 2016 Skedaddle. All rights reserved.
//

import Foundation

class RouteAPIManager {
  
  static let sharedInstance = RouteAPIManager()
  
  var baseURL = Config.sharedInstance.mobileAPIEndpoint()
  
  func getPopularRoutes() -> [RouteViewModel] {
    let routes: [RouteViewModel] = {
      let boston = Route(title: "Going to Boston", photoURL: "https://s3.amazonaws.com/skedaddle-production/uploads/2e38ac30-e324-4bb2-95da-73d64f7f6f16/image-24.jpg")
      let toronto = Route(title: "Going to Toronto", photoURL: "https://s3.amazonaws.com/skedaddle-production/uploads/08aa2c57-9703-4db7-8af9-9aef9e945b8d/image-18.jpg")
      let cape_cod = Route(title: "Going to Cape Cod", photoURL: "https://s3.amazonaws.com/skedaddle-production/uploads/5138b799-9363-4aa7-b909-49e4d5bac5ad/image-26.jpg")
      
      return [RouteViewModel(route: boston), RouteViewModel(route: toronto), RouteViewModel(route: cape_cod)]
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
