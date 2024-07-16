//
//  NetworkClient.swift
//  dessert-fetcher
//
//  Created by Logan Cole on 7/15/24.
//

import Foundation

class NetworkClient {

    func performRequest(url: URL) async -> Result<Data, Error> {
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            return .success(data)
        } catch {
            print(error)
            return .failure(error)
        }
        
        
        //        let task = URLSession.shared.dataTask(with: url) { data, response, error in
//            if let error = error {
//                completion(.failure(error))
//                return
//            }
//            
//            guard let data = data else {
//                completion(.failure(NSError(domain: "No data", code: 0, userInfo: nil)))
//                return
//            }
//            
//            completion(.success(data))
//        }
//        
//        task.resume()
    }
}
