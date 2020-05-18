//
//  DetailViewController.swift
//  FactsAboutCountries
//
//  Created by Ceboolion on 17/05/2020.
//  Copyright © 2020 Ceboolion. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
  
  var country = ""
  private let countryURL = "https://restcountries.eu/rest/v2/name/"
  private var chosenCountryModel = [SelectedCountry]()
  
  func performRequest(){
    let countryWithoutSpaces = country.trimmingCharacters(in: .whitespacesAndNewlines)
    let url = URL(string: "\(countryURL)" + "\(countryWithoutSpaces.lowercased())")
    guard url != nil else {return}
    print(url)
    let session = URLSession(configuration: .default)
    let dataTask = session.dataTask(with: url!) { (data, response, error) in
      if error == nil && data != nil {
        let decoder = JSONDecoder()
        do {
          let decodedData = try decoder.decode([SelectedCountry].self, from: data!)
          self.chosenCountryModel = decodedData
          DispatchQueue.main.async {
            self.updateLabels()
          }

        } catch {
          print(error)
        }
      }
    }
    dataTask.resume()
  }
  
  func updateLabels(){
    
    if chosenCountryModel.count > 0 {
      countryName.text = "\(chosenCountryModel[0].name)"
      let flagURLString = "\(chosenCountryModel[0].flag)"
      let url = NSURL(string: flagURLString)! as URL
      if let imageData: NSData = NSData(contentsOf: url){
        flagImage.image = UIImage(data: imageData as Data)
      }
      print("\(chosenCountryModel[0].flag)")
    }
    
  }
  
  private let flagImage: UIImageView = {
    let image = UIImageView()
    image.layer.borderWidth = 1
    image.layer.borderColor = UIColor.gray.cgColor
    image.translatesAutoresizingMaskIntoConstraints = false
    return image
  }()
  private let countryName: UILabel = {
    let name = UILabel()
    name.text = "Country name"
    name.font = UIFont(name: "Avenir Next", size: 22)
    name.textAlignment = .center
    name.translatesAutoresizingMaskIntoConstraints = false
    return name
  }()
  
  private let capitalName: UILabel = {
    let name = UILabel()
    name.text = "Capital name"
    name.font = UIFont(name: "Avenir Next", size: 18)
    name.textAlignment = .left
    name.translatesAutoresizingMaskIntoConstraints = false
    return name
  }()
  
  private let region: UILabel = {
    let name = UILabel()
    name.text = "Region"
    name.font = UIFont(name: "Avenir Next", size: 18)
    name.textAlignment = .left
    name.translatesAutoresizingMaskIntoConstraints = false
    return name
  }()
  
  private let subregion: UILabel = {
    let name = UILabel()
    name.text = "Subregion"
    name.font = UIFont(name: "Avenir Next", size: 18)
    name.textAlignment = .left
    name.translatesAutoresizingMaskIntoConstraints = false
    return name
  }()
  
  private let population: UILabel = {
    let name = UILabel()
    name.text = "Population"
    name.font = UIFont(name: "Avenir Next", size: 18)
    name.textAlignment = .left
    name.translatesAutoresizingMaskIntoConstraints = false
    return name
  }()
  
  private let area: UILabel = {
    let name = UILabel()
    name.text = "Area"
    name.font = UIFont(name: "Avenir Next", size: 18)
    name.textAlignment = .left
    name.translatesAutoresizingMaskIntoConstraints = false
    return name
  }()
  
  private let timeZone: UILabel = {
    let name = UILabel()
    name.text = "Time Zone"
    name.font = UIFont(name: "Avenir Next", size: 18)
    name.textAlignment = .left
    name.translatesAutoresizingMaskIntoConstraints = false
    return name
  }()
  
  private let currency: UILabel = {
    let name = UILabel()
    name.text = "Currency"
    name.font = UIFont(name: "Avenir Next", size: 18)
    name.textAlignment = .left
    name.translatesAutoresizingMaskIntoConstraints = false
    return name
  }()
  
  private let language: UILabel = {
    let name = UILabel()
    name.text = "Language"
    name.font = UIFont(name: "Avenir Next", size: 18)
    name.textAlignment = .left
    name.translatesAutoresizingMaskIntoConstraints = false
    return name
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    performRequest()
    title = country
    view.backgroundColor = .white
    configureView()
  }
  
  private func configureView(){
    view.addSubview(flagImage)
    flagImage.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 20).isActive = true
    flagImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    flagImage.widthAnchor.constraint(equalToConstant: 120).isActive = true
    flagImage.heightAnchor.constraint(equalToConstant: 60).isActive = true
    view.addSubview(countryName)
    countryName.topAnchor.constraint(equalTo: flagImage.bottomAnchor, constant: 15).isActive = true
    countryName.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    view.addSubview(capitalName)
    capitalName.topAnchor.constraint(equalTo: countryName.bottomAnchor, constant: 15).isActive = true
    capitalName.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
    capitalName.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
    view.addSubview(region)
    region.topAnchor.constraint(equalTo: capitalName.bottomAnchor, constant: 10).isActive = true
    region.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
    region.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
    view.addSubview(subregion)
    subregion.topAnchor.constraint(equalTo: region.bottomAnchor, constant: 10).isActive = true
    subregion.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
    subregion.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
    view.addSubview(population)
    population.topAnchor.constraint(equalTo: subregion.bottomAnchor, constant: 10).isActive = true
    population.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
    population.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
    view.addSubview(area)
    area.topAnchor.constraint(equalTo: population.bottomAnchor, constant: 10).isActive = true
    area.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
    area.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
    view.addSubview(timeZone)
    timeZone.topAnchor.constraint(equalTo: area.bottomAnchor, constant: 10).isActive = true
    timeZone.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
    timeZone.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
    view.addSubview(currency)
    currency.topAnchor.constraint(equalTo: timeZone.bottomAnchor, constant: 10).isActive = true
    currency.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
    currency.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
    view.addSubview(language)
    language.topAnchor.constraint(equalTo: currency.bottomAnchor, constant: 10).isActive = true
    language.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
    language.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
  }
}
