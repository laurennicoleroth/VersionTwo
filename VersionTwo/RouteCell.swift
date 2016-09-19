//
//  RouteCell.swift
//  VersionTwo
//
//  Created by Lauren Nicole Roth on 9/19/16.
//  Copyright © 2016 Skedaddle. All rights reserved.
//

import Foundation
import UIKit
import RxSwift

class RouteCell: BaseTableViewCell {
  struct Constant {
    static let titleLableNumberOfLines = 2
  }
  
  struct Font {
    static let titleLabel = UIFont.systemFont(ofSize: 14)
  }
  
  struct Metric {
    static let cellPadding = 15.f
  }
  
  struct Color {
    static let titleLabelText = UIColor.black
  }
  
  let titleLabel = UILabel().then {
    $0.font = Font.titleLabel
    $0.textColor = Color.titleLabelText
    $0.numberOfLines = Constant.titleLableNumberOfLines
  }
  
  func configure(routeViewModel: RouteViewModel) {
    self.titleLabel.text = routeViewModel.titleText
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    
    self.titleLabel.top = Metric.cellPadding
    self.titleLabel.left = Metric.cellPadding
    self.width = self.contentView.width - Metric.cellPadding * 2
    self.titleLabel.sizeToFit()
  }
  
  func cellHeightThatFitsWidth(width: CGFloat, routeViewModel: RouteViewModel) -> CGFloat {
    let height = routeViewModel.titleText.heightThatFitsWidth(width - Metric.cellPadding * 2, font: Font.titleLabel, maximumNumberOfLines: Constant.titleLableNumberOfLines)
  }
}
