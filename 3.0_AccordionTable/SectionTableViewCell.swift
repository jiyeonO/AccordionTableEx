//
//  SectionTableViewCell.swift
//  3.0_AccordionTable
//
//  Created by 오지연 on 2021/06/11.
//

import UIKit

protocol SectionExpandableDelegate {
    func sectionExpandable(sectionIdx: Int)
}

class SectionTableViewCell: UITableViewCell {

    @IBOutlet weak var sectionLabel: UILabel!
    
    var delegate: SectionExpandableDelegate?
    var sectionIndex: Int?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setCellItem(text: String, index: Int) {
        self.sectionIndex = index
        sectionLabel.text = text
    }
    
    @IBAction func selectedSection(_ sender: UIButton) {
        delegate?.sectionExpandable(sectionIdx: self.sectionIndex ?? 0)
    }
}
