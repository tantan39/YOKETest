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
                    .padding()
                Spacer()
            }
            
            Text(album.name)
            Text(album.artistName)
        }
        
    }
}

struct AlbumCellView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumCellView(album: Album(artistName: "artist", name: "name", artworkUrl100: "https://is3-ssl.mzstatic.com/image/thumb/Music114/v4/64/82/1d/64821d19-14b2-7f58-8106-bccb4d04ada3/075679786210.jpg/200x200bb.png", id: ""))
    }
}
