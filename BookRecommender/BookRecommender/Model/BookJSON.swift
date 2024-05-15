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
    var publisher: String
    var publishedDate: String
    var description: String
    var pageCount: Int
    var categories: [String]
    var imageLinks: ImageLinks
}

// MARK: - ImageLinks
struct ImageLinks: Codable {
    var smallThumbnail, thumbnail: String
}

