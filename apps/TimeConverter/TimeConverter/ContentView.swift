//
//  ContentView.swift
//  TimeConverter
//
//  Created by Andre Veltens on 22.11.24.
//

import SwiftUI

struct ContentView: View {
    @State private var currentTime: Int = 2
    @State private var currentTimeFormat: TimeFormat = .hours
    @State private var targetTimeFormat: TimeFormat = .minutes
    
    @FocusState private var inputIsFocused: Bool
    
    enum TimeFormat: String, CaseIterable {
        case weeks = "Weeks"
        case days = "Days"
        case hours = "Hours"
        case minutes = "Minutes"
        case seconds = "Seconds"
        case milliseconds = "Milliseconds"
    }
    
    private var result: Double {
        if currentTimeFormat == targetTimeFormat {
            return Double(currentTime)
        }
        
        var baseValue: Double = Double(currentTime)
        
        switch currentTimeFormat {
        case .weeks:
            baseValue *= 7
            fallthrough
        case .days:
            baseValue *= 24
            fallthrough
        case .hours:
            baseValue *= 60
            fallthrough
        case .minutes:
            baseValue *= 60
            fallthrough
        case .seconds:
            baseValue *= 1000
            fallthrough
        case .milliseconds:
            break
        }
        
        switch targetTimeFormat {
        case .weeks:
            baseValue /= 7
            fallthrough
        case .days:
            baseValue /= 24
            fallthrough
        case .hours:
            baseValue /= 60
            fallthrough
        case .minutes:
            baseValue /= 60
            fallthrough
        case .seconds:
            baseValue /= 1000
            fallthrough
        case .milliseconds:
            break
        }
        
        return baseValue
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Convert") {
                    VStack {
                        HStack {
                            TextField("Time", value: $currentTime, format: .number)
                                .keyboardType(.numberPad)
                                .focused($inputIsFocused)
                            Picker("", selection: $currentTimeFormat) {
                                ForEach(TimeFormat.allCases, id: \.self) { format in
                                    Text(format.rawValue).tag(format)
                                }
                            }
                            .pickerStyle(.menu)
                        }
                        HStack {
                            Text("into")
                            Picker("", selection: $targetTimeFormat) {
                                ForEach(TimeFormat.allCases, id: \.self) { format in
                                    Text(format.rawValue).tag(format)
                                }
                            }
                            .pickerStyle(.menu)
                            
                        }
                    }
                }
                Section("Result") {
                    HStack {
                        Text(result, format: .number)
                        Text("\(targetTimeFormat.rawValue)")
                    }
                }
            }
            .navigationTitle("TimeConverter")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ContentView()
}

#Preview {
    ContentView()
}
