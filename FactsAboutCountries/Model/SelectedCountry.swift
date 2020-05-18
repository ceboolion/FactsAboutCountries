//
//  SelectedCountry.swift
//  FactsAboutCountries
//
//  Created by Roman Cebula on 18/05/2020.
//  Copyright © 2020 Ceboolion. All rights reserved.
//

import Foundation

struct SelectedCountry: Codable {
  let name: String
  let capital: String
  let region: String
  let subregion: String
  let population: Int
  let area: Int
  let timezones: [String]
  let currencies: [Currency]
  let languages: [Language]
  let flag: String
}

struct Currency: Codable {
  let code: String
  let name: String
  let symbol: String
}

struct Language: Codable {
  let name: String
  let nativeName: String
}
