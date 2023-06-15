//
//  CircleImage.swift
//  Outer Worlds
//
//  Created by Nic Dillon on 6/13/23.
//

import SwiftUI


struct CircleImage: View {
    @Environment(\.colorScheme) var colorScheme
    var image: Image

    var body: some View {
        image
            .resizable()
            .scaledToFit()
            .padding(25)
            .clipShape(Circle())
            .overlay {
                Circle().stroke(colorScheme == .dark ? Color.white : Color.black, lineWidth: 4)
            }
            .shadow(radius: 7)
            .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(image: Image(systemName: "chart.line.uptrend.xyaxis"))
    }
}
