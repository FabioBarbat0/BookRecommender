//
//  BookUI.swift
//  BookRecommender
//
//  Created by Fabio Barbato on 11/05/24.
//

import SwiftUI
import Foundation

var book: Book = Book(name: "La ragazza del treno", score: 3.0)

struct BookView: View {
    var body: some View {
            
            VStack{
                AsyncImage(url: URL(string: "https://www.ibs.it/images/9788868368593_0_536_0_75.jpg")) { image in
                    image.resizable()
                        .scaledToFit()
                }placeholder: {
                    ZStack{
                        Rectangle()
                            .fill(.gray)
                            .frame(width: 160)
                        Text("Cover \nunavailable")
                            .frame(width:100,
                                   alignment: .center)
                            .font(.title3)
                    }

                }
                .frame(width: 200, height: 250)
                .clipShape(.rect(cornerRadius: 3))
                
                Text(book.name)
                    .fontWeight(.medium)
                    .padding(.bottom, 5)
            }
    }
}

#Preview {
    BookView()
}
