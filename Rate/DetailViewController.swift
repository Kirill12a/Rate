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
  var topLevelDomain: [String?] = [] // label.text = topLevelDomain[0] так буду выбирать када будет label для этого свойства
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


  func preferenceViewElements(){ // дать норм название

    view.addSubview(capitalLabel)
    capitalLabel.snp.makeConstraints { make in
      make.left.equalToSuperview().inset(2)
      make.top.equalTo(view.snp_topMargin).offset(10)
    }

    view.addSubview(topLevelDomainLabel)
    topLevelDomainLabel.snp.makeConstraints { make in
      make.right.equalToSuperview().inset(40)
      make.top.equalToSuperview().inset(70)
//      make.top.equalTo().offset(49)
    }

    view.addSubview(characterImageView)
    characterImageView.snp.makeConstraints { make in
      make.height.width.equalTo(200)
//      make.top.equalTo(capitalLabel.snp_bottomMargin).offset(20)
      make.center.equalToSuperview()
    }

    view.addSubview(regionLabel)
    regionLabel.snp.makeConstraints { make in
      make.left.equalToSuperview().inset(60)
      make.top.equalToSuperview().inset(100)
    }


  }

}
