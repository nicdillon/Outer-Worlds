//
//  StockFetchContoller.swift
//  Outer Worlds
//
//  Created by Nic Dillon on 6/12/23.
//

import Foundation

struct StockFetchController {
    enum NetworkError: Error {
        case badURL, badResponse
    }
    
    private let baseURL = URL(string: "https://api.polygon.io/v2/aggs/ticker/")!
    
    func fetchStockData(from ticker: String) async throws -> StockDetails {
        let stockURL = baseURL.appending(path: "\(ticker)/prev") // Get previous open/close data for the given ticker
        var stockComponents = URLComponents(url: stockURL, resolvingAgainstBaseURL: true)
        let stockQueryItem = URLQueryItem(name: "apiKey", value: Secrets.polygonAPIKey)
        stockComponents?.queryItems = [stockQueryItem]
        guard let fetchURL = stockComponents?.url else {
            throw NetworkError.badURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: fetchURL)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw NetworkError.badResponse
        }
        
        let stock = try JSONDecoder().decode(StockDetails.self, from: data)
        
        return stock
    }
}
