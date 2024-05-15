//
//  Recommender.swift
//  BookRecommender
//
//  Created by Fabio Barbato on 11/05/24.
//

import Foundation
import CoreML

var ratings = [String: Double]()

public class Recommender: ObservableObject {
    
    @Published var books = [Book]()

    
    func load() {
        do{
            let recommender = BookRecommender()
            
            let input = BookRecommenderInput(items: ratings, k: 10)
            
            let result = try recommender.prediction(input: input)
            var tempBooks = [Book]()
            var temp: Book

            for str in result.recommendations{
                temp = findBook(byName: str) ?? Book(name: str)
                tempBooks.append(Book(cover:temp.cover,ISBN: temp.ISBN,name: temp.name))
            }
            self.books = tempBooks
//            print(ratings)
//            print(books)
        }catch(let error){
            print("error is \(error.localizedDescription)")
        }
        
    }
}
