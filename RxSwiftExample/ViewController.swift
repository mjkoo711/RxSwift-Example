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
  let disposeBag = DisposeBag() // 뷰가 할당 해제될 때 놓아줄 수 있는 일회용품의 가방

  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.dataSource = self

    searchBar
      .rx.text // RxCocoa의 Observable 속성
      .orEmpty // optional이 아니게 만듬 (String? => String)
      .debounce(RxTimeInterval.seconds(Int(0.5)), scheduler: MainScheduler.instance)
      .distinctUntilChanged() // 새로운 값이 이전과 같은지 확인
      .filter{ !$0.isEmpty } // 빈 값일 때는 필터로 막음
      .subscribe(onNext: { [unowned self] query in
        self.showCities = self.allCities.filter { $0.hasPrefix(query) }
        self.tableView.reloadData()
      }).disposed(by: disposeBag)
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

