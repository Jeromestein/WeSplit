//
//  ContentView.swift
//  WeSplit
//
//  Created by Jiayi on 1/27/23.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmout = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    
    let tipPercentages = [10,15,20,25,0]
    
    var body: some View {
        NavigationView {
            Form {
                /**
                 .currencyCode is deprecated in iOS16, so use .currency?.identifier
                 */
                Section {
                    TextField("Amount", value: $checkAmout, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad)
                    Picker("Number of People", selection: $numberOfPeople) {
                        ForEach(2..<20) {
                            Text("\($0) People")
                        }
                    }
                }
                Section {
                    Text(checkAmout, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
            }
            .navigationTitle("WeSplit")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
