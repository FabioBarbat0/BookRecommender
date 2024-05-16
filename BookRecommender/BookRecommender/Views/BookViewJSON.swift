////
////  BookViewJSON.swift
////  BookRecommender
////
////  Created by Fabio Barbato on 15/05/24.
////
//
//import SwiftUI
//
//struct BookViewJSON: View {
//    @State private var books: [Item] = []
//    
//    var body: some View {
//        List(books, id: \.id) { book in
//            VStack(alignment: .leading) {
//                Text("Title: \(book.volumeInfo.title)")
//                Text("Authors: \(book.volumeInfo.authors.joined(separator: ", "))")
//                //Text("Publisher: \(book.volumeInfo.publisher)")
//            }
//        }
//        .onAppear() {
//            loadData()
//        }
//    }
//    
//    func loadData() {
//        guard let url = URL(string: "https://www.googleapis.com/books/v1/volumes?q=isbn:9788858818961") else {
//            print("Invalid URL")
//            return
//        }
//        print("Requesting URL:", url)
//        
//        URLSession.shared.dataTask(with: url) { data, response, error in
//            guard let data = data, error == nil else {
//                print("Error: \(error?.localizedDescription ?? "Unknown error")")
//                return
//            }
//            
//            do {
//                let responseJSON = try JSONSerialization.jsonObject(with: data, options: [])
//                print("Response JSON:", responseJSON)
//                
//                let decoder = JSONDecoder()
//                let decodedData = try decoder.decode(BookJSON.self, from: data)
//                DispatchQueue.main.async {
//                    self.books = decodedData.items
//                }
//            } catch {
//                print("Error decoding JSON: \(error)")
//            }
//        }.resume()
//    }
//
//}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        BookViewJSON()
//    }
//}
