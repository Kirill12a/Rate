//
//  HelperRequest.swift
//  Rate
//
//  Created by Kirill Drozdov on 14.01.2022.
//

import UIKit

class HelperRequest{

  static var helper = HelperRequest()
  var vc = ViewController()

  public func decodeJSON<T: Decodable>(apiURL: String, mode: T.Type, comletion: @escaping(T)->()){
    guard let url = URL(string: apiURL) else {return}
    URLSession.shared.dataTask(with: url) { data, response, error in
      if error != nil {
        print(error as Any)
      }else{
        let decoder = JSONDecoder()
        do{
          let result = try decoder.decode(mode.self, from: data!)
          comletion(result)
          print(result)
        }catch{
            print(" Не смог подключиться увы")
          print(error.localizedDescription)
        }
      }
    }.resume()
  }
}
