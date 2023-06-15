//
//  AddTicker.swift
//  Outer Worlds
//
//  Created by Nic Dillon on 6/14/23.
//

import Foundation

func AddStock(stock: Stock) {
    do {
        var currentStocks = Constants.stockList
        
        if currentStocks.contains(where: { existingStock in
            existingStock.ticker == stock.ticker
        }) { 
            print("Ticker already exists: \(stock.ticker)")
            return 
        }
        
        currentStocks.append(stock)
            
        let fileURL = Bundle.main.url(forResource: "ExampleStock", withExtension: "json")
        
        if fileURL == nil {
            print("Invalid file url")
            return
        }
                
        let encoder = JSONEncoder()
        try encoder.encode(currentStocks).write(to: fileURL!)
    } catch {
        print(error.localizedDescription)
    }
}
