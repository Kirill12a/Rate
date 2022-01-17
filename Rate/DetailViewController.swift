//
//  DetailViewController.swift
//  Rate
//
//  Created by Kirill Drozdov on 15.01.2022.
//

import UIKit
import SnapKit

class DetailViewController: UIViewController {


  var capital: String?
  var continent:String?
  var topLevelDomain: [String?] = [] // label.text = topLevelDomain[0] так буду выбирать када будет label для этого свойства

  private lazy var nameLabel: UILabel =
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

  private lazy var characterImageView: UIImageView =
  {
    let imageView = UIImageView()
    imageView.contentMode = .scaleToFill
    imageView.layer.cornerRadius = 50 // хз так чи как
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.backgroundColor = .brown
    return imageView
  }()




  override func viewDidLoad() {
    super.viewDidLoad()

    crea()

    characterImageView.image = UIImage(named: continent!)

    view.backgroundColor = .orange
  }


  func crea(){ // дать норм название
    view.addSubview(nameLabel)

    nameLabel.snp.makeConstraints { make in

      make.left.equalToSuperview().inset(2)
      
      make.top.equalTo(view.snp_topMargin).offset(10)


    }

    view.addSubview(characterImageView)
    characterImageView.snp.makeConstraints { make in
      make.height.width.equalTo(200)
//      make.top.equalTo(nameLabel.snp_bottomMargin).offset(20)
      make.center.equalToSuperview()
    }
  }

}
