//
//  RatingView.swift
//  BookRecommender
//
//  Created by Fabio Barbato on 13/05/24.
//

import SwiftUI

struct RatingView: View {
    @Binding var rating: Int
    var bookRated: String

    var label = ""

    var maximumRating = 5

    var offImage: Image?
    var onImage = Image(systemName: "star.fill")

    var offColor = Color.gray
    var onColor = Color.yellow
    
    var body: some View {
        HStack {
            if label.isEmpty == false {
                Text(label)
            }

            ForEach(1..<maximumRating + 1, id: \.self) { number in
                Button {
                    rating = number
                    print("\(bookRated) \(number)")
                } label: {
                    image(for: number)
                        .foregroundStyle(number > rating ? offColor : onColor)
                }
            }
        }.buttonStyle(.plain)
    }
    
    func image(for number: Int) -> Image {
        if number > rating {
            offImage ?? onImage
        } else {
            onImage
        }
    }
    
}


#Preview {
    RatingView(rating: .constant(4), bookRated: "La ragazza del treno")
}