//
//  WordsView.swift
//  Wordaily
//
//  Created by Sara Melo on 17/08/26.
//

import SwiftUI

struct WordsView: View {
    @State private var showInfo: Bool = false
    @State private var angle: Bool = false
    @State private var addFavorites: Bool = false
    @State private var addFolder: Bool = false
    //@State private var animationText: Bool = false
    var body: some View {
        NavigationStack{
            Color.appBackground
                .ignoresSafeArea()
                .overlay(
                    ZStack(alignment: .topLeading){
                        if angle{
                            //ZStack(){
                            //HStack{
                            Text("Menu")
                                .transition(.opacity)
                            //.transition(.move(edge: .leading))
                                .foregroundColor(.appCremeIconsNTitle)
                                .offset(x: 75, y: 25)
                                .font(.title)
                            Spacer()
                            //}
                            VStack{
                                HStack{
                                    IconNavigation(icon: "gearshape", size: 30, which: "configuration"){
                                        ContentView()
                                        
                                    }
                                    .offset(x: 6, y: 60)
                                    .padding()
                                    Text("Configurações")
                                        .foregroundColor(.appCremeIconsNTitle)
                                        .offset(x: -10, y: 60)
                                    Spacer()
                                }
                                HStack{
                                    IconNavigation(icon: "person.crop.circle", size: 30, which: "account"){
                                        ContentView()
                                        
                                    }
                                    .offset(x: 7, y: 20)
                                    .padding()
                                    Text("Perfil")
                                        .foregroundColor(.appCremeIconsNTitle)
                                        .offset(x: -7, y: 20)
                                    Spacer()
                                }
                            }//}
                        }
                        
                        Button{
                            withAnimation{
                                angle.toggle()
                            }
                        }label: {
                            Image(systemName: "line.3.horizontal").font(.system(size: 25))
                                .outlinedCircleIcon()
                                .foregroundColor(.appCremeIconsNTitle)
                                .rotationEffect(.degrees(angle ? 180 : 0))
                                .padding()
                        }
                        VStack {
                            HStack{
                                Spacer()
                                IconNavigation(icon: "square.grid.2x2", which: "categories"){ContentView()}
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
                                    Button{
                                        
                                    }label: {
                                        Image(systemName: "speaker.wave.2.fill").font(.system(size: 25))
                                            .foregroundColor(.appDarkGreen)
                                    }
                                }
                            }
                            Text("(tipo) Descrição")
                                .foregroundColor(.appMoss)
                            Spacer()
                            HStack{
                                Button{
                                    showInfo.toggle()
                                }label: {
                                    Image(systemName: "info").font(.system(size: 25))
                                        .foregroundColor(.appCremeIconsNTitle)
                                        .outlinedCircleIcon()
                                        .padding()
                                }
                                .sheet(isPresented: $showInfo) {
                                    Color.appBackground
                                        .ignoresSafeArea()
                                        .overlay(
                                            VStack{
                                                Text("Palavra")
                                                    .font(.largeTitle)
                                                    .foregroundColor(.appMoss)
                                                    .padding()
                                                ZStack{
                                                    Rectangle()
                                                        .fill(Color.appBeigeBox)
                                                        .frame(width: 150, height: 25)
                                                        .cornerRadius(25)
                                                        .padding()
                                                    HStack{
                                                        Text("pronúncia")
                                                            .foregroundColor(.appDarkGreen)
                                                            .padding()
                                                        Button{
                                                            
                                                        }label: {
                                                            Image(systemName: "speaker.wave.2.fill").font(.system(size: 25))
                                                                .foregroundColor(.appDarkGreen)
                                                        }
                                                    }
                                                    Spacer()
                                                }
                                                Spacer()
                                            }
                                                .presentationDetents([.medium, .large])
                                        )}
                            
                        
                                Spacer()
                                VStack{
                                    Button{
                                        switch addFolder{
                                        case false:
                                            addFolder = true
                                            
                                        case true:
                                            addFolder = false
                                        }
                                    }label: {
                                        Image(systemName: addFolder ? "folder.fill" : "folder").font(.system(size: 25))
                                            .foregroundColor(.appCremeIconsNTitle)
                                            .padding(2)
                                    }
            
                                    Button{
                                        withAnimation{
                                            addFavorites.toggle()
                                        }
                                    }label:{
                                        Image(systemName: addFavorites ? "star.fill" : "star").font(.system(size: 25))
                                            .foregroundColor(.appCremeIconsNTitle)
                                            
                                    }
                                }
                                .padding()
                                
                            }
                        }} )
        }
        
    }
}

struct WordsView_Previews: PreviewProvider {
    static var previews: some View {
        WordsView()
    }
}
