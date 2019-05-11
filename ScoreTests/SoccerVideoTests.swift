//
//  SoccerVideoTests.swift
//  Score
//
//  Created by Brady on 5/11/19.
//  Copyright © 2019 William Messer. All rights reserved.
//

import XCTest

class SoccerVideoTests: XCTestCase {

    func testDecode() {
        let decoder = JSONDecoder.init()
        let bundle = Bundle(for: type(of: self))
        
        guard let url = bundle.url(forResource: "video", withExtension: "json") else {
            XCTFail()
            return
        }
        
        let data = try! Data(contentsOf: url)
        
        guard let decoded = try? decoder.decode([SoccerVideoModel].self, from: data) else {
            XCTFail()
            return
        }
    }

}
