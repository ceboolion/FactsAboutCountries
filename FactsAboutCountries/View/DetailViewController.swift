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

    override func viewDidLoad() {
        super.viewDidLoad()
        title = country
        view.backgroundColor = .white
    }
}
