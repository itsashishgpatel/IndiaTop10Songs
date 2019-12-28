//
//  Model.swift
//  IndiaTop10Songs
//
//  Created by IMCS2 on 12/28/19.
//  Copyright © 2019 IMCS2. All rights reserved.
//

import Foundation

struct Welcome: Codable {
    let feed: Feed
}

struct Feed: Codable {
    let title: String
    let id: String
    let author: Author
    let links: [Link]
    let copyright, country: String
    let icon: String
    let updated: String
    let results: [Result]
}

struct Author: Codable {
    let name: String
    let uri: String
}

struct Link: Codable {
    let linkSelf: String?
    let alternate: String?
    
    enum CodingKeys: String, CodingKey {
        case linkSelf = "self"
        case alternate
    }
}

struct Result: Codable {
    let artistName, id, releaseDate, name: String
    let collectionName: String
    let kind: Kind
    let copyright, artistID: String
    let artistURL: String
    let artworkUrl100: String
    let genres: [Genre]
    let url: String
    
    enum CodingKeys: String, CodingKey {
        case artistName, id, releaseDate, name, collectionName, kind, copyright
        case artistID = "artistId"
        case artistURL = "artistUrl"
        case artworkUrl100, genres, url
    }
}

struct Genre: Codable {
    let genreID, name: String
    let url: String
    
    enum CodingKeys: String, CodingKey {
        case genreID = "genreId"
        case name, url
    }
}

enum Kind: String, Codable {
    case song = "song"
}
