//
//  SecondItemViewModel.swift
//  myApp
//
//  Created by Mert Karahan on 18.09.2022.
//

import Foundation

class PhotosViewModel {
    
    var photosModel = PhotosModel()
    
    weak var photosViewModelDelegate : PhotosViewModelDelegate?
    
//    Api response list
    var photosResponse : [PhotosEntity] = []
    
//    Determine response count
    var numberOfItems: Int {
        self.photosResponse.count
    }
    
//    Determine every response item.
    func photoItem(at index: Int) -> PhotosEntity {
        return self.photosResponse[index]
    }
    
//    Get api response which is fetched.
    func getPhotosData() {
        photosModel.fetchPhotosData { response in
            switch response{
            case.success(let successfulResponse):
                self.photosResponse = successfulResponse
                self.photosViewModelDelegate?.reloadData()
            case.failure(_):
                break
            }
        }
    }
}
