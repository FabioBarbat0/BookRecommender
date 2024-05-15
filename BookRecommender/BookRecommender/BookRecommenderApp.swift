//
//  BookRecommenderApp.swift
//  BookRecommender
//
//  Created by Fabio Barbato on 30/04/24.
//

import SwiftUI

@main
struct BookRecommenderApp: App {
    var body: some Scene {
        WindowGroup {
            //BookRatingView(books: bookDB)
            BookViewJSON()
        }
    }
}
