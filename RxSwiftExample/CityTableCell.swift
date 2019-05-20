//
//  CityTableCell.swift
//  RxSwiftExample
//
//  Created by MinJun KOO on 20/05/2019.
//  Copyright © 2019 mjkoo. All rights reserved.
//

import UIKit

class CityTableCell: UITableViewCell {
  @IBOutlet var titleLabel: UILabel!
  
  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
