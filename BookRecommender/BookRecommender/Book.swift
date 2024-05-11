//
//  Book.swift
//  BookRecommender
//
//  Created by Fabio Barbato on 11/05/24.
//

import Foundation
struct Book: Identifiable {
    public var id = UUID()
    public var name: String
    public var score: Double
    
}
