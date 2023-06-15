//
//  StockViewModel.swift
//  Outer Worlds
//
//  Created by Nic Dillon on 6/12/23.
//

import Foundation

@MainActor
class StockViewModel: ObservableObject {
    enum Status {
        case notStarted
        case fetching
        case success(data: StockDetails)
        case failed(error: Error)
    }
    
    @Published private(set) var status: Status = .notStarted
    
    private let controller: StockFetchController
    
    init(controller: StockFetchController) { // Constructor
        self.controller = controller // set injected dependency to the local property
    }
    
    func getData(for ticker: String) async {
        status = .fetching
        
        do {
            let stock = try await controller.fetchStockData(from: ticker)
            
            status = .success(data: stock)
        } catch {
            status = .failed(error: error)
        }
    }
}
