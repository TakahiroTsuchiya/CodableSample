//
//  CodableSampleTests.swift
//  CodableSampleTests
//
//  Created by other on 2017/11/07.
//  Copyright © 2017 TakahiroTsuchiya. All rights reserved.
//

import XCTest
@testable import CodableSample
import APIKit

class CodableSampleTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.

        let request = RandomUserAPI()
        
        Session.send(request) { result in
            switch result {
            case .success(let userData):

                XCTAssertNotNil(userData)

                for user in userData.results {
                    print("gender : \(user.gender)")
                    
                    print("name : \(user.name)")
                    print("name > first : \(user.name.first)")
                    print("name > last : \(user.name.last)")
                    print("name > title : \(user.name.title)")
                    
                    print("location : \(user.location)")
                    print("location > city: \(user.location.city)")
                    print("location > postcode: \(user.location.postcode)")
                    print("location > state: \(user.location.state)")
                    print("location > street: \(user.location.street)")
                    
                    print("email : \(user.email)")
                    
                    print("login : \(user.login)")
                    print("login > username: \(user.login.username)")
                    print("login > password: \(user.login.password)")
                    print("login > salt: \(user.login.salt)")
                    print("login > md5: \(user.login.md5)")
                    print("login > sha1: \(user.login.sha1)")
                    print("login > sha256: \(user.login.sha256)")
                    
                    print("dob : \(user.dob)")
                    print("registered : \(user.registered)")
                    print("phone : \(user.phone)")
                    print("cell : \(user.cell)")
                    
                    print("id : \(user.id)")
                    print("id > name: \(user.id.name)")
                    print("id > value: \(user.id.value)")
                    
                    print("picture : \(user.picture)")
                    print("picture > large: \(user.picture.large)")
                    print("picture > medium: \(user.picture.medium)")
                    print("picture > thumbnail: \(user.picture.thumbnail)")
                    
                    print("nat : \(user.nat)")
                }
                
                print("seed : \(userData.info.seed)")
                print("results : \(userData.info.results)")
                print("page : \(userData.info.page)")
                print("version : \(userData.info.version)")
                
                //                    print("userData : \(userData)")
                //                    print("results : \(userData.results)")
                //                    print("info : \(userData.info)")
                
            case .failure(let error):
                print("error: \(error)")

                XCTFail("API Request Error.")
            }
        }
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
