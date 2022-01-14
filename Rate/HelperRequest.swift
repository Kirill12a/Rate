//
//  HelperRequest.swift
//  Rate
//
//  Created by Kirill Drozdov on 14.01.2022.
//

import UIKit





// Сделать чуть по другому с trello не очень подходит. Но идею в приницпе понял.
// Но этот хелпер ПОЛНОСТЬЮ редакнуть,
// тк. - Потому что есть ошибка при добавление в параметр model моей структуры
// тк. - Есть проблема с json с сервера
// + нужно чекнуть как писать let info = [И тут моя структура json] , просто я не понмю нужно ли писать так

class HelperRequest{

  static var helper = HelperRequest()

  //  public func printToConsole<T>(any: T){
  //    print(any)
  //  }



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
        }catch{
          print(error)
        }
      }
    }.resume()
  }





}
