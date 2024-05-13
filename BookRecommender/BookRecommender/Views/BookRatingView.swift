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
        ScrollView {
            LazyVGrid(columns: colums, spacing: 44) {
                
                ForEach( books, id: \.self){ bookItem in
                    BookView(book: bookItem)
                }
            }
        }
    }
}

#Preview {
        BookRatingView(books: bookDB)
    }
