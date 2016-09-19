//
//  ViewController.swift
//  VersionTwo
//
//  Created by Lauren Nicole Roth on 9/7/16.
//  Copyright © 2016 Skedaddle. All rights reserved.
//

import UIKit
import SwiftLocation
import RxSwift
import RxDataSources

class ExploreViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

  @IBOutlet weak var exploreTableView: UITableView!
  let dataSource = RxTableViewSectionedReloadDataSource<SectionModel<String, User>>()
  let userViewModel = UserViewModel()
  let disposeBag = DisposeBag()

  override func viewDidLoad() {
    super.viewDidLoad()
  
//    self.exploreTableView.register(UITableViewCell.self, forCellReuseIdentifier: "RouteTileCell")
    
    dataSource.configureCell = { table, indexPath, user in
      let cell = table.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
      let string = "\(user.screenName) is following \(user.followingCount) users and is followed by \(user.followersCount) users."
      cell.textLabel?.text = string
      cell.textLabel?.numberOfLines = 0
      cell.backgroundColor = indexPath.row % 2 == 0 ? UIColor.whiteColor() : UIColor(red: 0, green: 0, blue: 0, alpha: 0.05)
      return cell
    }
    
    userViewModel.getUsers()
      .bindTo(exploreTableView.rx_itemsWithDataSource(dataSource))
      .addDisposableTo(disposeBag)
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  //TableView Setup
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

//    return self.routes.count
    return 1
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = exploreTableView.dequeueReusableCell(withIdentifier: "RouteTileCell", for: indexPath)
//    let routeViewModel = routes[indexPath.row]
    
//    cell.textLabel?.text = routeViewModel.titleText
//    loadTableCellImage(cell: cell, photoURL: routeViewModel.photoURL)
    
    return cell
  }
  
  func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
    // do something with the selected row
  }
  
  func loadTableCellImage(cell: UITableViewCell, photoURL: NSURL?) {
    DispatchQueue.global().async {
      guard let imageURL = photoURL, let imageData = NSData(contentsOf: imageURL as URL) else {
        return
      }
      DispatchQueue.main.async {
        cell.imageView?.image = UIImage(data: imageData as Data)
        cell.setNeedsLayout()
      }
    }
  }
  
}



    


