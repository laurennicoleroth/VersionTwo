//
//  Route.swift
//  VersionTwo
//
//  Created by Lauren Nicole Roth on 9/7/16.
//  Copyright © 2016 Skedaddle. All rights reserved.
//

import Foundation
import SwiftyJSON

class Route {
  var title: String
  var photoURL: String
  
  init(json: AnyObject) {
    let data = JSON(json)
    self.title = data["name"].stringValue
    self.photoURL = data["route_image"].stringValue
  }
}
