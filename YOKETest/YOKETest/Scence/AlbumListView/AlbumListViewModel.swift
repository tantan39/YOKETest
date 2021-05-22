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
    var cancellable: AnyCancellable?
    
    init(service: APIService = ITunesService()) {
        self.service = service
    }
    
    func fetchAlbums() {
        cancellable = service?.loadAlbums()
            .sink(receiveCompletion: { _ in },
                  receiveValue: { value in
                    self.albums = value })
    }
    
}
