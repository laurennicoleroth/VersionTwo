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
  var routes = ["1", "2", "3"]
  
  override func viewDidLoad() {
    super.viewDidLoad()

  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  
  }
  
  //TableView Setup
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 0
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "RouteTileCell", for: indexPath)
    let routeViewModel = routes[indexPath.row]
    
    cell.textLabel?.text = self.routes[indexPath.row]
    
    return cell
  }
  
  

}

