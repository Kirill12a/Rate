//
//  ViewController.swift
//  Rate
//
//  Created by Kirill Drozdov on 02.01.2022.
//

import UIKit
import SnapKit
import Alamofire


class ViewController: UIViewController {
    
    private var apiKey = "6ff59d862ee60effee6304513c914c59"
    
//http://api.countrylayer.com/v2/all?access_key=6ff59d862ee60effee6304513c914c59 просто запрос с полученимем всех стран
//http://api.countrylayer.com/v2/name/Russian?access_key=6ff59d862ee60effee6304513c914c59  запрос с получением страны на выбор
//http://api.countrylayer.com/v2/capital/Moscow?access_key=6ff59d862ee60effee6304513c914c59 запрос с получением инфы о столице
//http://api.countrylayer.com/v2/currency/eur?access_key=6ff59d862ee60effee6304513c914c59 запрос с получением инфы по валюте; типо в каких странах она (тут евро)
  let url = "http://api.countrylayer.com/v2/all?access_key=6ff59d862ee60effee6304513c914c59"

  var infoCountryElement =  [InfoCountryElement]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

      var name: String?

      let labelName: UILabel = {
          let label = UILabel()
//          label.text = "\(name ?? String())"
          label.textColor = .black
          label.font = UIFont(name: "Party LET Plain", size: 100)

          return label
      }()

      HelperRequest.helper.decodeJSON(apiURL: url, mode: [InfoCountryElement].self) { response in
        print(response[3].callingCodes)
        print(response[3].capital)
        DispatchQueue.main.async {
          labelName.text = response[0].capital
        }


      }

        view.backgroundColor = UIColor(red: 48/255, green: 176/255, blue: 199/255, alpha: 100)
        


      DispatchQueue.main.async {
      }
        
        view.addSubview(labelName)
        labelName.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
    }
}

