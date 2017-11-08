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
    
    func response(from object: Any, urlResponse: HTTPURLResponse) throws -> UserData {
        return try UserData(object: object)
    }
}

struct UserData {
//    let name: Name
//    let location: Location

    let seed: String
    let results: Int
    let page: Int
    let version: String

    init(object: Any) throws {
        guard let dictionary = object as? [String: Any]
//            , let name = dictionary["name"] as?  [String: Any]
//            , let location = dictionary["location"] as? Location
            , let info = dictionary["info"] as? [String: Any]
            , let seed = info["seed"] as? String
            , let results = info["results"] as? Int
            , let page = info["page"] as? Int
            , let version = info["version"] as? String
            else {
                throw ResponseError.unexpectedObject(object)
        }

//        self.name.title = name["title"]
//        self.name.first = name["first"]
//        self.name.last = name["last"]

        self.seed = seed
        self.results = results
        self.page = page
        self.version = version
    }
}

struct Name {
    let title: String
    let first: String
    let last: String
}

struct Location {
    let street: String
    let city: String
    let state: String
    let postcode: String
}

struct Info {
    let seed: String
    let results: Int
    let page: Int
    let version: String
}
