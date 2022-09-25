//
//  SecondItemViewController.swift
//  myApp
//
//  Created by Mert Karahan on 18.09.2022.
//

import UIKit

class PhotosViewController: UIViewController {
    
    @IBOutlet weak var photosCollectionView: UICollectionView!
    
    var photostViewModel = PhotosViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        photostViewModel.getPhotosData()
        registerCollectionViewCell()
        setCollectionView()
        photostViewModel.photosViewModelDelegate = self
                
    }
}

private extension PhotosViewController {
    
    func setCollectionView() {
        photosCollectionView.delegate = self
        photosCollectionView.dataSource = self
    }
    
//    Registeration.
    func registerCollectionViewCell() {
        photosCollectionView.register(.init(nibName: "PhotosCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "PhotosCollectionViewCell")
    }
}

extension PhotosViewController: PhotosViewModelDelegate {
    func reloadData() {
        DispatchQueue.main.async {
            self.photosCollectionView.reloadData()
        }
    }
}

extension PhotosViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        photostViewModel.numberOfItems
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotosCollectionViewCell", for: indexPath) as! PhotosCollectionViewCell
        
        cell.configure(photostViewModel.photoItem(at: indexPath.row))

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let cellWidth = (UIScreen.main.bounds.width - 10) / 2
        return CGSize(width: cellWidth, height: cellWidth)
    }
    
    
}
