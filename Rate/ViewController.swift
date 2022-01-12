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

    
    override func viewDidLoad() {
        super.viewDidLoad()
//        reauest()
        AF.request("http://api.countrylayer.com/v2/all?access_key=6ff59d862ee60effee6304513c914c59").response { response in
            debugPrint(response)
        }
        view.backgroundColor = UIColor(red: 48/255, green: 176/255, blue: 199/255, alpha: 100)
        
        let labelName: UILabel = {
            let label = UILabel()
            label.text = "Меню"
            label.textColor = .black
            label.font = UIFont(name: "Party LET Plain", size: 100)
            
            return label
        }()
        
        view.addSubview(labelName)
        labelName.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
        
        
        
    }
    
    func reauest(){
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {return}
        
        let session = URLSession.shared
        
        session.dataTask(with: url) { (data, response, error) in
            guard let data = data, let response = response else {return}
            
            do{
                //                           self.dataJson = try! JSONDecoder().decode([WeatherDatum].self, from: data)
                
                let json = try! JSONSerialization.jsonObject(with: data, options: [])
                print(json)
                
                DispatchQueue.main.async {
                    //                               self.tableView.reloadData()
                    print("Hello")
                    
                }
                //                           print(response)
            }catch{
                print(error.localizedDescription)
            }
        }.resume()
        
    }
    
    
}

