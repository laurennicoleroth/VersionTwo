//
//  BaseTableViewCell.swift
//  VersionTwo
//
//  Created by Lauren Nicole Roth on 9/19/16.
//  Copyright © 2016 Skedaddle. All rights reserved.
//

import UIKit

class BaseTableViewCell: UITableViewCell {

  override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    self.initialize()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func initialize() {
    // Override point
  }
}
