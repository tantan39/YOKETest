//
//  AlbumListViewModelTests.swift
//  YOKETestTests
//
//  Created by Tan Tan on 5/23/21.
//

import Foundation
import XCTest
import YOKETest
import Combine

class AlbumListViewModelTests: XCTestCase {
    var cancellabels = Set<AnyCancellable>()
    
    func testItuneService_loadAlbums() {
        var sut = MockAPI()
        let expection = XCTestExpectation(description: "fetch albums")
        
        sut.loadAlbums()
            .sink { (_) in
            } receiveValue: { (albums) in
                sut.albums = albums
                expection.fulfill()
            }.store(in: &cancellabels)

        wait(for: [expection], timeout: 2)
        XCTAssertTrue(sut.albums.count > 0)
    }
    
    func testItuneService_loadAlbumsDetail() {
        var sut = MockAPI()
        let expection = XCTestExpectation(description: "fetch albums")
        
        sut.loadAlbums()
            .sink { (_) in
            } receiveValue: { (albums) in
                sut.albums = albums
                expection.fulfill()
            }.store(in: &cancellabels)

        wait(for: [expection], timeout: 2)
        XCTAssertTrue(sut.albums[0].genres.count > 0)
    }
}

struct MockAPI: APIService {
    let json = ""
    var albums = [Album]()
    
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
