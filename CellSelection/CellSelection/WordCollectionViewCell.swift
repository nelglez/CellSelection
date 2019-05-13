//
//  WordCollectionViewCell.swift
//  CellSelection
//
//  Created by Spencer Curtis on 5/9/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

protocol WordCollectionViewCellDelegate: class {
    func addButtonTapped(on cell: WordCollectionViewCell)
}

class WordCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var wordLabel: UILabel!
    
    func updateViews() {
        wordLabel.text = word
    }
    
    var word: String? {
        didSet {
            updateViews()
        }
    }
}
