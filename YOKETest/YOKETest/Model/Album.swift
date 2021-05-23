//
//  Album.swift
//  YOKETest
//
//  Created by Tan Tan on 5/23/21.
//

import Foundation

public struct Feed: Codable {
    public let response : ItunesResponse
    
    enum CodingKeys: String, CodingKey {
        case response = "feed"
    }
    
    public struct ItunesResponse: Codable {
        public let results: [Album]
        
        enum CodingKeys: String, CodingKey {
            case results = "results"
        }

    }
}

public struct Album: Codable, Identifiable {
    public let id: String
    let artistName: String
    let name: String
    let artworkUrl100: String
    public let genres: [Genre]
    let releaseDate: String
    let copyright: String
    let url: String
}

public struct Genre: Codable {

    let genreId: String
    let name: String
}
