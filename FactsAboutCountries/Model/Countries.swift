//
//  Countries.swift
//  FactsAboutCountries
//
//  Created by Ceboolion on 17/05/2020.
//  Copyright © 2020 Ceboolion. All rights reserved.
//

import Foundation
import UIKit

struct Countries: Codable {
    var name: String = ""
    var alpha2Code: String = ""
    var capital: String
    var region: String
    var subregion: String
    var population: Int
    var area: Double?
    var timezones: [String]
    var currencies: [Currency]?
    var languages: [Language]?
    var flag: String
}
