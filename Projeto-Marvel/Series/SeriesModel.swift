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

