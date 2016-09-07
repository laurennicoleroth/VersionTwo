//
//  UIImage.swift
//  VersionTwo
//
//  Created by Lauren Nicole Roth on 9/7/16.
//  Copyright © 2016 Skedaddle. All rights reserved.
//

import Foundation

extension UIImage {
  func loadTableCellImage(cell: UITableViewCell, photoURL: NSURL?) {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
      guard let imageURL = photoURL, let imageData = NSData(contentsOfURL: imageURL) else {
        return
      }
      dispatch_async(dispatch_get_main_queue()) {
        cell.imageView?.image = UIImage(data: imageData)
        cell.setNeedsLayout()
      }
    }
  }
}
