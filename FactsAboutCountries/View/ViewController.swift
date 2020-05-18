//
//  ViewController.swift
//  FactsAboutCountries
//
//  Created by Ceboolion on 16/05/2020.
//  Copyright © 2020 Ceboolion. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  private let cellID = "Cell"
  private let allCountriesURL = "https://restcountries.eu/rest/v2/all"
  private var allCountriesModel = [Countries]()
  
  private let tableView: UITableView = {
    let table = UITableView()
    table.translatesAutoresizingMaskIntoConstraints = false
    table.backgroundColor = .black
    return table
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.delegate = self
    tableView.dataSource = self
    tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: cellID)
    configureView()
    performRequest()
  }
  
  private func configureView(){
    view.backgroundColor = .white
    view.addSubview(tableView)
    tableView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor).isActive = true
    tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
  }
  
  func performRequest(){
    let url = URL(string: allCountriesURL)
    guard url != nil else {return}
    let session = URLSession(configuration: .default)
    let dataTask = session.dataTask(with: url!) { (data, response, error) in
      if error == nil && data != nil {
        let decoder = JSONDecoder()
        do {
          let decodedData = try decoder.decode([Countries].self, from: data!)
          self.allCountriesModel = decodedData
          DispatchQueue.main.async {
            self.tableView.reloadData()
          }
        } catch {
          print(error)
          self.performRequestError()
        }
      }
    }
    dataTask.resume()
  }
  func performRequestError(){
    let ac = UIAlertController(title: "ERROR", message: "Cannot load data", preferredStyle: .alert)
    ac.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
    present(ac, animated: true)
  }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if allCountriesModel.count > 0{
      return allCountriesModel.count
    }
    return 0
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! CustomTableViewCell
    cell.textLabel?.text = allCountriesModel[indexPath.row].name
    cell.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
    return cell
  }
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let detailVC = DetailViewController()
    detailVC.country = allCountriesModel[indexPath.row].name
    navigationController?.pushViewController(detailVC, animated: true)
  }
}

