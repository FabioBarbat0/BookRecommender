//
//  BookDB.swift
//  BookRecommender
//
//  Created by Fabio Barbato on 13/05/24.
//

import Foundation

//let bookDB = [
//    Book(cover: "https://www.ibs.it/images/9788868368593_0_536_0_75.jpg", ISBN: "9788858513477", name: "La ragazza del treno"),
//    Book(cover: "https://www.ibs.it/images/9788861928091_0_536_0_75.jpg", ISBN: "9788865830444", name: "La terapia"),
//    Book(cover: "https://www.ibs.it/images/9788804738237_0_0_536_0_75.jpg", ISBN: "9788835707431", name: "La città di vapore"),
//    Book(cover: "https://www.ibs.it/images/9788852087226_0_536_0_75.jpg", ISBN: "9788852087226", name: "La donna alla finestra"),
//    Book(cover: "https://www.ibs.it/images/9788804667735_0_536_0_75.jpg", ISBN: "9788852077128", name: "La coppia della porta accanto"),
//    Book(cover: "https://www.ibs.it/images/9788830444799_0_536_0_75.jpg", ISBN: "9788830444799", name: "La ragazza nella nebbia"),
//    Book(cover: "https://www.ibs.it/images/9788850247998_0_0_536_0_75.jpg", ISBN: "9788830447257", name: "Il maestro delle ombre"),
//    Book(cover: "https://www.ibs.it/images/9788893427470_0_536_0_75.jpg", ISBN: "9788893427470", name: "L'outsider"),
//    Book(cover: "https://www.ibs.it/images/9788807900778_0_536_0_75.jpg", ISBN: "9788854134072", name: "Jane Eyre"),
//    Book(cover: "https://www.ibs.it/images/9788858818961_0_536_0_75.jpg", ISBN: "9788858818961", name: "Cime tempestose"),
//    Book(cover: "https://www.ibs.it/images/9788893812672_0_536_0_75.jpg", ISBN: "9788893812672", name: "Il maestro e Margherita"),
//    Book(cover: "https://www.ibs.it/images/9788852072024_0_536_0_75.jpg", ISBN: "9788852072024", name: "Il giocatore"),
//    Book(cover: "https://www.ibs.it/images/9788811131434_0_536_0_75.jpg", ISBN: "9788811131434", name: "Guerra e pace"),
//    Book(cover: "https://www.ibs.it/images/9788807822278_0_536_0_75.jpg", ISBN: "9788807822278", name: "Il grande Gatsby"),
//    Book(cover: "https://www.ibs.it/images/9788835709633_0_536_0_75.jpg", ISBN: "9788835709633", name: "Il ritratto di Dorian Gray"),
//    Book(cover: "https://www.ibs.it/images/9788858618134_0_536_0_75.jpg", ISBN: "9788858618134", name: "Il Rosso e il Nero"),
//    Book(cover: "https://www.ibs.it/images/9788834739679_0_536_0_75.jpg", ISBN: "9788834721285", name: "Dune"),
//    Book(cover: "https://www.ibs.it/images/9788822703507_0_536_0_75.jpg", ISBN: "9788822703507", name: "La guerra dei mondi"),
//    Book(cover: "https://www.ibs.it/images/9788854170520_0_536_0_75.jpg", ISBN: "9788893812672", name: "The Martian"),
//    Book(cover: "https://www.ibs.it/images/9781473217379_0_536_0_75.jpg", ISBN: "9781473217379", name: "Neuromancer"),
//    Book(cover: "https://www.ibs.it/images/9788851142056_0_536_0_75.jpg", ISBN: "9788851142056", name: "Marte Rosso"),
//    Book(cover: "https://www.ibs.it/images/9788850246731_0_536_0_75.jpg", ISBN: "9788850250998", name: "Altered Carbon"),
//    Book(cover: "https://www.ibs.it/images/9788804680604_0_0_536_0_75.jpg", ISBN: "9788852084089", name: "Il problema dei tre corpi"),
//    Book(cover: "https://www.ibs.it/images/9788852075551_0_536_0_75.jpg", ISBN: "9788852075551", name: "Le guide del tramonto")
//]

let isbnList = [
    "9788858513477",
    "9788865830444",
    "9788835707431",
    "9788852087226",
    "9788852077128",
    "9788830444799",
    "9788830447257",
    "9788893427470",
    "9788854134072",
    "9788858818961",
    "9788893812672",
    "9788852072024",
    "9788811131434",
    "9788807822278",
    "9788835709633",
    "9788858618134",
    "9788834721285",
    "9788822703507",
    "9788893812672",
    "9781473217379",
    "9788851142056",
    "9788850250998",
    "9788852084089",
    "9788852075551"
    ]

var bookDB = [Book]()
func findBook(byName name: String) -> Book? {
    return bookDB.first { $0.name.lowercased() == name.lowercased() }
}
