//
//  Config.swift
//  VersionTwo
//
//  Created by Lauren Nicole Roth on 9/7/16.
//  Copyright © 2016 Skedaddle. All rights reserved.
//

import Foundation

class Config: NSObject {
  static let sharedInstance = Config()
  
  var configs: NSDictionary!
  
  override init() {
    let currentConfiguration = Bundle.main.object(forInfoDictionaryKey: "Config")!
    let path = Bundle.main.path(forResource: "Config", ofType: "plist")!
    
    configs = NSDictionary(contentsOfFile: path)!.object(forKey: currentConfiguration) as! NSDictionary
  }
}

extension Config {
  func mobileAPIEndpoint() -> String {
    return configs.object(forKey: "MobileAPIEndpointURL") as! String
  }
  
  func socketEndpoint() -> String {
    return configs.object(forKey: "SocketEndpointURL") as! String
  }
  
  func loggingLevel() -> String {
    return configs.object(forKey: "loggingLevel") as! String
  }
}
