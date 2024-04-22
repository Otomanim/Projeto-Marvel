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

