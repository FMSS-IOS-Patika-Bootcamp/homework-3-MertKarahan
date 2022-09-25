//
//  ToDoListCellTableViewCell.swift
//  myApp
//
//  Created by Mert Karahan on 22.09.2022.
//

import UIKit



class ToDoListCellTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imageButton: UIButton!
    @IBOutlet weak var cellTitle: UILabel!
    
    weak var tableViewCellDelegate: TableViewCellDelegate?
    var index: IndexPath?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

//     Configuration text and image for cell items.
    func configure(index: IndexPath, model: ToDoItemModel) {
        
        cellTitle.text = model.title
        
        self.index = index
        imageButton.setTitle("", for: .normal)
        let xImage = UIImage(systemName:"xmark")
        imageButton.setImage(xImage?.withRenderingMode(.alwaysOriginal), for: .normal)
    }
    
//    Set operation when button tapped.
    @IBAction func imageButtonClicked(_ sender: UIButton) {
        
        guard let index = index else {return}
            tableViewCellDelegate?.buttonClicked(index: index)

        let checkImage = UIImage(systemName: "checkmark")
        imageButton.setImage(checkImage?.withRenderingMode(.alwaysOriginal), for: .normal)
        
    }
}
