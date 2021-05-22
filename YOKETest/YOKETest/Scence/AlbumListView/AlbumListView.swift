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
        VStack {
            NavigationView {
                List (viewModel.albums) { album in
                    NavigationLink(
                        destination: Text("Destination")) {
                        AlbumCellView(album: album)
                    }
                    
                }
                .navigationBarTitle ("Albums")
                .padding()
                .edgesIgnoringSafeArea(.bottom)

            }
            
        }
        .onAppear(perform: {
            viewModel.fetchAlbums()
        })
    }
}

struct AlbumListView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumListView()
    }
}
