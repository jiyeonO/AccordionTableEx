//
//  MenuCollectionViewCell.swift
//  3.0_AccordionTable
//
//  Created by 오지연 on 2021/06/10.
//

import UIKit

class MenuCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var menuLabel: UILabel!
    
    func setCellItem(text: String) {
        self.menuLabel?.text = text
    }
}
