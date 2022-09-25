//
//  DetailViewBuilder.swift
//  myApp
//
//  Created by Mert Karahan on 24.09.2022.
//

import Foundation

struct DetailBuilder {
    
//    Create view controller and link with view model.
    static func buildDetail(detailItem: ToDoItemModel) -> DetailViewController {
        let detailViewModel = DetailViewModel(model: detailItem)
        let detailViewController = DetailViewController()
        detailViewController.detailViewModel = detailViewModel
        return detailViewController
    }
}
