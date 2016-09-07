//
//  ViewController.swift
//  VersionTwo
//
//  Created by Lauren Nicole Roth on 9/7/16.
//  Copyright © 2016 Skedaddle. All rights reserved.
//

import UIKit

class ExploreViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

  @IBOutlet weak var exploreTableView: UITableView!
  var routes = RoutesListViewModel().loadPopularRoutes()
  
  override func viewDidLoad() {
    super.viewDidLoad()

  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  
  }
  
  //TableView Setup
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.routes.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "RouteTileCell", for: indexPath)
    let routeViewModel = routes[indexPath.row]
    
    cell.textLabel?.text = routeViewModel.titleText
    loadTableCellImage(cell, photoURL: routeViewModel.photoURL)
    
    return cell
  }
  
  func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
    print("You selected \(indexPath.row)")
  }
  

}

