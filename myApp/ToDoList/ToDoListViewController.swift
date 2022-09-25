//
//  ThirdItemViewController.swift
//  myApp
//
//  Created by Mert Karahan on 18.09.2022.
//

import UIKit

protocol TableViewCellDelegate: AnyObject {
    func buttonClicked(index: IndexPath)
}

class ToDoListViewController: UIViewController {
    
    
    @IBOutlet weak var toDoListTableView: UITableView!
    
    var toDoListViewModel: ToDoListViewModelProtocol = ToDoListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTableView()
        setNavigationBar()
        registerCell()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        toDoListViewModel.getData()
        toDoListTableView.reloadData()
    }
}

private extension ToDoListViewController {
    
    func setTableView() {
        toDoListTableView.delegate = self
        toDoListTableView.dataSource = self
        
    }
    
    func registerCell() {
        self.toDoListTableView.register(.init(nibName: "ToDoListCellTableViewCell", bundle: nil), forCellReuseIdentifier: "ToDoListCellTableViewCell")
    }
    
//    Set navigation bar item.
    func setNavigationBar() {
        navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(getDetailView))
    }
    
    @objc func getDetailView() {
        let destinationViewController = AddToDoViewController()
        navigationController?.pushViewController(destinationViewController, animated: true)
    }
}

extension ToDoListViewController: UITableViewDelegate, UITableViewDataSource, TableViewCellDelegate {
    
    func buttonClicked(index: IndexPath) {
        self.makeAlert(alertTitle: "Attention", alertMessage: "Task will delete in 3 second.")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.toDoListViewModel.deleteTask(index: index.row)
            self.toDoListViewModel.getData()
            self.toDoListTableView.reloadData()
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoListViewModel.numberOfItems
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = toDoListTableView.dequeueReusableCell(withIdentifier: "ToDoListCellTableViewCell", for: indexPath) as! ToDoListCellTableViewCell
        cell.configure(index: indexPath, model: toDoListViewModel.itemAtIndex(at: indexPath.row))
        cell.tableViewCellDelegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let selectedItem = toDoListViewModel.itemAtIndex(at: indexPath.row)
        let detailViewController = DetailBuilder.buildDetail(detailItem: selectedItem)
        self.navigationController?.pushViewController(detailViewController, animated: true)
        
    }
}
