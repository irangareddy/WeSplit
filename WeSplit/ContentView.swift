//
//  ContentView.swift
//  WeSplit
//
//  Created by RANGA REDDY NUKALA on 17/08/20.
//

import SwiftUI

struct ContentView: View {
    
    @State private var checkAmount = ""
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 2
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var eachShare: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let amount = Double(checkAmount) ?? 0
        let tipSelection = Double(tipPercentages[tipPercentage])
        if tipSelection != 0 {
            let tipValue  = amount / (100 * tipSelection)
            let grandTotal = amount + tipValue
            return grandTotal / peopleCount
        }
        return amount / peopleCount
    }
    
    var body: some View {
        
        NavigationView {
            Form {
                Section() {
                    TextField("Enter the Amount", text: $checkAmount)
                        .keyboardType(.decimalPad)
                    
                    
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2..<100){
                            Text("\($0) people")
                        }
                    }
                    
                   
                }
                
                Section(header: Text("How much tip do you want to leave?")) {
                    Picker("Tip Percentage", selection: $tipPercentage) {
                        ForEach(0..<tipPercentages.count){
                            Text("\(tipPercentages[$0])%")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Each Share")) {
                    Text("\(eachShare,specifier: "%.2f")")
                }
                

            }.navigationTitle("WeSplit")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
