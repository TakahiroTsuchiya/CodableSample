//
//  RandomUserAPI.swift
//  CodableSample
//
//  Created by other on 2017/11/08.
//  Copyright © 2017 TakahiroTsuchiya. All rights reserved.
//

import APIKit

struct RandomUserAPI: Request {

    typealias Response = UserData

    var baseURL: URL {
        return URL(string: "https://randomuser.me")!
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var path: String {
        return "/api"
    }

    var dataParser: DataParser {
        return DecodableDataParser()
    }

    func response(from object: Any, urlResponse: HTTPURLResponse) throws -> UserData {
        let decoder = JSONDecoder()
        return try decoder.decode(UserData.self, from: object as! Data)
    }
}

struct UserData: Codable {
    let results: [Results]
    let info: Info
}

struct Results: Codable {
    let gender: String
    let name: Name
    let location: Location
    let email: String
    let login: Login
    let dob: String
    let registered: String
    let phone: String
    let cell: String
    let id: Id
    let picture: Picture
    let nat: String
}

struct Name: Codable {
    let title: String
    let first: String
    let last: String
}

struct Location: Codable {
    let street: String
    let city: String
    let state: String
    let postcode: Int
}

struct Login: Codable {
    let username: String
    let password: String
    let salt: String
    let md5: String
    let sha1: String
    let sha256: String
}

struct Id: Codable {
    let name: String
    let value: String
}
struct Picture: Codable {
    let large: String
    let medium: String
    let thumbnail: String
}

struct Info: Codable {
    let seed: String
    let results: Int
    let page: Int
    let version: String
}
