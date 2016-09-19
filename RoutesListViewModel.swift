//
//  RoutesListViewModel.swift
//  VersionTwo
//
//  Created by Lauren Nicole Roth on 9/7/16.
//  Copyright © 2016 Skedaddle. All rights reserved.
//

import Foundation

public class RoutesListViewModel {
  
  init() {
    
  }
  
  func loadPopularRoutes(completionHandler: @escaping ([RouteViewModel]) -> Void ){
    var popular = [RouteViewModel]()
    
    RouteAPIManager.sharedInstance.popular() {
      response in
      
      for route in response {
        popular.append(RouteViewModel(route: route))
      }
      completionHandler(popular)
    }
  }
  
  public struct Tile {
    public let title: String
  }
  
}
