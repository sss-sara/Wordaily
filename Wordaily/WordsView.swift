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
                                    IconNavigation(icon: "gearshape", size: 30, which: "configuration", apparence: "invisible"){
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
                                    IconNavigation(icon: "person.crop.circle", size: 30, which: "account", apparence: "invisible"){
                                        AccountView()
                                        
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
                                IconNavigation(icon: "square.grid.2x2", which: "categories", apparence: "invisible"){ContentView()}
                                    .outlinedCircleIcon()
                                    .padding()
                            }
                            Spacer()
                            Text("Palavra")
                                .foregroundColor(.appLimeTitle)
                                .font(.largeTitle)
                                .padding(1)
                            ZStack{
                                RoundedRectangle(cornerRadius: 25)
                                    .fill(Color.appBeigeBox)
                                    .frame(width: 200, height: 35)
                                HStack{
                                    Text("pronúncia")
                                        .font(.subheadline)
                                        .foregroundColor(.appDarkGreen)
                                    Button{
                                        
                                    }label: {
                                        Image(systemName: "speaker.wave.2.fill").font(.system(size: 25))
                                            .foregroundColor(.appDarkGreen)
                                    }
                                }
                            }
                            Text("(tipo) Descrição")
                                .font(.headline)
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
                                            VStack(spacing: 0){
                                                RoundedRectangle(cornerRadius: 30)
                                                    .fill(Color.appCremeIconsNTitle)
                                                    .padding(3)
                                                    .frame(width: 100, height: 10)
                                                Text("Palavra")
                                                    .font(.largeTitle)
                                                    .foregroundColor(.appMoss)
                                                    .padding(.bottom, 0)
                                                    .padding(.top, 5)
                                                    
                                                ZStack{
                                                    Rectangle()
                                                        .fill(Color.appBeigeBox)
                                                        .frame(width: 150, height: 25)
                                                        .cornerRadius(25)
                                                        .padding(.top, 10)
                                                    HStack(spacing: 0){
                                                        Text("pronúncia")
                                                            .foregroundColor(.appDarkGreen)
                                                            .font(.caption)
                                                            .padding(.top, 10)
                                                        Button{
                                                            
                                                        }label: {
                                                            Image(systemName: "speaker.wave.2.fill").font(.system(size: 25))
                                                                .foregroundColor(.appDarkGreen)
                                                                .padding(.top, 10)
                                                        }
                                                    }
                                                    //Spacer()
                                                }
                                                Text("(tipo) Descrição")
                                                    .font(.body)
                                                    .foregroundColor(.appMoss)
                                                    .padding(.top, 10)
                                                Spacer()
                                                //se der erro de extra arguments, coloque o conteúdo de dentro da sheet em uma struct e apenas chame-a
                                                Text("Exemplos")
                                                    .font(.body)
                                                    .bold()
                                                    .frame(maxWidth: .infinity, alignment: .leading)
                                                    .foregroundColor(.appInfoText)
                                                    .padding(10)
                                                    .padding(.bottom, -15)
                                                //fazer uma struct quando adicionar API
                                                //aqui chamarei uma função para verificar quantos exemplos tem
                                                //nessa função terá um laço de repetição com as características de fonte, cor etc
                                                Text("1.")
                                                    .font(.callout)
                                                    .foregroundColor(.appInfoDescription)
                                                    .frame(maxWidth: .infinity, alignment: .leading)
                                                    .padding(15)
                                                Text("Sinônimos")
                                                    .font(.body)
                                                    .bold()
                                                    .frame(maxWidth: .infinity, alignment: .leading)
                                                    .foregroundColor(.appInfoText)
                                                    .padding(10)
                                                    .padding(.bottom, -15)
                                                
                                                //1., 2. ...igual em exemplos
                                                
                                                //fazer uma struct quando adicionar API
                                                //aqui chamarei uma função para verificar quantos exemplos tem
                                                //nessa função terá um laço de repetição com as características de fonte, cor etc
                                                Text("Origem")
                                                    .font(.body)
                                                    .bold()
                                                    .frame(maxWidth: .infinity, alignment: .leading)
                                                    .foregroundColor(.appInfoText)
                                                    .padding(10)
                                                    .padding(.bottom, -15)
                                                Spacer()
                                            }
                                        )
                                        .presentationDetents([.medium, .large, .fraction(0.75)])
                                        .presentationDragIndicator(.hidden)
                                }
                                
                            
                        
                                Spacer()
                                VStack{
                                    Button{
                                        switch addFolder{
                                        case false:
                                            addFolder = true
                                            //ir para a pagina de pasta
                                            
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
