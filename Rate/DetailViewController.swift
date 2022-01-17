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
    imageView.backgroundColor = UIColor(red: 255/255, green: 228/255, blue: 196/255, alpha: 1)
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

  override func viewDidLoad()
  {
    super.viewDidLoad()
    PreferenceViewElementDetailVC.preferenceView.preferenc(view: view, capitalLabel: capitalLabel, regionLabel: regionLabel, topLevelDomainLabel: topLevelDomainLabel, characterImageView: characterImageView)
      characterImageView.image = UIImage(named: continent!)

    view.backgroundColor = UIColor(red: 255/255, green: 228/255, blue: 196/255, alpha: 1)
  }


}
