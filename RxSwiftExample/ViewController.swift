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

  override func viewDidLoad() {
    super.viewDidLoad()
  }

  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
    view.endEditing(true)
  }

}
