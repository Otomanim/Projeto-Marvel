//
//  SeriesModel.swift
//  Projeto-Marvel
//
//  Created by Evandro Rodrigo Minamoto on 30/10/21.
//

import Foundation

struct SeriesAPIResult: Codable {
    var data: SeriesAPIData
}

struct SeriesAPIData: Codable {
    var count: Int
    var results: [Series]
}
struct Series: Codable {
    var id: Int
    let title: String
    let description: String?
    let thumbnail: [String:String]
}

// MARK: - Result
//struct Result: Codable {
//    let id, title, resultDescription, resourceURI: String
//    let urls: [URLElement]
//    let startYear, endYear, rating, modified: String
//    let thumbnail: Thumbnail
//    let comics: Comics
//    let stories: Stories
//    let events: Comics
//    let characters, creators: Characters
//    let next, previous: Next
//
//    enum CodingKeys: String, CodingKey {
//        case id, title
//        case resultDescription
//        case resourceURI, urls, startYear, endYear, rating, modified, thumbnail, comics, stories, events, characters, creators, next, previous
//    }
//}
//
//// MARK: - Characters
//struct Characters: Codable {
//    let available, returned, collectionURI: String
//    let items: [CharactersItem]
//}
//
//// MARK: - CharactersItem
//struct CharactersItem: Codable {
//    let resourceURI, name, role: String
//}
//
//// MARK: - Comics
//struct Comics: Codable {
//    let available, returned, collectionURI: String
//    let items: [Next]
//}
//
//// MARK: - Next
//struct Next: Codable {
//    let resourceURI, name: String
//}
//
//// MARK: - Stories
//struct Stories: Codable {
//    let available, returned, collectionURI: String
//    let items: [StoriesItem]
//}
//
//// MARK: - StoriesItem
//struct StoriesItem: Codable {
//    let resourceURI, name, type: String
//}
//
//// MARK: - Thumbnail
//struct Thumbnail: Codable {
//    let path, thumbnailExtension: String
//
//    enum CodingKeys: String, CodingKey {
//        case path
//        case thumbnailExtension
//    }
//}
//
//// MARK: - URLElement
//struct URLElement: Codable {
//    let type, url: String
//}
