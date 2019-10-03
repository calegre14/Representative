//
//  StateDetailTableViewController.swift
//  Representative
//
//  Created by Christopher Alegre on 10/3/19.
//  Copyright © 2019 Christopher Alegre. All rights reserved.
//

import UIKit

class StateDetailTableViewController: UITableViewController  {

    var rep: ResultDictionary?
    var repArray: [ResultDictionary] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    var state: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.estimatedRowHeight = 150
        self.tableView.rowHeight = 150
        title = state
        if let state = state {
            RepresentativeController.getZipCodeWith(zipCode: state) { (reps) in
                self.repArray = reps
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return repArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "detailCell", for: indexPath) as? RepresentativeTableViewCell else {return UITableViewCell()}
        
        cell.representative = repArray[indexPath.row]

        return cell
    }
}
