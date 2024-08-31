//
//  ContentView.swift
//  RedBlackTree
//
//  Created by 张炫阳 on 2024/8/31.
//

import SwiftUI

struct ContentView: View {
    
    var gameModel = GameModel.shared
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .onAppear(perform: {
            
        })
    }
}

#Preview {
    ContentView()
}
