//
//  APIService.swift
//  YOKETest
//
//  Created by Tan Tan on 5/21/21.
//

import Foundation
import Combine

public struct Constant {
    public static let baseURL = "https://rss.itunes.apple.com/api/"
}

public enum APIPath: String {
    case feedComingSoon = "v1/us/apple-music/coming-soon/all/100/explicit.json"
}

public protocol APIService {
    func loadAlbums() -> AnyPublisher<[Album], Error>
}

public struct ITunesService: APIService {
    public init () {
        
    }
    
    public func loadAlbums() -> AnyPublisher<[Album], Error> {
        guard let url = URL(string: Constant.baseURL.appending(APIPath.feedComingSoon.rawValue)) else {
            fatalError("request not found")
        }
        
        return URLSession.shared
            .dataTaskPublisher(for: url)
            .map { response in
                return response.data }
            .decode(type: Feed.self, decoder: JSONDecoder())
            .map({ $0.response })
            .map({ $0.results })
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
        
    }
}
