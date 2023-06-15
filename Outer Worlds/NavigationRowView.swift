//
//  NavigationRowView.swift
//  Outer Worlds
//
//  Created by Nic Dillon on 6/12/23.
//

import SwiftUI

struct NavigationRowView: View {
    var imageName: String
    var title: String
    var ticker: String
    var description: String
    var color: Color
    
    var body: some View {
        HStack {
            ZStack{
                Image(systemName: imageName)
                    .renderingMode(.original)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 80, alignment: .center)
                    .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.3), radius: 3, x: 2, y: 2)
                    .background(LinearGradient(gradient: Gradient(colors: [color, .black]), startPoint: .top, endPoint: .bottom))
                    .cornerRadius(8)
                Text(ticker)
                    .foregroundColor(.white)
                    .font(.title)
            }
            
            Text(title)
                .font(.title2)
                .fontWeight(.bold)
            
            Spacer()
        } //: HSTACK
    }
}

struct NavigationRowView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            VStack {
                NavigationRowView(imageName: "", title: "Apple", ticker: "AAPL", description: "Apple is a consumer technology company that creates and sells hardware and software products.", color: .white)
                    .preferredColorScheme(.dark)
                    .previewLayout(.fixed(width: 300, height: 70))
                NavigationRowView(imageName: "", title: "Nvidia", ticker: "NVDA", description: "Nvidia is a technology company that specializes in the development of computer graphics processors.", color: .green)
                    .preferredColorScheme(.dark)
                    .previewLayout(.fixed(width: 300, height: 70))
            }
            
        }
        
    }
}
