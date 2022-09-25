//
//  PhotosModel.swift
//  myApp
//
//  Created by Mert Karahan on 22.09.2022.
//

import Foundation

class PhotosModel {
    
//    Get api response
    func fetchPhotosData(finishFetchPhotosData: @escaping((Result<[PhotosEntity], Error>)->Void)) {
        
        guard let url = URL.init(string: "https://jsonplaceholder.typicode.com/photos") else { return }
        
        var request: URLRequest = .init(url: url)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
                        
            guard error == nil else { return }
            
            guard let httpsResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpsResponse.statusCode) else { return }
            
            guard let data = data else { return }
            
            do {
                let decodedResponse = try JSONDecoder().decode([PhotosEntity].self, from: data)
                finishFetchPhotosData(.success(decodedResponse))
                
            } catch {
                finishFetchPhotosData(.failure(error))
            }
        }
        task.resume()
        
    }
}
