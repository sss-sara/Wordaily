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
    static let appInfoText = Color(red: 0.50, green: 0.57, blue: 0.52)
    static let appInfoDescription = Color(red: 0.69, green: 0.76, blue: 0.72)
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
                .navigationBarBackButtonHidden(true)
            /*
            switch which {
            case "saveFolder":
                Text("o que vou fazer slk n tenho ideia")
            //case "account":
                
            default:
                    destinationPage()
                        .navigationBarBackButtonHidden(true)
                
            }*/
        }label: {
            let VerSize = size ?? 25
            Image(systemName: icon).font(.system(size: VerSize))
                .foregroundColor(.appCremeIconsNTitle)
        }
    }
}
//<Destination: View>
struct RectangleBox: View{
    var text: String
    var icon: String
    var toWhich: String
    //@ViewBuilder var destinationPage: () -> Destination
    var body: some View{
        NavigationLink{
            IconNavigation(icon: icon, which: toWhich){WordsView()}
        }label: {
            ZStack{
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(.appCremeIconsNTitle)
                .frame(width: 170, height: 45)
                HStack{
                    Image(systemName: icon).font(.system(size:30))
                        .foregroundColor(.appMoss)
                    Text(text)
                        .bold()
                        .foregroundColor(.appMoss)
                        .font(.title2)
                }
            }
        }
        
    }
}

//funciona, mas tirou o drag para voltar. Criar gesture com dismiss.
struct CustomizedBackBar: View{
    var pageName: String
    var body: some View{
            HStack{
                Image(systemName: "chevron.backward").font(.system(size: 25))
                    .foregroundColor(.appCremeIconsNTitle)
                Text(pageName)
                    .foregroundColor(.appCremeIconsNTitle)
                    .font(.title)
                    .padding(.leading, 0)
            }
            .frame(maxWidth: .infinity)
        
    }
}

struct Theme: PreviewProvider {
    static var previews: some View {
        WordsView()
    }
}
