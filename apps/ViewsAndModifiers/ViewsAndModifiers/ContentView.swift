//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Andre Veltens on 28.11.24.
//

import SwiftUI

struct CustomTitle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title.bold())
            .foregroundColor(.blue)
    }
}

extension View {
    public func customTitle() -> some View {
        self.modifier(CustomTitle())
    }
}

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
                .customTitle()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
