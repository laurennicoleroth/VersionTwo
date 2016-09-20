//
//  JSONParser.swift
//  VersionTwo
//
//  Created by Lauren Nicole Roth on 9/16/16.
//  Copyright © 2016 Skedaddle. All rights reserved.
//

import Foundation
import SwiftyJSON

class JSONParser: NSObject {
  
  static func createRoutesFrom(incomingJSON: SwiftyJSON.JSON) -> [Route] {
    var resultRoutes: [Route] = []
    
    for routeJSON in incomingJSON {
      
//      resultRoutes.append(Route(title: routeJSON.1["name"].rawString()!, photoURL: routeJSON.1["route_image"].rawString()!))
    }
    
    return resultRoutes
  }

}
