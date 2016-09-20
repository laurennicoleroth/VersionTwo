//
//  RouteViewModel.swift
//  VersionTwo
//
//  Created by Lauren Nicole Roth on 9/7/16.
//  Copyright © 2016 Skedaddle. All rights reserved.
//

import Foundation

class RouteViewModel {
  
  private struct Constants {
    static let baseURL = Config.sharedInstance.mobileAPIEndpoint()
    static let suffix = "/routes/"
  }
  
  private var route: Route
  
  var titleText: String? {
    return route.title
  }
  
  var photoURL: NSURL? {
    return NSURL(string: route.photoURL)
  }
  
  init(route: Route) {
    self.route = route
  }
}
