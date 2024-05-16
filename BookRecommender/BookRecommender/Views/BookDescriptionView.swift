//
//  BookDescriptionView.swift
//  BookRecommender
//
//  Created by Fabio Barbato on 16/05/24.
//

import SwiftUI

struct BookDescriptionView: View {
    var isbn: String
    var cover: String
    @State private var webReader: String?
    @State private var description: String?
    var body: some View {
        VStack{
            ScrollView{
                AsyncImage(url: URL(string: cover)) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .clipShape(.rect(cornerRadius: 8))
                }placeholder: {
                    ZStack{
                        Rectangle()
                            .fill(.gray)
                            .frame(width: 160)
                        Text("Cover \nunavailable")
                            .frame(width:100,
                                   alignment: .center)
                            .font(.title3)
                    }
                    
                }.frame(width: 300)
                    .padding()
                
                Link(destination: URL(string: "https://www.apple.com")!) {
                    HStack{
                        Text("Preview")
                            .foregroundStyle(.white)
                        Image(systemName: "book")
                            .foregroundStyle(.white)
                    }
                    .frame(width: 150,height:50)
                    .background(Color("AccentColor"))
                }.clipShape(.rect(cornerRadius: 10))

                
//                Button(action: {
//                    print("ciao \(webReader)")
//                }, label: {
//                    HStack{
//                        Text("Preview")
//                            .foregroundStyle(.white)
//                        Image(systemName: "book")
//                            .foregroundStyle(.white)
//                    }.frame(width: 150,height:50)
//                        .background(Color("AccentColor"))
//                })             .clipShape(.rect(cornerRadius: 10))
                Divider()
                Text("Description")
                    .bold()
                    .font(.title)
                    .multilineTextAlignment(.leading)
                    
                Text(description ?? "Description unavailable")
                    .font(.title2)
                    .padding(.horizontal)
                
            }
        }
        .onAppear(){
            loadData(isbn: isbn){ book_component in
                description = book_component.first as? String
                webReader = book_component.last as? String
            }
        }
    }
}

#Preview {
    BookDescriptionView(isbn: "9788858513477", cover: "https://www.ibs.it/images/9788868368593_0_536_0_75.jpg")
}
