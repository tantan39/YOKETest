//
//  AlbumDetailView.swift
//  YOKETest
//
//  Created by Tan Tan on 5/23/21.
//

import SwiftUI

struct AlbumDetailView: View {
    var album: Album
    
    var body: some View {
        VStack(alignment: .center) {
            HStack {
                Spacer()
                RemoteImage(url: album.artworkUrl100)
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(10)
                    .overlay(RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.clear, lineWidth: 4))
                    .shadow(color: .secondary, radius: 10)
                Spacer()
            }

            VStack {
                Text(album.name)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.primary)
                Text(album.artistName)
                    .font(.title2)
                    .foregroundColor(.primary)
            }
            
            VStack (alignment: .leading) {
                Text(TextManager.genres)
                    .font(.body)
                    .fontWeight(.semibold)
                ScrollView {
                    HStack(spacing: 16) {
                        ForEach(album.genres, id: \.genreId) { (item) in
                            Text(item.name)
                                .font(.body)
                                .foregroundColor(.gray)
                        }
                    }
                    
                }
                
                Text(TextManager.releaseDate)
                    .font(.body)
                    .fontWeight(.semibold)
                Text(album.releaseDate)
                    .font(.body)
                    .foregroundColor(.gray)
                Text(album.artworkUrl100)
                    .font(.body)
                    .lineLimit(nil)
                    .minimumScaleFactor(0.5)
                    .foregroundColor(.gray)
                    
                
                VStack {
                    Button(action: {
                        if let url = URL(string: album.url) {
                               UIApplication.shared.open(url)
                           }
                    }, label: {

                        Text(TextManager.itunesStore)
                            .frame(maxWidth: .infinity , maxHeight: 60)
                            .foregroundColor(.white)
                            .background(Color.orange)
                            .cornerRadius(20)
                                                
                    })
                    

                }
                .padding(.top,16)
            }
            

        }
        .padding([.leading, .trailing], 20)
    }
}

struct AlbumDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let album = Album(id: "", artistName: "", name: "", artworkUrl100: "https://is3-ssl.mzstatic.com/image/thumb/Music114/v4/64/82/1d/64821d19-14b2-7f58-8106-bccb4d04ada3/075679786210.jpg/200x200bb.png", genres: [], releaseDate: "", copyright: "", url: "")
        AlbumDetailView(album: album)
    }
}
