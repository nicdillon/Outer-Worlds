//
//  Utilities.swift
//  Outer Worlds
//
//  Created by Nic Dillon on 6/14/23.
//

import Foundation
import SwiftUI

func ValidateStringInput(input: String) -> Bool {
    return input.count > 0
}

struct RemovebackgroundColor: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        return UIView()
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        DispatchQueue.main.async {
            uiView.superview?.superview?.backgroundColor = .clear        }
    }
}
