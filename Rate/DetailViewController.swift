//
//  DetailViewController.swift
//  Rate
//
//  Created by Kirill Drozdov on 15.01.2022.
//

import UIKit
import SnapKit

class DetailViewController: UIViewController {

  // свойства
  var capital: String?
  var continent:String?
  var topLevelDomain: [String?] = []
  var callingCodes: String?
  var region: String?
  // ------------  \\

  private lazy var capitalLabel: UILabel =
  {
    let label = UILabel()
    label.text = capital
    label.textColor = .label
    label.font = .systemFont(ofSize: 20, weight: .bold)
    label.numberOfLines = 0
    label.textAlignment = .left
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()

  private lazy var topLevelDomainLabel: UILabel = {
    let label = UILabel()
    label.text = topLevelDomain[0]
    label.font = .systemFont(ofSize: 20, weight: .bold)
    label.numberOfLines = 0
    label.textAlignment = .left
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()

  private lazy var characterImageView: UIImageView =
  {
    let imageView = UIImageView()
    imageView.contentMode = .scaleToFill
    imageView.layer.cornerRadius = 50 // хз так чи как
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.backgroundColor = .brown
    return imageView
  }()

  private lazy var regionLabel: UILabel =
  {
    let label = UILabel()
    label.text = region
    label.numberOfLines = 0
    label.font = .systemFont(ofSize: 20, weight: .bold)
    label.textAlignment = .left
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()

  override func viewDidLoad() {
    super.viewDidLoad()
    preferenceViewElements()
    characterImageView.image = UIImage(named: continent!)
    view.backgroundColor = .orange
  }


  func preferenceViewElements(){

    view.addSubview(capitalLabel)
    capitalLabel.snp.makeConstraints { make in
      make.left.equalToSuperview().offset(40)
      make.height.equalTo(30)
      make.top.equalToSuperview().offset(view.bounds.height / 3)
    }


    view.addSubview(regionLabel)
    regionLabel.snp.makeConstraints { make in
      make.left.equalToSuperview().offset(40)
      make.top.equalTo(capitalLabel.snp_topMargin).offset(20)

    }

    view.addSubview(topLevelDomainLabel)
    topLevelDomainLabel.snp.makeConstraints { make in
      make.left.equalToSuperview().offset(40)
      make.top.equalTo(regionLabel.snp_topMargin).offset(20)
    }

    view.addSubview(characterImageView)
    characterImageView.snp.makeConstraints { make in
      make.height.width.equalTo(200)
//      make.center.equalToSuperview()
      make.left.equalTo(capitalLabel.snp_rightMargin).offset(50)
      make.top.equalToSuperview().offset(view.bounds.height / 4)
    }
  }
}
