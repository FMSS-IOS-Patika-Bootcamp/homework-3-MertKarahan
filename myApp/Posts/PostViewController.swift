//
//  FirstItemViewController.swift
//  myApp
//
//  Created by Mert Karahan on 18.09.2022.
//

import UIKit

class PostViewController: UIViewController {
    
    @IBOutlet weak var postsCollectionView: UICollectionView!
    
    private let viewModel = PostViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.getPostsData()
        setCollectionView()
        registerCollectionViewCeell()
        viewModel.postViewModelDelegate = self
        
    }
}

private extension PostViewController {
    
    func registerCollectionViewCeell() {
        postsCollectionView.register(.init(nibName: "PostCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "PostCollectionViewCell")
    }
    
    func setCollectionView() {
        postsCollectionView.delegate = self
        postsCollectionView.dataSource = self
    }
}

extension PostViewController: PostViewModelDelegate {
    
    func reloadData() {
        DispatchQueue.main.async {
            self.postsCollectionView.reloadData()
        }
    }
}

extension PostViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return viewModel.numberOfItems
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PostCollectionViewCell", for: indexPath) as! PostCollectionViewCell
        
        cell.configure(postModel: viewModel.postItem(at: indexPath.row))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let cellWidth = (UIScreen.main.bounds.width)
        return CGSize(width: cellWidth, height: cellWidth * 0.5)
    }
}
