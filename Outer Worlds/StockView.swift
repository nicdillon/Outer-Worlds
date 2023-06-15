//
//  StockView.swift
//  Outer Worlds
//
//  Created by Nic Dillon on 6/12/23.
//

import SwiftUI

struct StockView: View {
    @StateObject private var viewModel = StockViewModel(controller: StockFetchController())
    
    var stock: String
    var image: Image
    
    var body: some View {
        GeometryReader { geo in
            HStack(alignment: .center){
                switch viewModel.status {
                case .success(let data):
                    VStack {
                        Spacer()
                        CircleImage(image: image)
                            .padding(.bottom, -100)
                            .frame(height: 80)
                        
                        Spacer()
                        
                        VStack{
                            Text(data.ticker)
                                .font(.largeTitle)
                                .fontWeight(.bold)
                        }
                        
                        Group{
                            HStack{
                                Text("Gain/Loss:")
                                    .font(.title)
                                    .fontWeight(.bold)
                                
                                Text("$\(data.results[0].c - data.results[0].o) (\(String(format: "%.3f%%",(data.results[0].c - data.results[0].o) / data.results[0].o * 100)))")
                                    .font(.title)
                            }
                            .padding(20)
                            .background(data.results[0].c > data.results[0].o ? Color("MoneyGreen").opacity(0.7) : Color("LossRed").opacity(0.7))
                            .overlay {
                                RoundedRectangle(cornerRadius: 8).stroke(.black)
                            }
                            .cornerRadius(8)
                            .shadow(radius: 8)
                            
                            HStack{
                                VStack(alignment: .leading){
                                    Text("Date: \(Constants.dataFormatter.string(from: Date.now))")
                                        .padding(.bottom)
                                    Text("Open: $\(data.results[0].o)")
                                        .padding(.bottom)
                                    Text("Close: $\(data.results[0].c)")
                                        .padding(.bottom)
                                    Text("High: $\(data.results[0].h)")
                                        .padding(.bottom)
                                    Text("Low: $\(data.results[0].l)")
                                        .padding(.bottom)
                                    
                                }
                                .fontWeight(.bold)
                                .padding()
                                
                                Spacer()
                            }
                        }
                        
                        Spacer()
                    }
                    .ignoresSafeArea()
                    
                case .fetching:
                    HStack(alignment: .center){
                        Spacer()
                        VStack(alignment: .center){
                            Spacer()
                            ProgressView()
                            Spacer()
                        }
                        Spacer()
                    }
                    
                default:
                    EmptyView()
                    
                }
            }
            .onAppear {
                Task {
                    await viewModel.getData(for: stock)
                }
            }
        }
    }
}

struct StockView_Previews: PreviewProvider {
    static var previews: some View {
        StockView(stock: Constants.stockList[0].ticker, image: Image(systemName:"chart.line.uptrend.xyaxis.circle"))
    }
}
