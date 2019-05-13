//
//  WordsCollectionViewController.swift
//  CellSelection
//
//  Created by Spencer Curtis on 5/9/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class WordsCollectionViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    // Gets called when you tap on a cell, even when you aren't segueing
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let word = modelController.models[indexPath.item]
        
        if addedWords.contains(word) {
            
            if let index = addedWords.firstIndex(of: word) {
                addedWords.remove(at: index)
            }
            
        } else {
            addedWords.append(word)
        }
    }
    
    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return modelController.models.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WordCell", for: indexPath) as? WordCollectionViewCell else { return UICollectionViewCell() }
    
        let word = modelController.models[indexPath.item]
        
        cell.word = word
    
        return cell
    }
    
    var addedWords: [String] = [] {
        didSet {
            print(addedWords)
        }
    }
    
    
    let modelController = ModelController()
}
