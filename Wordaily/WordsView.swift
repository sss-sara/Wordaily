//
//  WordsView.swift
//  Wordaily
//
//  Created by Sara Melo on 17/08/26.
//

import SwiftUI

struct WordsView: View {
    @State private var showMenu: Bool = false
    @State private var angle: Bool = false
    var body: some View {
        NavigationStack{
            Color.appBackground
                .ignoresSafeArea()
                .overlay(
                    ZStack(alignment: .topLeading){
                        
                        IconButton(icon: "line.3.horizontal", which: "ClickMenu", changeShowMenu: $showMenu, degree: $angle)
                                .foregroundColor(.appCremeIconsNTitle)
                                .outlinedCircleIcon()
                                .rotationEffect(.degrees(angle ? 180 : 0))
                                .animation(
                                    .linear(duration: 0.3), value: angle
                                    )
                                .padding()
                            if showMenu{
                                VStack(alignment: .leading){
                                    HStack{
                                        Text("Menu")
                                            .foregroundColor(.appCremeIconsNTitle)
                                            .offset(x: 75, y: 25)
                                            .font(.title)
                                        Spacer()
                                    }
                                    HStack{
                                        IconNavigation(icon: "gearshape", size: 30){
                                            ContentView()
                                                
                                        }
                                        .offset(x: 7, y: 10)
                                        .padding()
                                        Text("Configurações")
                                            .foregroundColor(.appCremeIconsNTitle)
                                            .offset(x: -10, y: 10)
                                        Spacer()
                                    }
                                    HStack{
                                        IconNavigation(icon: "person.crop.circle", size: 30){
                                            ContentView()
                                                
                                        }
                                        .offset(x: 9, y: -30)
                                        .padding()
                                        Text("Perfil")
                                            .foregroundColor(.appCremeIconsNTitle)
                                            .offset(x: -7, y: -30)
                                        Spacer()
                                    }
                                }
                            }
                        VStack {
                            HStack{
                                Spacer()
                                IconNavigation(icon: "square.grid.2x2"){ContentView()}
                                    .outlinedCircleIcon()
                                    .padding()
                            }
                            Spacer()
                            Text("Palavra")
                                .foregroundColor(.appLimeTitle)
                                .font(.largeTitle)
                                .padding(1)
                            ZStack{
                                Rectangle()
                                    .fill(Color.appBeigeBox)
                                    .frame(width: 200, height: 35)
                                    .cornerRadius(25)
                                HStack{
                                    Text("pronúncia")
                                        .foregroundColor(.appDarkGreen)
                                    /*IconButton(icon: "speaker.wave.2.fill", which: "speaker",)
                                     .foregroundColor(.appDarkGreen)*/
                                }
                            }
                            Text("(tipo) Descrição")
                                .foregroundColor(.appMoss)
                            Spacer()
                            HStack{
                                IconNavigation(icon: "info"){ContentView()}
                                    .outlinedCircleIcon()
                                    .padding()
                                Spacer()
                                VStack{
                                    IconNavigation(icon: "folder"){ContentView()}
                                        .foregroundColor(.appCremeIconsNTitle)
                                        .padding(10)
                                    //IconButton(icon: "star")
                                    //  .foregroundColor(.appCremeIconsNTitle)
                                }
                                
                            }
                        }})
        }
    }
}

struct WordsView_Previews: PreviewProvider {
    static var previews: some View {
        WordsView()
    }
}
