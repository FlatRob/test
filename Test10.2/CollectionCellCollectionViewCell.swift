//
//  CollectionCellCollectionViewCell.swift
//  Test10.2
//
//  Created by roberto lupi on 20/10/16.
//  Copyright © 2016 roberto lupi. All rights reserved.
//

import UIKit

class CollectionCellCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet var myLab: UILabel!
    
    func inserDatainCell(name : String)  {
        
        
        myLab.text = name
        myLab.textColor = UIColor.white
        
    }
    
}
