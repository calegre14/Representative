//
//  RepresentativeTableViewCell.swift
//  Representative
//
//  Created by Christopher Alegre on 10/3/19.
//  Copyright © 2019 Christopher Alegre. All rights reserved.
//

import UIKit

class RepresentativeTableViewCell: UITableViewCell {

    var representative: ResultDictionary? {
        didSet {
            updateView()
        }
    }
    
    @IBOutlet weak var nameLabel: UILabel!
      @IBOutlet weak var districtLabel: UILabel!
      @IBOutlet weak var websiteLabel: UILabel!
      @IBOutlet weak var partyLabel: UILabel!
      @IBOutlet weak var phoneLabel: UILabel!
    
    func updateView() {
        nameLabel.text = representative?.name
        districtLabel.text = representative?.district
        websiteLabel.text = representative?.link
        partyLabel.text = representative?.party
        phoneLabel.text = representative?.phone
    }
}
