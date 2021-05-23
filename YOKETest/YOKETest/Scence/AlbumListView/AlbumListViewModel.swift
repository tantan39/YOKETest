//
//  AlbumListViewModel.swift
//  YOKETest
//
//  Created by Tan Tan on 5/21/21.
//

import Combine

class AlbumListViewModel: ObservableObject {
    var service: APIService?
    @Published var albums: [Album] = []
    private var cancellables = Set<AnyCancellable>()
    
    init(service: APIService = ITunesService()) {
        self.service = service
        self.fetchAlbums()
    }
    
    func fetchAlbums() {
        service?.loadAlbums()
            .sink(receiveCompletion: { _ in },
                  receiveValue: { value in
                    self.albums = value
                    
                  })
            .store(in: &cancellables)
    }
    
}
