//
//  CollectionViewCell.swift
//  CollectionDogs
//
//  Created by Aleksey Alyonin on 08.10.2022.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageDog: UIImageView!
    
    func setImage(image: UIImage){
        imageDog.image = image
    }
}
