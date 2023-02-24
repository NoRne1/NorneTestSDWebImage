//
//  ViewController.swift
//  NorneTestSDWebImage
//
//  Created by yupenghe12138@gmail.com on 02/24/2023.
//  Copyright (c) 2023 yupenghe12138@gmail.com. All rights reserved.
//

import NSObject_Rx
import RxSwift
import RxCocoa
import UIKit
import SnapKit

class ViewController: UIViewController {
  private lazy var responseChainView: UIView = .init().also {
    $0.backgroundColor = .yellow
  }

  private lazy var responseChainView2: UIView = .init().also {
    $0.backgroundColor = .blue
  }

  private lazy var contentStackView: UIStackView = .init().also {
    $0.axis = .vertical
    $0.spacing = 20
    $0.alignment = .center
  }

  private lazy var button = UIButton().also {
    $0.backgroundColor = .blue
    $0.setTitle("click me button", for: .normal)
  }
  override func viewDidLoad() {
    super.viewDidLoad()
    setupSubviews()
    setupBindings()
  }

  private func setupSubviews() {
    view.addSubview(responseChainView)
    responseChainView.snp.makeConstraints { make in
      make.edges.equalToSuperview()
    }

    responseChainView.addSubview(responseChainView2)
    responseChainView2.snp.makeConstraints{ make in
      make.center.equalToSuperview()
      make.size.equalTo(200)
    }

    responseChainView.addSubview(contentStackView)
    contentStackView.snp.makeConstraints { make in
      make.center.equalToSuperview()
    }

    contentStackView.addArrangedSubview(button)
    button.snp.makeConstraints { make in
      make.size.equalTo(100)
    }
  }

  private func setupBindings() {
    let bgTap = UITapGestureRecognizer(target: self, action: #selector(bgTapAction))
    responseChainView.addGestureRecognizer(bgTap)

    button.rx.controlEvent(.touchUpInside).subscribe(onNext: { _ in
      debugPrint("button clicked")
    }).disposed(by: rx.disposeBag)
  }

  @objc func bgTapAction() {
    debugPrint("bgTapAction clicked")
  }
}
