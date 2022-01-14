//
//  HelperRequest.swift
//  Rate
//
//  Created by Kirill Drozdov on 14.01.2022.
//

import UIKit

class HelperRequest{

  static var helper = HelperRequest()

  static func workingURL<T:Decodable>(jsonPath path:String, model: T.Type, comletion: @escaping (T)->()){

    let url = URL(string: path)

    URLSession.shared.dataTask(with: url!) { data, response, error in
      if error != nil {
        print(error as! Error)
      }else {
        let decoder = JSONDecoder()

        do {
          let results = try decoder.decode(model.self, from: data!)
          print(results)
        } catch let error as Error {
          print(error.localizedDescription)
        }
      }
    }

  }
}
