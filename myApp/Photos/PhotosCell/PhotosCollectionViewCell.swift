//
//  PhotosCollectionViewCell.swift
//  myApp
//
//  Created by Mert Karahan on 21.09.2022.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var photosImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setCellView()
    }
    
    func configure(_ item: PhotosEntity) {
        photosImage.setImage(imageUrl: item.url)
    }
    
//    Add corner radius for items.
    func setCellView() {
        
        photosImage.layer.cornerRadius = 80
        photosImage.layer.masksToBounds = true
        
        containerView.layer.cornerRadius = 80
        containerView.layer.masksToBounds = true
        
        
    }

}
