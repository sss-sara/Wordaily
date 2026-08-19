//
//  Theme.swift
//  Wordaily
//
//  Created by Sara Melo on 16/08/26.
//

import SwiftUI

extension Color {
    static let appBackground = Color(red: 0.29, green: 0.41, blue: 0.34)
    static let appCremeIconsNTitle = Color(red: 0.96, green: 0.91, blue: 0.81)
    static let appLimeTitle = Color(red: 0.72, green: 0.76, blue: 0.63)
    static let appBeigeBox = Color(red: 0.84, green: 0.78, blue: 0.68)
    static let appDarkGreen = Color(red: 0.37, green: 0.34, blue: 0.27)
    static let appMoss = Color(red: 0.70, green: 0.74, blue: 0.63)
}

struct OutlinedCircleIcon: ViewModifier{
    var size: CGFloat = 56
    func body(content: Content) -> some View{
        content
            .frame(width: size, height: size)
            .overlay(
                Circle().stroke(Color.appCremeIconsNTitle, lineWidth: 1.5)
            )
        
    }
}

extension View {
    func outlinedCircleIcon(size: CGFloat = 50) -> some View {
        modifier(OutlinedCircleIcon(size: size))
    }
}

struct IconNavigation<Destination: View>: View{
    var icon: String
    var size: CGFloat? = nil
    var which: String
    @ViewBuilder var destinationPage: () -> Destination
    
    var body: some View{
        NavigationLink{
            destinationPage()
            switch which {
            case "saveFolder":
                Text("o que vou fazer slk n tenho ideia")
            default:
                Text("oi")
            }
        }label: {
            let VerSize = size ?? 25
            Image(systemName: icon).font(.system(size: VerSize))
                .foregroundColor(.appCremeIconsNTitle)
        }
    }
}


struct Theme: PreviewProvider {
    static var previews: some View {
        WordsView()
    }
}
