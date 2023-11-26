//
//  ContentView.swift
//  WeSplit
//
//  Created by Praveen rathi on 01/09/1945 Saka.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 10
    @State private var str = "Name"
    @FocusState private var amountIsFocused:Bool
    let tipPercentages = [0,5,10,20,25]
    var totalAmount: Double {
        let tipSelection = Double(tipPercentage)
        let tipAmount = (checkAmount * tipSelection)/100
        let totalAmount = tipAmount + checkAmount
        return totalAmount
    }
    var totalPerPerson:Double{
        let peopleCount = Double(numberOfPeople)
        let amountPerPerson = totalAmount/peopleCount
        return amountPerPerson
    }
//    @State private var tapCount:Int = 0
//    let students = ["Harry","Hermoine","Ron","Draco"]
//    @State private var selectedStudent = "Ron"
    
    
    var body: some View {
        
        NavigationStack{
            Form{
                Section{
                    TextField("Amount", value: $checkAmount,format:.currency(code:Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    
                    Picker("Number of People", selection: $numberOfPeople) {
                        ForEach(2..<100,id:\.self) {
                            Text("\($0) people")
                        }
                    }
//                    .pickerStyle(.navigationLink)
                }
                Section("How much you want to tip?"){
//                    Picker("Tip Percentage",selection: $tipPercentage){
//                        ForEach(tipPercentages,id:\.self){
//                            Text($0,format:.percent)
//                        }
//                    }
//                    .pickerStyle(.segmented)
                    
                    Picker("Tip Percentage",selection: $tipPercentage){
                        ForEach(0..<101,id:\.self){
                            Text($0,format:.percent)
                        }
                    }
                    .pickerStyle(.navigationLink)
                }
                Section("Total Amount"){
                    Text(totalAmount,format:.currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
                Section("Amount per person"){
                    Text(totalPerPerson,format:.currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
            }
            .navigationTitle("WeSplit")
            .toolbar{
                if amountIsFocused{
                    Button("Done"){
                        amountIsFocused = false
                    }
                }
            }
        }
        
        
        
//        Form{
//            Picker("Select Your Student", selection: $selectedStudent) {
//                ForEach(students, id: \.self) {
//                    Text($0)
//                }
//            }
//            Text(selectedStudent)
//        }
//        Button(action: {
//            tapCount+=1
//        }, label: {
//            Text("Count: \(tapCount)")
//                .font(.title2)
//        })
        
//        NavigationStack{
//            Form{
//                Section{
//                    Text("Hello")
//                    Text("Hello")
//                }
//                Section{
//                    Text("Hello")
//                    Text("Hello")
//                    Text("Hello")
//                    Text("Hello")
//                }
//            }
//            .navigationTitle("SwiftUI")
//            .navigationBarTitleDisplayMode(.automatic)
//        }
    }
}

#Preview {
    ContentView()
}
