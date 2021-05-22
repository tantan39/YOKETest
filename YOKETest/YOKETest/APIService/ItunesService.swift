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
            .map { response in
                return response.data }
            .decode(type: Feed.self, decoder: JSONDecoder())
            .map({ $0.response })
            .map({ $0.results })
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
        
    }
}

struct Feed: Codable {
    let response : ItunesResponse
    enum CodingKeys: String, CodingKey {
        case response = "feed"
    }
    
    struct ItunesResponse: Codable {
        let results: [Album]
        
        enum CodingKeys: String, CodingKey {
            case results = "results"
        }
        
    //    init(from decoder: Decoder) throws {
    //        let container = try decoder.container(keyedBy: CodingKeys.self)
    //        results = try container.decode([Album].self, forKey: .results)
    //    }
    }
}

struct Album: Codable, Identifiable {
    let artistName: String
    let name: String
    let artworkUrl100: String
    let id: String
    
}
