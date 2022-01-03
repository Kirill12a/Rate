//
//  ViewController.swift
//  Rate
//
//  Created by Kirill Drozdov on 02.01.2022.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reauest()
        view.backgroundColor = UIColor(red: 48/255, green: 176/255, blue: 199/255, alpha: 100)
        
        let labelName: UILabel = {
            let label = UILabel()
            label.text = "Hello Kirill"
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

