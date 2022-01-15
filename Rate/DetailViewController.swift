//
//  DetailViewController.swift
//  Rate
//
//  Created by Kirill Drozdov on 15.01.2022.
//

import UIKit
import SnapKit

class DetailViewController: UIViewController {


  var text: String?

  private lazy var nameLabel: UILabel =
      {
          let label = UILabel()
        label.text = text
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
         imageView.translatesAutoresizingMaskIntoConstraints = false
       imageView.backgroundColor = .brown
         return imageView
     }()


  var name:String?

    override func viewDidLoad() {
        super.viewDidLoad()

      crea()

      characterImageView.image = UIImage(named: name!)

      view.backgroundColor = .orange
    }


  func crea(){
    view.addSubview(nameLabel)

    nameLabel.snp.makeConstraints { make in

      make.left.equalToSuperview().inset(2)
                  make.right.equalToSuperview().inset(2)

                  make.top.equalTo(view.snp_topMargin).offset(10)


    }

    view.addSubview(characterImageView)
    characterImageView.snp.makeConstraints { make in
      make.height.width.equalTo(200)
      make.top.equalTo(nameLabel.snp_bottomMargin).offset(20)
    }
  }

}
