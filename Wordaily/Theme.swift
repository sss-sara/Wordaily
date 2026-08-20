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
    static let appDarkMoss = Color(red: 0.38, green: 0.41, blue: 0.33)
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
    var name: String? = nil
    var apparence: String
    @ViewBuilder var destinationPage: () -> Destination
    
    var body: some View{
        NavigationLink{
            //switch which {
            //case "saveFolder":
                //Text("o que vou fazer slk n tenho ideia")
            //case "favorites":
                //Test(text: "Favoritos", toIcon: icon)
                //destinationPage()
                    //.navigationBarBackButtonHidden(true)
            //default:
                destinationPage()
                    .navigationBarBackButtonHidden(true)
                //EmptyView()
                //.navigationBarBackButtonHidden(true)
            //}
        }label: {
            switch apparence{
            case "accountrectangle":
                AccountRectangleBox(text: name, toIcon: icon, toWhich: which)
            case "invisible":
                let VerSize = size ?? 25
                 Image(systemName: icon).font(.system(size: VerSize))
                 .foregroundColor(.appCremeIconsNTitle)
            default:
                EmptyView()
            }
        }
    }
}
struct AccountRectangleBox: View{
    var text: String? = nil
    var toIcon: String
    var toWhich: String
    var body: some View{
        ZStack{
        RoundedRectangle(cornerRadius: 20)
            .foregroundColor(.appCremeIconsNTitle)
            .frame(width: 170, height: 45)
            HStack{
                Image(systemName: toIcon).font(.system(size:30))
                    .foregroundColor(.appMoss)
                if text != nil{
                    Text(text ?? "empty")
                        .bold()
                        .foregroundColor(.appMoss)
                        .font(.title2)
                }
            }
        }
        //return IconNavigation(icon: toIcon, which: toWhich){WordsView()}

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
struct SearchBar: View{
    var body: some View{
        VStack{
            ZStack{
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 320, height: 30)
                    .foregroundColor(.appCremeIconsNTitle)
                HStack{
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.appMoss)
                        .padding(.trailing, 280)
                    Text("Buscar")
                        .foregroundColor(.appMoss)
                        .padding(.leading, -280)
                }
                .padding()
            }
            //.padding(.bottom, 750)
            //Spacer()
        }
    }
}

struct TermsRectangle: View{
    var hasDescription: Bool
    var body: some View{
        ZStack{
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 400, height: 70)
                .foregroundColor(.appBeigeBox)
            VStack{
                Text("Termo 1")
                    .foregroundColor(.appDarkMoss)
                    .padding(.trailing, 300)
                    HStack{
                        Spacer()
                        Text("(tipo) Descrição")
                            .foregroundColor(.appInfoText)
                        Spacer()
                        Spacer()
                        Spacer()
                        Image(systemName: "folder")
                            .foregroundColor(.appCremeIconsNTitle)
                        Image(systemName: "star.fill")
                            .foregroundColor(.appCremeIconsNTitle)
                        Spacer()
                    }
                
                Text("data")
                    .foregroundColor(.appInfoDescription)
                    .padding(.trailing, 320)
            }
        }
    }
}
struct FolderRectangle: View{
    var body: some View{
        ZStack{
            RoundedRectangle(cornerRadius: 30)
                .frame(width: 400, height: 80)
                .foregroundColor(.appBeigeBox)
            HStack{
                VStack{
                    
                    Text("Nome da pasta")
                        .foregroundColor(.appDarkMoss)
                        .padding(.top)
                    
                    Text("quantidade de termos")
                        .foregroundColor(.appInfoText)
                        .padding()
                }
                .padding(.trailing, 150)
            }
            HStack{
                Spacer()
                Image(systemName: "chevron.right").font(.system(size: 45))
                    .foregroundColor(.appMoss)
                    .padding(.trailing)
            }
        }
    }
}

struct Theme: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
