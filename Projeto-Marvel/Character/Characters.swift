//
//  Characters.swift
//  Projeto-Marvel
//
//  Created by Evandro Rodrigo Minamoto on 17/09/21.
//

import Foundation

struct CharacterAPIResult: Codable {
    var data: CharacterAPIData
}

struct CharacterAPIData: Codable {
    var count: Int
    var results: [Character]
}
struct Character: Codable {
    var id: Int
    let name: String
    let description: String
    let thumbnail: [String:String]
}

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

//import Foundation
//
//// MARK: - Welcome
//struct Welcome: Codable {
//    let code, status, copyright, attributionText: String
//    let attributionHTML: String
//    let data: DataClass
//    let etag: String
//}
//
//// MARK: - DataClass
//struct DataClass: Codable {
//    let offset, limit, total, count: String
//    let results: [Result]
//}
//
//// MARK: - Result
//struct Result: Codable {
//    let id, name, resultDescription, modified: String
//    let resourceURI: String
//    let urls: [URLElement]
//    let thumbnail: Thumbnail
//    let comics: Comics
//    let stories: Stories
//    let events, series: Comics
//
//    enum CodingKeys: String, CodingKey {
//        case id, name
//        case resultDescription
//        case modified, resourceURI, urls, thumbnail, comics, stories, events, series
//    }
//}
//
//// MARK: - Comics
//struct Comics: Codable {
//    let available, returned, collectionURI: String
//    let items: [ComicsItem]
//}
//
//// MARK: - ComicsItem
//struct ComicsItem: Codable {
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
