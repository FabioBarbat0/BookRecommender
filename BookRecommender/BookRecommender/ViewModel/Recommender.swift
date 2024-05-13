//
//  Recommender.swift
//  BookRecommender
//
//  Created by Fabio Barbato on 11/05/24.
//

import Foundation
//import Combine
import CoreML

public class Recommender: ObservableObject {
    
    @Published var books = [Book]()
    
    init(){
        load()
    }
    
    func load() {
        do{
            let recommender = BookRecommender()
            
            let ratings : [String: Double] = ["Dune": 3.0, "Altered Carbon": 4]
            let input = BookRecommenderInput(items: ratings, k: 10, restrict_: [], exclude: [])
            
            let result = try recommender.prediction(input: input)
            var tempBooks = [Book]()
            
            for str in result.recommendations{
                tempBooks.append(Book(cover: "", name: "\(str)"))
            }
            self.books = tempBooks
            
        }catch(let error){
            print("error is \(error.localizedDescription)")
        }
        
    }
}
