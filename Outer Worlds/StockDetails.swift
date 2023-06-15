//
//  Stock.swift
//  Outer Worlds
//
//  Created by Nic Dillon on 6/12/23.
//

import Foundation

struct StockDetails: Decodable {
    let ticker: String
    let queryCount: Int
    let resultsCount: Int
    let adjusted: Bool
    let results: [CounterList]
    let status: String
    let request_id: String
    let count: Int
}

struct Stock: Decodable, Encodable, Hashable {
    let id: Int
    let ticker: String
    let name: String
}

struct CounterList: Decodable {
    let v: Double
    let vw: Double
    let o: Double
    let c: Double
    let h: Double
    let l: Double
    let t: Double
    let n: Double
}


