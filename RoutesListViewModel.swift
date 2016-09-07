//
//  RoutesListViewModel.swift
//  VersionTwo
//
//  Created by Lauren Nicole Roth on 9/7/16.
//  Copyright © 2016 Skedaddle. All rights reserved.
//

import Foundation

public class RoutesListViewModel {
  
  var routes = [RouteViewModel]()
  
  func loadPopularRoutes() -> [RouteViewModel] {
    routes = RouteAPIManager.sharedInstance.getPopularRoutes()
    return routes
  }
  
  public struct Tile {
    public let title: String
  }
  
}
