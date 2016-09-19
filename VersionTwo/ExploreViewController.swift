//
//  ViewController.swift
//  VersionTwo
//
//  Created by Lauren Nicole Roth on 9/7/16.
//  Copyright © 2016 Skedaddle. All rights reserved.
//

import UIKit
import SwiftLocation

class ExploreViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

  @IBOutlet weak var exploreTableView: UITableView!

  let currentUser = User.init()
  var routes = [RouteViewModel]()
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    RoutesListViewModel.init().loadPopularRoutes() { response in
      print(response)
    }
    
    self.exploreTableView.register(UITableViewCell.self, forCellReuseIdentifier: "RouteTileCell")
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  //TableView Setup
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

    return self.routes.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = exploreTableView.dequeueReusableCell(withIdentifier: "RouteTileCell", for: indexPath)
    let routeViewModel = routes[indexPath.row]
    print(routeViewModel)
    
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



    


