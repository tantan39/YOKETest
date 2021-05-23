//
//  AlbumListView.swift
//  YOKETest
//
//  Created by Tan Tan on 5/21/21.
//

import SwiftUI

struct AlbumListView: View {
    @ObservedObject var viewModel = AlbumListViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    LazyVStack {
                        ForEach (viewModel.albums, id: \.id) { album in
                            NavigationLink (
                                destination:
                                    
                                    AlbumDetailView(album: album),
                                label: {
                                    AlbumCellView(album: album)
                                })
                        }
                    }
                }
                
                
            }
            .navigationBarTitle ("Albums")
            .edgesIgnoringSafeArea(.bottom)
        }
        
    }
}

struct AlbumListView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumListView()
    }
}
