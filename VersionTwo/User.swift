//
//  User.swift
//  VersionTwo
//
//  Created by Lauren Nicole Roth on 9/15/16.
//  Copyright © 2016 Skedaddle. All rights reserved.
//

import Foundation
import CoreLocation
import SwiftLocation

class User {
  let locationManager = CLLocationManager()
  
  static let currentUser : User = {
    let instance = User()
    return instance
  }()
  
  init() {
  
  }
  
  func getLatestLocation() {
    let locationRequst = Location.getLocation(withAccuracy: .block, frequency: .oneShot, timeout: 50, onSuccess: { (location) in
  
    }) { (lastValidLocation, error) in
      //TODO: handle error
      print(lastValidLocation)
      print(error)
    }
    
    debugPrint(locationRequst)
  }

}
