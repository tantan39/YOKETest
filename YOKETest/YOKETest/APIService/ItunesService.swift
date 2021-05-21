//
//  APIService.swift
//  YOKETest
//
//  Created by Tan Tan on 5/21/21.
//

import Foundation
import Combine

struct Constant {
    static let baseURL = "https://rss.itunes.apple.com/api/"
}

enum APIPath: String {
    case feedComingSoon = "v1/us/apple-music/coming-soon/all/100/explicit.json"
}

protocol APIService {
    func loadAlbums() -> AnyPublisher<[Album], Error>
}

struct ITunesService: APIService {
    func loadAlbums() -> AnyPublisher<[Album], Error> {
        guard let url = URL(string: Constant.baseURL.appending(APIPath.feedComingSoon.rawValue)) else {
            fatalError("request not found")
        }
        
        return URLSession.shared
            .dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: [Album].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
        
    }
}

struct Album: Codable {
    let artistName: String
    let name: String
    let artworkUrl100: String
}
