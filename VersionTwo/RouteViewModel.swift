//
//  RouteViewModel.swift
//  VersionTwo
//
//  Created by Lauren Nicole Roth on 9/7/16.
//  Copyright © 2016 Skedaddle. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

class RouteViewModel {
  
  private struct Constants {
    static let baseURL = Config.sharedInstance.mobileAPIEndpoint()
    static let suffix = "/routes/"
  }
  
  private var route: Route
  let disposeBag = DisposeBag()
  
  var searchText = BehaviorSubject<String?>.value
  var routeTitle = BehaviorSubject<String>.value
  
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
