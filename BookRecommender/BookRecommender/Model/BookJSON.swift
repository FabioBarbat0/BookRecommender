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


//func recoverBooks(isbnList: [String])->[Book]{
//    var bookList = [Book]()
//    for isbn in isbnList {
//        loadData(isbn: isbn){book in
//            bookList.append(book)
//        }
//    }
//    print(bookList)
//    return bookList
//}

func recoverBooks(isbnList: [String], completion: @escaping ([Book]) -> Void) {
    var bookList = [Book]()
    let dispatchGroup = DispatchGroup() // Creiamo un DispatchGroup
    
    for isbn in isbnList {
        dispatchGroup.enter() // Entriamo nel DispatchGroup prima di avviare la richiesta API
        loadData(isbn: isbn) { book in
            bookList.append(book)
            dispatchGroup.leave() // Usciamo dal DispatchGroup quando la richiesta API è completata
        }
    }
    
    dispatchGroup.notify(queue: .main) {
        // Tutte le richieste API sono state completate
        // Ora possiamo restituire bookList
        completion(bookList)
    }
}

func loadData(isbn: String, completion: @escaping (Book) -> Void) {
    guard let url = URL(string: "https://www.googleapis.com/books/v1/volumes?q=isbn:\(isbn)") else {
        print("Invalid URL")
        completion(Book(name: ""))
        return
    }
    print("Requesting URL:", url)
    
    URLSession.shared.dataTask(with: url) { data, response, error in
        guard let data = data, error == nil else {
            print("Error: \(error?.localizedDescription ?? "Unknown error")")
            completion(Book(name: ""))
            return
        }
        
        do {
            let decoder = JSONDecoder()
            let decodedData = try decoder.decode(BookJSON.self, from: data)
            if let firstItem = decodedData.items.first {
                let book = Book(cover: firstItem.volumeInfo.imageLinks.thumbnail,
                                ISBN: isbn,
                                name: firstItem.volumeInfo.title)
                completion(book)
            } else {
                completion(Book(name: ""))
            }
        } catch {
            print("Error decoding JSON: \(error)")
            completion(Book(name: ""))
        }
    }.resume()
}

//func loadData(isbn: String) -> Book {
//    var bookFetched = Book(name: "")
//    guard let url = URL(string: "https://www.googleapis.com/books/v1/volumes?q=isbn:\(isbn)") else {
//        print("Invalid URL")
//        return Book(name: "")
//    }
//    print("Requesting URL:", url)
//    
//    URLSession.shared.dataTask(with: url) { data, response, error in
//        guard let data = data, error == nil else {
//            print("Error: \(error?.localizedDescription ?? "Unknown error")")
//            return
//        }
//        
//        do {
//            let responseJSON = try JSONSerialization.jsonObject(with: data, options: [])
//            print("Response JSON:", responseJSON)
//            
//            let decoder = JSONDecoder()
//            let decodedData = try decoder.decode(BookJSON.self, from: data)
//            DispatchQueue.main.async {
//                var temp_books: [Item]
//                temp_books = decodedData.items
//                bookFetched = Book(cover: temp_books.first?.volumeInfo.imageLinks.thumbnail,
//                                   ISBN: isbn,
//                                   name: temp_books.first!.volumeInfo.title)
//            }
//        } catch {
//            print("Error decoding JSON: \(error)")
//        }
//    }.resume()
//    return bookFetched
//}


