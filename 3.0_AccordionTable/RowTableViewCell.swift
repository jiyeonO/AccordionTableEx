//
//  RowTableViewCell.swift
//  3.0_AccordionTable
//
//  Created by 오지연 on 2021/06/11.
//

import UIKit

class RowTableViewCell: UITableViewCell {

    @IBOutlet weak var rowLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setCellItem(text: String) {
        rowLabel.text = text
    }
}
