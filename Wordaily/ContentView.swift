//
//  ContentView.swift
//  Wordaily
//
//  Created by Sara Melo on 16/08/26.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        Color.appBackground
            .ignoresSafeArea()
            .presentationDetents([.medium])
            .overlay(
                Text("calma ai")
                    
            )
        
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
