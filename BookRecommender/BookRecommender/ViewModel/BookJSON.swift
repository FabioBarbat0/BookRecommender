//
//  BookJSON.swift
//  BookRecommender
//
//  Created by Fabio Barbato on 15/05/24.
//

import Foundation

// MARK: - BookJSON
struct BookJSON: Codable {
    var items: [Item]
}

// MARK: - Item
struct Item: Codable {
    var kind, id, etag: String
    var volumeInfo: VolumeInfo
    var accessInfo: AccessInfo
}

// MARK: - AccessInfo
struct AccessInfo: Codable {
    var webReaderLink: String
}

// MARK: - VolumeInfo
struct VolumeInfo: Codable {
    var title: String
    var authors: [String]
    var publisher: String?
    var publishedDate: String
    var description: String?
    var pageCount: Int
    var categories: [String]?
    var imageLinks: ImageLinks
}

// MARK: - ImageLinks
struct ImageLinks: Codable {
    var smallThumbnail, thumbnail: String
}



func loadData(isbn: String, completion: @escaping ([String?]) -> Void) {
    guard let url = URL(string: "https://www.googleapis.com/books/v1/volumes?q=isbn:\(isbn)") else {
        print("Invalid URL")
        completion([])
        return
    }
    print("Requesting URL:", url)
    
    URLSession.shared.dataTask(with: url) { data, response, error in
        guard let data = data, error == nil else {
            print("Error: \(error?.localizedDescription ?? "Unknown error")")
            completion([])
            return
        }
        
        do {
            let decoder = JSONDecoder()
            let decodedData = try decoder.decode(BookJSON.self, from: data)
            if let firstItem = decodedData.items.first {
                let book_components = [firstItem.volumeInfo.description,firstItem.accessInfo.webReaderLink]
                completion(book_components)
            } else {
                print("Error loading book")
            }
        } catch {
            print("Error decoding JSON: \(error)")
            completion([])
        }
    }.resume()
}


