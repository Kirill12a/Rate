//
//  CreateElements.swift
//  Rate
//
//  Created by Kirill Drozdov on 18.01.2022.
//

import Foundation
import UIKit

class CreateElements
{
  static var create = CreateElements()


  func createElements(capital: String, topLevelDomain: [String], region: String )
  {
     lazy var capitalLabel: UILabel =
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

     lazy var topLevelDomainLabel: UILabel = {
      let label = UILabel()
      label.text = topLevelDomain[0]
      label.font = .systemFont(ofSize: 20, weight: .bold)
      label.numberOfLines = 0
      label.textAlignment = .left
      label.translatesAutoresizingMaskIntoConstraints = false
      return label
    }()

     lazy var characterImageView: UIImageView =
    {
      let imageView = UIImageView()
      imageView.contentMode = .scaleToFill
      imageView.layer.cornerRadius = 50 // хз так чи как
      imageView.translatesAutoresizingMaskIntoConstraints = false
      imageView.backgroundColor = .brown
      return imageView
    }()

     lazy var regionLabel: UILabel =
    {
      let label = UILabel()
      label.text = region
      label.numberOfLines = 0
      label.font = .systemFont(ofSize: 20, weight: .bold)
      label.textAlignment = .left
      label.translatesAutoresizingMaskIntoConstraints = false
      return label
    }()
  }
}
