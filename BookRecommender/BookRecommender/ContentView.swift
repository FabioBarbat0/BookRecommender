//
//  ContentView.swift
//  BookRecommender
//
//  Created by Fabio Barbato on 30/04/24.
//

import SwiftUI
import Combine
import CoreML


struct ContentView: View {
    @ObservedObject var topRecommendations = Recommender()
    
    var body: some View {
        NavigationView {
            List(topRecommendations.books) { book in
                VStack (alignment: .leading) {
                    Text(book.name)
                    Text("\(book.score)")
                    .font(.system(size: 14))
                    .foregroundColor(Color.gray)
                }
            }.navigationBarTitle("CoreMLRecommender", displayMode: .inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
