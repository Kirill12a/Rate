//
//  PreferenceViewElementDetailVC.swift
//  Rate
//
//  Created by Kirill Drozdov on 18.01.2022.
//

import Foundation
import UIKit

class PreferenceViewElementDetailVC
{
  static var preferenceView = PreferenceViewElementDetailVC()

  func preferenc(view: UIView,capitalLabel: UILabel,regionLabel:UILabel, topLevelDomainLabel: UILabel,characterImageView:UIImageView)
  {
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
      make.left.equalTo(capitalLabel.snp_rightMargin).offset(50)
      make.top.equalToSuperview().offset(view.bounds.height / 4)
    }
  }


}
