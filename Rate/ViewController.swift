//
//  ViewController.swift
//  Rate
//
//  Created by Kirill Drozdov on 02.01.2022.
//

import UIKit
import SnapKit
import Alamofire

//"http://api.countrylayer.com/v2/all?access_key=a9255b3696a46e6dd7d4314376401fbc" должно робить, но теперь такая хрень, что приходит html страница




class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate, UISearchBarDelegate {
  var size = UIScreen.main.bounds
  var dataTable:UITableView!

  let cellSpacingHeight: CGFloat = 100

  var itemstringArr: [InfoCountryElement] = [InfoCountryElement]()

  let url = "http://api.countrylayer.com/v2/all?access_key=3209d89b43160ccd84d69d90f95bfee8"

  private var apiKey = ""

  var titeleNavBar = ""
  override func viewDidLoad() {
    super.viewDidLoad()



    view.backgroundColor = UIColor(red: 242/255, green: 242/255, blue: 247/255, alpha: 100)
    self.title = " 🌏"

    makeTable()
    HelperRequest.helper.decodeJSON(apiURL: url, mode: [InfoCountryElement].self) { response in
      self.itemstringArr = response
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

  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    return cellSpacingHeight
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
      cell = UITableViewCell(style: UITableViewCell.CellStyle.value1, reuseIdentifier: identifier)}


    cell!.backgroundColor = UIColor.white
    cell!.layer.borderColor = UIColor.black.cgColor
    cell!.layer.borderWidth = 10
    cell?.layer.borderColor = tableView.backgroundColor?.cgColor
    cell!.layer.cornerRadius = 30
    cell!.clipsToBounds = true

    //




    cell?.selectionStyle = .none
    cell?.textLabel?.text = itemstringArr[indexPath.row].name
    cell?.detailTextLabel?.text = "🔍"
    cell?.detailTextLabel?.font = UIFont .systemFont(ofSize: CGFloat(13))
    //        cell?.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator // мб del..

    return cell!

  }
  func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
    cell.layer.transform = CATransform3DMakeScale(0.1, 0.1, 1.0)
    UIView.animate(withDuration: 0.2,
                   animations: {
      cell.layer.transform = CATransform3DMakeScale(1.0, 1.0, 1.0)
    }, completion: nil)

  }

  public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let detail = DetailViewController()
    detail.capital = itemstringArr[indexPath.row].capital
    detail.topLevelDomain = itemstringArr[indexPath.row].topLevelDomain
    detail.region = itemstringArr[indexPath.row].region
//condition(detail: detail, indexPath: indexPath)
    Conditions.conditions.condition(detail: detail, indexPath: indexPath, itemstringArr: itemstringArr)



    //      self.present(detail, animated: true, completion: nil) // либо такой переход
    navigationController?.pushViewController(detail, animated: true)
  }

  func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
    return true
  }
  func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
    return UITableViewCell.EditingStyle.init(rawValue: 1)!
  }
}
