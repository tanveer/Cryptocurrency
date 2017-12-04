//
//  CurrencyViewController.swift
//  Cryptocurrency
//
//  Created by Tanveer Bashir on 12/4/17.
//  Copyright © 2017 Tanveer Bashir. All rights reserved.
//

import UIKit

class CurrencyViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    private var currencies: [Currency] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Cryptocurrency".uppercased()
        tableView.estimatedRowHeight = 200
        tableView.rowHeight = UITableViewAutomaticDimension
        
        tableView.register(TableCell.cellNib, forCellReuseIdentifier: TableCell.id)
        fetch()
    }

    private func fetch() {
        API.fetchCurrency(onSuccess: { currencies in
            self.currencies = currencies
            self.tableView.reloadData()
        }, onFailure: {
            print("Failed to fetch from remote")
        })
    }
}

// MARK: - TableView Datasource

extension CurrencyViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currencies.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableCell.id, for: indexPath) as! TableCell
        cell.currency = currencies[indexPath.row]
        return cell
    }

}

// MARK: - TableView Delegate

extension CurrencyViewController: UITableViewDelegate {

}

