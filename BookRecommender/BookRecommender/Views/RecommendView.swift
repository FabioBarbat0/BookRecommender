//
//  RecommendView.swift
//  BookRecommender
//
//  Created by Fabio Barbato on 30/04/24.
//

import SwiftUI

struct RecommendView: View {
    @ObservedObject var topRecommendations: Recommender
    
    var books: [Book]
    
    let colums = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: colums, spacing: 44) {
                
                ForEach( topRecommendations.books.indices, id: \.self){ index in
                    let bookItem = topRecommendations.books[index]
                    BookView(book: bookItem, isRated: true, rank: index+1)
                }
            }
        }
    }
}

//#Preview {
//    RecommendView(topRecommendations: , books: bookDB)
//    }
