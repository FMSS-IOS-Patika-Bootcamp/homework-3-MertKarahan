//
//  FirstItemViewModel.swift
//  myApp
//
//  Created by Mert Karahan on 18.09.2022.
//

import Foundation

class PostViewModel {
    
    weak var postViewModelDelegate: PostViewModelDelegate?
    
    var postModel = PostModel()
    var postsResponse : [PostEntity] = []
    
//    Determine reponse count.
    var numberOfItems : Int {
        self.postsResponse.count
    }
    
//    Determine response items.
    func postItem(at index: Int) -> PostEntity {
        return self.postsResponse[index]
    }
    
// Call main api operation.
    func getPostsData() {
        postModel.fetchPostData { response in
            switch response {
            case .success(let successfulResponse):
                self.postsResponse = successfulResponse
                self.postViewModelDelegate?.reloadData()
            case.failure(_):
                break
            }
        }
    }
}
