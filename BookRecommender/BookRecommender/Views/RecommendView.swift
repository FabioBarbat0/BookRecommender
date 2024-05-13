//
//  RecommendView.swift
//  BookRecommender
//
//  Created by Fabio Barbato on 30/04/24.
//

import SwiftUI

struct RecommendView: View {
    @ObservedObject var topRecommendations = Recommender()
    
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
       /* NavigationView {
            List(topRecommendations.books) { book in
                VStack (alignment: .leading) {
                    Text(book.name)
                    Text("\(book.score)")
                    .font(.system(size: 14))
                    .foregroundColor(Color.gray)
                }
            }
        }*/
    }
}

#Preview {
        RecommendView(books: bookDB)
    }
