//
//  BookUI.swift
//  BookRecommender
//
//  Created by Fabio Barbato on 11/05/24.
//

import SwiftUI
import Foundation


struct BookView: View {
    
    var book:Book
    @State private var rating = 0
    
    var body: some View {
            
        
            VStack{
                AsyncImage(url: URL(string: book.cover!)) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .clipShape(.rect(cornerRadius: 8))
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
                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                
                Text(book.name)
                    .fontWeight(.medium)
                    .padding(.bottom, 5)
                
                RatingView(rating: $rating, bookRated: book.name)
            }
    }
}

#Preview {
    BookView(book: Book(cover: "https://www.ibs.it/images/9788868368593_0_536_0_75.jpg", ISBN: "9788858513477", name: "La ragazza del treno"))
}
