//
//  ContentView.swift
//  Coach Says
//
//  Created by Nic Dillon on 6/12/23.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme
    @AppStorage("isShowingAddTickerView") var isShowingAddTickerView: Bool = false
    @State private var addedStocks: [Stock] = Constants.stockList
    
    var body: some View {
        ZStack {
            NavigationView {
                List {
                    NavigationLink {
                        StockView(stock: Constants.stockList[0].ticker, image: Image("AppleLogo.svg"))
                    } label: {
                        NavigationRowView(imageName: "", title: Constants.stockList[0].name, ticker: "AAPL", description: "BLAH BLAH", color: .white)
                    }
                    NavigationLink {
                        StockView(stock: Constants.stockList[1].ticker, image: Image("NvidiaLogo.svg"))
                    } label: {
                        NavigationRowView(imageName: "", title: Constants.stockList[1].name, ticker: Constants.stockList[1].ticker, description: "BLAH BLAH", color: .green)
                    }
                    NavigationLink {
                        StockView(stock: Constants.stockList[2].ticker, image: Image("TeslaLogo.svg"))
                    } label: {
                        NavigationRowView(imageName: "", title: Constants.stockList[2].name, ticker: Constants.stockList[2].ticker, description: "BLAH BLAH", color: .red)
                    }
                    NavigationLink {
                        StockView(stock: Constants.stockList[3].ticker, image: Image("IntelLogo.svg"))
                    } label: {
                        NavigationRowView(imageName: "", title: Constants.stockList[3].name, ticker: Constants.stockList[3].ticker, description: "", color: .blue)                    }
                    NavigationLink {
                        StockView(stock: Constants.stockList[4].ticker, image: Image("GMELogo.svg"))
                    } label: {
                        NavigationRowView(imageName: "", title: Constants.stockList[4].name, ticker: Constants.stockList[4].ticker, description: "BLAH BLAH", color: .red)
                    }
                    ForEach(addedStocks[5...], id: \.self) { item in
                        NavigationLink {
                            StockView(stock: item.ticker, image: Image(systemName: colorScheme == .dark ? "chart.line.uptrend.xyaxis.circle" : "chart.line.uptrend.xyaxis.circle.fill"))
                        } label: {
                            NavigationRowView(imageName: "", title: item.name, ticker: item.ticker, description: "BLAH BLAH", color: .white)
                        }
                    }
                }
                .navigationTitle("Stocks")
                .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
            }
            
            VStack(alignment: .trailing) {
                Spacer()
                Button {
                    isShowingAddTickerView.toggle()
                    addedStocks = Constants.stockList
                } label: {
                    Text("Add a ticker +")
                        .font(.title2)
                        .foregroundColor(.black)
                        .padding()
                }
                .overlay {
                    RoundedRectangle(cornerRadius: 8).stroke(.black)
                }
                .background(Color("MoneyGreen"))
                .cornerRadius(8)
                .shadow(radius: 8)
                .padding()
                .blurredSheet(show: $isShowingAddTickerView) {
                    AddTickerView()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
