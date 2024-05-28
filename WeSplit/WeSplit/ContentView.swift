//
//  ContentView.swift
//  WeSplit
//
//  Created by Tanish Parmar on 20/03/24.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmt = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    @FocusState private var amountIsFocused: Bool
    
    let tipPercentages = [10,15,20,25]
    var totalPerPerson: Double{
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentage)
        let grandTotal = checkAmt / 100 * tipSelection
        let amountPerPerson = grandTotal / peopleCount
        return amountPerPerson
    }
    

    var body: some View {
        NavigationStack{
            Form{
                Section{
                    TextField("Amount",value: $checkAmt,format: .currency(code: Locale.current.currency?.identifier ?? "INR"))
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    
                    Picker("Number of People", selection: $numberOfPeople){
                        ForEach(2..<100){
                            Text("\($0) people")
                        }
                    }.pickerStyle(.menu)
                }
                Section("How much do yo want to tip?"){
                    Picker("Tip Percentage",selection: $tipPercentage){
                        ForEach(tipPercentages,id: \.self){
                            Text($0,format: .percent)
                        }
                    }.pickerStyle(.segmented)
                }
                Section{
                    Text(totalPerPerson,format: .currency(code: Locale.current.currency?.identifier ?? "INR"))
                }
            }.navigationTitle("We Split")
            .toolbar {
                if amountIsFocused {
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
