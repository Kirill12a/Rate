//
//  ViewController.swift
//  Rate
//
//  Created by Kirill Drozdov on 02.01.2022.
//

import UIKit
import SnapKit
import Alamofire





class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate, UISearchBarDelegate {
  var size = UIScreen.main.bounds
  var dataTable:UITableView!

  var itemstringArr: [InfoCountryElement] = [InfoCountryElement]()
  var curentAnimalArray = [InfoCountryElement]()

  let url = "http://api.countrylayer.com/v2/all?access_key=c1df170ea2bda03d28a3cd007a6951a8"


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 242/255, green: 242/255, blue: 247/255, alpha: 100)

        self.title = "Что купить 🛒"

     makeTable()
      HelperRequest.helper.decodeJSON(apiURL: url, mode: [InfoCountryElement].self) { response in
        self.itemstringArr = response
        self.curentAnimalArray = response
        DispatchQueue.main.async {
          self.dataTable.reloadData()
        }
      }
    }

    func makeTable()
    {

      
      dataTable=UITableView.init(frame: CGRect(x: 0, y: 0, width: view.bounds.size.width, height: view.bounds.size.height-64), style:.grouped)
        dataTable.delegate = self
        dataTable.dataSource = self
        self.view.addSubview(dataTable)

      let searchBar = UISearchBar(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 50))
      searchBar.delegate = self
      searchBar.showsScopeBar = true
      searchBar.tintColor = UIColor.lightGray
      dataTable.tableHeaderView = searchBar

    }

  func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {

    itemstringArr = itemstringArr.filter({ (country) -> Bool in
      return country.name.lowercased().contains(searchText.lowercased())
    })
    dataTable.reloadData()

  }


    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return itemstringArr.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {


        let identifier = "identifier"
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier)
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCell.CellStyle.value1, reuseIdentifier: identifier)

        }

        cell?.selectionStyle = .none
//      cell?.textLabel?.text = itemstringArr[indexPath.row].capital
      cell?.textLabel?.text = itemstringArr[indexPath.row].name
        cell?.detailTextLabel?.text = "прыгнуть туда"
        cell?.detailTextLabel?.font = UIFont .systemFont(ofSize: CGFloat(13))
        cell?.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator

        return cell!

    }


    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("indexPath.row = \(indexPath.row)")

//        let push = PullView()

//        self.present(push, animated: true, completion: nil)
    }
    public func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        print("indexPath.row = DeselectRow\(indexPath.row)")
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return UITableViewCell.EditingStyle.init(rawValue: 1)!
    }


}

