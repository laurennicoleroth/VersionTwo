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
    print("Loading popular routes. Need to implement from Routes API Manager method.")
    
    return routes
  }
  
  public struct Tile {
    public let title: String
  }
  
}
