//
//  StateListTableViewController.swift
//  Representative
//
//  Created by Christopher Alegre on 10/3/19.
//  Copyright © 2019 Christopher Alegre. All rights reserved.
//

import UIKit

class StateListTableViewController: UITableViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return States.all.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "stateCells", for: indexPath)
        cell.textLabel?.text = States.all[indexPath.row]
        return cell
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "stateDetailSegue" {
            guard let destinationVC = segue.destination as? StateDetailTableViewController,
                let index = tableView.indexPathForSelectedRow else {return}
            destinationVC.state = States.all[index.row]
        }
    }

}
