//
//  AlbumCellView.swift
//  YOKETest
//
//  Created by Tan Tan on 5/21/21.
//

import SwiftUI

struct AlbumCellView: View {
    var album: Album
    
    var body: some View {
        VStack(alignment: .center) {
            HStack {
                Spacer()
                RemoteImage(url: album.artworkUrl100)
                    .frame(width: 200, height: 200)
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(10)
                    .overlay(RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.clear, lineWidth: 4))
                    .shadow(color: .secondary, radius: 10)
                Spacer()
            }

            Text(album.name)
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .foregroundColor(.primary)
            Text(album.artistName)
                .font(.title2)
                .foregroundColor(.primary)
        }
        .padding([.top, .bottom], 20)
        .foregroundColor(.secondary)
        
    }
}

struct AlbumCellView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumCellView(album: Album(id: "", artistName: "artist", name: "name", artworkUrl100: "https://is3-ssl.mzstatic.com/image/thumb/Music114/v4/64/82/1d/64821d19-14b2-7f58-8106-bccb4d04ada3/075679786210.jpg/200x200bb.png", genres: [], releaseDate: "", copyright: "", url: ""))
    }
}
