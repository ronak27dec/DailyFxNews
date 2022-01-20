//
//  NewsCategoryCell.swift
//  DailyFxNews
//
//  Created by Ronak on 22/11/21.
//

import UIKit

class NewsCategoryCell: UITableViewCell {

    @IBOutlet var categoryLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func configure(with item: String) {
        categoryLabel.text = item
    }
}
