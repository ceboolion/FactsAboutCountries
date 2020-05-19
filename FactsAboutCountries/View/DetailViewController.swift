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
    var flagImageURL = ""
    var capital = ""
    var region = ""
    var subregion = ""
    var population = ""
    var area = ""
    var timeZone = ""
    var currency = ""
    var language = ""

    private let flagImage: UIImageView = {
        let image = UIImageView()
        image.layer.borderWidth = 1
        image.layer.borderColor = UIColor.gray.cgColor
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    private let countryNameLabel: UILabel = {
        let name = UILabel()
        name.text = "Country name"
        name.font = UIFont(name: "Avenir Next", size: 22)
        name.textAlignment = .center
        name.translatesAutoresizingMaskIntoConstraints = false
        return name
    }()
    
    private let capitalNameLabel: UILabel = {
        let name = UILabel()
        name.text = "Capital name"
        name.font = UIFont(name: "Avenir Next", size: 18)
        name.textAlignment = .left
        name.translatesAutoresizingMaskIntoConstraints = false
        return name
    }()
    
    private let regionLabel: UILabel = {
        let name = UILabel()
        name.text = "Region"
        name.font = UIFont(name: "Avenir Next", size: 18)
        name.textAlignment = .left
        name.translatesAutoresizingMaskIntoConstraints = false
        return name
    }()
    
    private let subregionLabel: UILabel = {
        let name = UILabel()
        name.text = "Subregion"
        name.font = UIFont(name: "Avenir Next", size: 18)
        name.textAlignment = .left
        name.translatesAutoresizingMaskIntoConstraints = false
        return name
    }()
    
    private let populationLabel: UILabel = {
        let name = UILabel()
        name.text = "Population"
        name.font = UIFont(name: "Avenir Next", size: 18)
        name.textAlignment = .left
        name.translatesAutoresizingMaskIntoConstraints = false
        return name
    }()
    
    private let areaLabel: UILabel = {
        let name = UILabel()
        name.text = "Area"
        name.font = UIFont(name: "Avenir Next", size: 18)
        name.textAlignment = .left
        name.translatesAutoresizingMaskIntoConstraints = false
        return name
    }()
    
    private let timeZoneLabel: UILabel = {
        let name = UILabel()
        name.text = "Time Zone"
        name.font = UIFont(name: "Avenir Next", size: 18)
        name.textAlignment = .left
        name.translatesAutoresizingMaskIntoConstraints = false
        return name
    }()
    
    private let currencyLabel: UILabel = {
        let name = UILabel()
        name.text = "Currency"
        name.font = UIFont(name: "Avenir Next", size: 18)
        name.textAlignment = .left
        name.translatesAutoresizingMaskIntoConstraints = false
        return name
    }()
    
    private let languageLabel: UILabel = {
        let name = UILabel()
        name.text = "Language"
        name.font = UIFont(name: "Avenir Next", size: 18)
        name.textAlignment = .left
        name.translatesAutoresizingMaskIntoConstraints = false
        return name
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = country
        view.backgroundColor = .white
        configureView()
        updateLabels()
    }
    
    private func updateLabels(){
        countryNameLabel.text = "\(country.uppercased())"
        capitalNameLabel.text = "Capital: \(capital)"
        regionLabel.text = "Region: \(region)"
        subregionLabel.text = "Subregion: \(subregion)"
        populationLabel.text = "Population: \(population)"
        areaLabel.text = "Area: \(area)"
        timeZoneLabel.text = "Time Zone: \(timeZone)"
        currencyLabel.text = "Currency: \(currency)"
        languageLabel.text = "Language: \(language)"
    }
    
    private func configureView(){
        view.addSubview(flagImage)
        flagImage.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 20).isActive = true
        flagImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        flagImage.widthAnchor.constraint(equalToConstant: 120).isActive = true
        flagImage.heightAnchor.constraint(equalToConstant: 60).isActive = true
        view.addSubview(countryNameLabel)
        countryNameLabel.topAnchor.constraint(equalTo: flagImage.bottomAnchor, constant: 15).isActive = true
        countryNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        view.addSubview(capitalNameLabel)
        capitalNameLabel.topAnchor.constraint(equalTo: countryNameLabel.bottomAnchor, constant: 15).isActive = true
        capitalNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        capitalNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        view.addSubview(regionLabel)
        regionLabel.topAnchor.constraint(equalTo: capitalNameLabel.bottomAnchor, constant: 10).isActive = true
        regionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        regionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        view.addSubview(subregionLabel)
        subregionLabel.topAnchor.constraint(equalTo: regionLabel.bottomAnchor, constant: 10).isActive = true
        subregionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        subregionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        view.addSubview(populationLabel)
        populationLabel.topAnchor.constraint(equalTo: subregionLabel.bottomAnchor, constant: 10).isActive = true
        populationLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        populationLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        view.addSubview(areaLabel)
        areaLabel.topAnchor.constraint(equalTo: populationLabel.bottomAnchor, constant: 10).isActive = true
        areaLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        areaLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        view.addSubview(timeZoneLabel)
        timeZoneLabel.topAnchor.constraint(equalTo: areaLabel.bottomAnchor, constant: 10).isActive = true
        timeZoneLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        timeZoneLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        view.addSubview(currencyLabel)
        currencyLabel.topAnchor.constraint(equalTo: timeZoneLabel.bottomAnchor, constant: 10).isActive = true
        currencyLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        currencyLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        view.addSubview(languageLabel)
        languageLabel.topAnchor.constraint(equalTo: currencyLabel.bottomAnchor, constant: 10).isActive = true
        languageLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        languageLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
    }
}
