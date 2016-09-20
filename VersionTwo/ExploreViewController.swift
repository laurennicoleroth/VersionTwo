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

class ExploreViewController: UIViewController, UITableViewDelegate {
  
  @IBOutlet weak var exploreTableView: UITableView!
  

  override func viewDidLoad() {
    super.viewDidLoad()
  
//    self.exploreTableView.register(UITableViewCell.self, forCellReuseIdentifier: "RouteTileCell")
    
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



    


