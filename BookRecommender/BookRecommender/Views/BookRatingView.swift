//
//  BookRating.swift
//  BookRecommender
//
//  Created by Fabio Barbato on 30/04/24.
//

import SwiftUI

struct BookRatingView: View {
    var books: [Book]
    
    let colums = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    var body: some View {
        NavigationStack{
            ScrollView {
                LazyVGrid(columns: colums, spacing: 44) {
                    
                    ForEach( books, id: \.self){ bookItem in
                        BookView(book: bookItem)
                    }
                }
            }
            NavigationLink(destination: RecommendView(books: books), label: {
                Button(action: {
                    print("Tapped")
                }, label: {
                    Text("Continue")
                        .padding()
                        .font(.title3)
                        .foregroundStyle (.white)
                        .background (Color("AccentColor"))
                        .clipShape(.rect(cornerRadius: 8))
                })
            })
        }
    }
}

#Preview {
        BookRatingView(books: bookDB)
    }
