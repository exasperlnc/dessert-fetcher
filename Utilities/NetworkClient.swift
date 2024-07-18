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
            let (data, _) = try await URLSession.shared.data(from: url)
            return .success(data)
        } catch {
            print(error)
            return .failure(error)
        }
    }
}
