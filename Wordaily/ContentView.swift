//
//  ContentView.swift
//  Wordaily
//
//  Created by Sara Melo on 16/08/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack{
            Color.appBackground
                .ignoresSafeArea()
                .overlay(
                    VStack {
                        HStack{
                            IconButton(icon: "line.3.horizontal")
                                .outlinedCircleIcon()
                                .padding()
                            Spacer()
                            IconButton(icon: "square.grid.2x2")
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
                                IconButton(icon: "speaker.wave.2.fill")
                                    .foregroundColor(.appDarkGreen)
                            }
                        }
                        Text("(tipo) Descrição")
                            .foregroundColor(.appMoss)
                        Spacer()
                        HStack{
                            IconButton(icon: "info")
                                .outlinedCircleIcon()
                                .padding()
                            Spacer()
                            VStack{
                                IconButton(icon: "folder")
                                    .foregroundColor(.appCremeIcons)
                                    .padding(10)
                                IconButton(icon: "star")
                                    .foregroundColor(.appCremeIcons)
                            }
                                
                        }
                    })
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
