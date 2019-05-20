//
//  ViewController.swift
//  RxSwiftExample
//
//  Created by MinJun KOO on 20/05/2019.
//  Copyright © 2019 mjkoo. All rights reserved.
//

import UIKit
import ChameleonFramework
import RxSwift
import RxCocoa

class ViewController: UIViewController {
  var circleView: UIView!

  override func viewDidLoad() {
    super.viewDidLoad()
    setup()
  }

  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
    view.endEditing(true)
  }

  func setup() {
    // 원 모양의 뷰를 그립니다
    circleView = UIView(frame: CGRect(origin: view.center, size: CGSize(width: 100.0, height: 100.0)))
    circleView.layer.cornerRadius = circleView.frame.width / 2.0
    circleView.center = view.center
    circleView.backgroundColor = .green
    view.addSubview(circleView)

    // gesture recognizer를 추가합니다
    // panGesture가 감지될 때마다 원이 움직이는 것을 수행 
    let gestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(circleMoved(_:)))
    circleView.addGestureRecognizer(gestureRecognizer)
  }

  @objc func circleMoved(_ recognizer: UIPanGestureRecognizer) {
    let location = recognizer.location(in: view)
    UIView.animate(withDuration: 0.1) {
      self.circleView.center = location
    }
  }

}
