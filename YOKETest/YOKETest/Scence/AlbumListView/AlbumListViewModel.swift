//
//  AlbumListViewModel.swift
//  YOKETest
//
//  Created by Tan Tan on 5/21/21.
//

import Combine

public class AlbumListViewModel: ObservableObject {
    var service: APIService?
     @Published public var albums: [Album] = []
    @Published public var selectedAlbum: Album?
    
    private var cancellables = Set<AnyCancellable>()
    
    public init(service: APIService = ITunesService()) {
        self.service = service
        self.fetchAlbums()
    }
    
    public func fetchAlbums() {
        service?.loadAlbums()
            .sink(receiveCompletion: { _ in },
                  receiveValue: { value in
                    self.albums = value
                    
                  })
            .store(in: &cancellables)
    }
    
}
