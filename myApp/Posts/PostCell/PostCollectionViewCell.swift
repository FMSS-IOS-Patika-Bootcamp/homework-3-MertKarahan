//
//  FirstItemCollectionViewCell.swift
//  myApp
//
//  Created by Mert Karahan on 18.09.2022.
//

import UIKit

class PostCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var idView: UIView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var collectionViewId: UILabel!
    @IBOutlet weak var collectionViewTitle: UILabel!
    @IBOutlet weak var collectionViewBody: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setCellView()
    }
    
//    Configuration get data.
    func configure(postModel: PostEntity) {
        collectionViewId.text = String(postModel.id)
        collectionViewBody.text = "Description:\(postModel.body)"
        collectionViewTitle.text = "Title: \(postModel.title)"
    }
    
//    Add corner radius for post.
    func setCellView() {
        containerView.layer.cornerRadius = 10.0
        containerView.layer.masksToBounds = true
        idView.layer.cornerRadius = 15.0
    }
}
