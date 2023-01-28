//
//  ContentView.swift
//  WeSplit
//
//  Created by Jiayi on 1/27/23.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmout = 0.0
    @State private var peopleCount = 2
    @State private var tipPercentage = 20
    
    let tipPercentages = [10,15,20,25,0]
    
    var totalPerPerson: Double {
        /**
         The number of people picker has the range 2 to 20, peopleCount is off by 2,
         so the number of people is peopleCount+2.
         */
        let numberOfPeople = Double(peopleCount+2)
        let tip = checkAmout / 100 * Double(tipPercentage)
        
        return (checkAmout+tip) / numberOfPeople
    }
    
    var body: some View {
        NavigationView {
            Form {
                /**
                 .currencyCode is deprecated in iOS16, so use .currency?.identifier
                 */
                Section {
                    TextField("Amount", value: $checkAmout, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad)
                    Picker("Number of People", selection: $peopleCount) {
                        ForEach(2..<20) {
                            Text("\($0) People")
                        }
                    }
                }
                Section {
                    Picker("Tip Percentage", selection: $tipPercentage) {
                        ForEach(tipPercentages, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("Tip")
                }
                Section {
                    Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
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
