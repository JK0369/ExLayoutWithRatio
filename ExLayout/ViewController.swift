//
//  ViewController.swift
//  ExLayout
//
//  Created by Jake.K on 2022/06/07.
//

import UIKit
import SnapKit

extension UIScreen {
  /// - Mini, SE: 375.0
  /// - pro: 390.0
  /// - pro max: 428.0
  var isWiderThan375pt: Bool { self.bounds.size.width > 375 }
}

class ViewController: UIViewController {
  private enum Constant {
    static let someViewSize = UIScreen.main.isWiderThan375pt ? CGSize(width: 360, height: 300) : CGSize(width: 300, height: 200)
    static let otherViewWidthRatio = 0.6
    static let otherViewHeightRatio = 0.2
  }
  
  private let someView: UIView = {
    let view = UIView()
    view.backgroundColor = .systemBlue
    return view
  }()
  private let otherView: UIView = {
    let view = UIView()
    view.backgroundColor = .red
    return view
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.view.addSubview(self.someView)
    self.view.addSubview(self.otherView)
    
    self.someView.snp.makeConstraints {
      $0.top.centerX.equalTo(self.view.safeAreaLayoutGuide)
      $0.size.equalTo(Constant.someViewSize)
    }
    self.otherView.snp.makeConstraints {
      $0.top.equalTo(self.someView.snp.bottom)
      $0.centerX.equalToSuperview()
      $0.width.equalToSuperview().multipliedBy(Constant.otherViewWidthRatio)
      $0.height.equalToSuperview().multipliedBy(Constant.otherViewHeightRatio)
    }
  }
}
