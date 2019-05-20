//
//  ViewController.swift
//  RxSwiftExample
//
//  Created by MinJun KOO on 20/05/2019.
//  Copyright © 2019 mjkoo. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
  @IBOutlet var searchBar: UISearchBar!
  @IBOutlet var tableView: UITableView!


  var showCities: [String] = []
  var allCities = ["New York", "London", "Oslo", "Warsaw", "Berlin", "Praga"]

  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.dataSource = self
  }

  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
    view.endEditing(true)
  }

}

extension ViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return showCities.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "CityTableCell", for: indexPath)
    cell.textLabel?.text = showCities[indexPath.row]

    return cell
  }


}

