//
//  Constants.swift
//  Coach Says
//
//  Created by Nic Dillon on 6/12/23.
//

import Foundation
import SwiftUI

enum Constants {
    static let stockList: [Stock] = {
        let decoder = JSONDecoder()
        let data = try! Data(contentsOf: Bundle.main.url(forResource: "ExampleStock", withExtension: "json")!)
        
        return try! decoder.decode([Stock].self, from: data)
    } ()
    
    static let dataFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter
    } ()
}

extension String {
    
    var replaceSpaceWithPlus: String {
        self.replacingOccurrences(of: " ", with: "+")
    }
    
    var noSpaces: String {
        self.replacingOccurrences(of: " ", with: "")
    }
    
    var lowerNoSpaces: String {
        self.noSpaces.lowercased()
    }
}

extension View {
    func blurredSheet<Content: View>(show: Binding<Bool>, @ViewBuilder content: @escaping ()->Content) -> some View {
        self
            .sheet(isPresented: show) {
                content()
                    .background(RemovebackgroundColor())
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background {
                        Rectangle()
                            .fill(Material.ultraThin)
                            .ignoresSafeArea(.container, edges: .all)
                    }
            }
    }
}
