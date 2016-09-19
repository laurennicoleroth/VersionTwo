//
//  RoutesListViewModel.swift
//  VersionTwo
//
//  Created by Lauren Nicole Roth on 9/7/16.
//  Copyright © 2016 Skedaddle. All rights reserved.
//

import Foundation

public class RoutesListViewModel {

  let popular: [RouteViewModel] = {
    RouteAPIManager.sharedInstance.popular() {
      response in
      
      var routes : [RouteViewModel]
      
      for route in response {
        print(route)
        routes.append(RouteViewModel(route: route))
      }
      
      
    }
  }
  
  init() {

  }
  
  func loadPopularRoutes() {
    
    
  }
  
  public struct Tile {
    public let title: String
  }
  
}
