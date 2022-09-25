//
//  DetailViewController.swift
//  myApp
//
//  Created by Mert Karahan on 24.09.2022.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailTitleLabel: UILabel!
    @IBOutlet weak var detailDescriptionLabel: UILabel!
    @IBOutlet weak var detailDateLabel: UILabel!
    
    var detailViewModel: DetailViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
//    Configuration for view controller items.
    func configure() {
        detailTitleLabel.text = detailViewModel?.title
        detailDescriptionLabel.text = detailViewModel?.description
        detailDateLabel.text = detailViewModel?.date
    }
}
