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
    }

    private func configureView(){
        view.backgroundColor = .white
        view.addSubview(tableView)
        tableView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        return cell
    }
}

