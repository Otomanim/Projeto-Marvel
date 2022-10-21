//
//  EventsModel.swift
//  Projeto-Marvel
//
//  Created by Evandro Rodrigo Minamoto on 29/11/21.
//

import Foundation

struct Welcome: Codable {
    var data: EventsData
}

struct EventsData: Codable {
    var count: Int
    var results: [Events]
}

struct Events: Codable {
    var id: Int
    var title: String
    var description: String
    var thumbnail: [String:String]
}
