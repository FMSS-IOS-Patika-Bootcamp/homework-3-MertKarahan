//
//  DetailViewController.swift
//  myApp
//
//  Created by Mert Karahan on 22.09.2022.
//

import UIKit

class AddToDoViewController: UIViewController {

    @IBOutlet weak var detailDateTextField: UITextField!
    @IBOutlet weak var detailTitleTextField: UITextField!
    @IBOutlet weak var detailDescriptionTextField: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    
    var detailViewModel: DetailViewModelProtocol = AddToDoViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setOutletsView()
    }
    
    @IBAction func saveButtonClicked(_ sender: Any) {
        
        let itemModel = ToDoItemModel(title: detailTitleTextField.text ?? "",
                                      description: detailDescriptionTextField.text ?? "",
                                      date: detailDateTextField.text ?? "")
        
        detailViewModel.saveData(toDoItemModel: itemModel)
        
        navigationController?.popToRootViewController(animated: true)
        
    }
}

extension AddToDoViewController {
    
    func setOutletsView() {
        saveButton.layer.cornerRadius = 10
        saveButton.layer.masksToBounds = true
        detailTitleTextField.layer.cornerRadius = 10
        detailTitleTextField.layer.masksToBounds = true
        detailDescriptionTextField.layer.cornerRadius = 10
        detailDescriptionTextField.layer.masksToBounds = true
        detailDateTextField.layer.cornerRadius = 10
        detailDateTextField.layer.masksToBounds = true
        
    }
    
    
}
