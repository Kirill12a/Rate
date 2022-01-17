//
//  Conditions.swift
//  Rate
//
//  Created by Kirill Drozdov on 18.01.2022.
//

import Foundation
import UIKit

class Conditions
{

  static var conditions = Conditions()

   func condition(detail: DetailViewController,indexPath: IndexPath, itemstringArr: [InfoCountryElement]){
    if itemstringArr[indexPath.row].region == "Europe"
    {
      detail.continent = "europe"
    }

    if itemstringArr[indexPath.row].region == "Africa"
    {
      detail.continent = "africa"
    }

    if itemstringArr[indexPath.row].region == "Americas"
    {
      detail.continent = "americas"
    }

    if itemstringArr[indexPath.row].region == "Asia"
    {
      detail.continent = "asia"
    }

    if itemstringArr[indexPath.row].region == "Okeania"
    {
      detail.continent = "okeania"
    }
  }
}
