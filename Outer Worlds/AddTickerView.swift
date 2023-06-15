//
//  AddTickerView.swift
//  Outer Worlds
//
//  Created by Nic Dillon on 6/14/23.
//

import SwiftUI

struct AddTickerView: View {
    @AppStorage("isShowingAddTickerView") var isShowingAddTickerView: Bool = false

    @State private var ticker: String = ""
    @State private var name: String = ""
    
    @State private var isNameValidated: Bool = false
    @State private var isTickerValidated: Bool = false
    
    var body: some View {
        VStack {
            Spacer()
            Text("Add a new stock")
                .font(.title)
            
            Text("Enter the stock's ticker symbol and name")
                .font(.subheadline)
            
            TextField("Enter Ticker", text: $ticker)
                .padding()
                .border(.primary)
                .disableAutocorrection(true)
                .textInputAutocapitalization(.characters)
                .onChange(of: ticker, perform: { value in
                    isTickerValidated = ValidateStringInput(input: ticker)
                })
            
            TextField("Enter Stock Name", text: $name)
                .padding()
                .border(.primary)
                .disableAutocorrection(true)
                .textInputAutocapitalization(.characters)
                .onChange(of: name, perform: { value in
                    isNameValidated = ValidateStringInput(input: name)
                })
            
            Button {
                if (isNameValidated && isTickerValidated) {
                    AddStock(stock: Stock(id: Constants.stockList.count+1, ticker: ticker, name: name))
                    isShowingAddTickerView.toggle()
                    print("Working")
                } else  {
                    print(isNameValidated)
                }
            } label: {
                Text("Add +")
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
            
            Spacer()
        }
        .background(Material.thin.opacity(0.5))
    }
}

struct AddTickerView_Previews: PreviewProvider {
    static var previews: some View {
        AddTickerView()
    }
}
