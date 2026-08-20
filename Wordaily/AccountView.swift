//
//  PerfilView.swift
//  Wordaily
//
//  Created by Sara Melo on 19/08/26.
//

import SwiftUI

struct AccountView: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationStack{
            Color.appBackground
                .ignoresSafeArea()
                .overlay(
                    VStack{
                        Text("Vocabulário")
                            .padding()
                            .padding(.leading, -190)
                            .foregroundColor(.appLimeTitle)
                            .font(.title)
                        HStack{
                            Spacer()
                            IconNavigation(icon: "star.fill", which: "favorites", name: "Favoritos", apparence: "accountrectangle"){FavoritesView()}
                            IconNavigation(icon: "folder.fill", which: "folders", name: "Pastas   ", apparence: "accountrectangle"){WordsView()}
                            Spacer()
                        }
                        HStack{
                            Spacer()
                            IconNavigation(icon: "pencil.and.outline", which: "creations", name: "Criações", apparence: "accountrectangle"){WordsView()}
                            IconNavigation(icon: "clock", which: "history", name: "Histórico", apparence: "accountrectangle"){WordsView()}
                            Spacer()
                        }
                        Text("Personalização")
                            .foregroundColor(.appLimeTitle)
                            .font(.title)
                            .padding(.top, 5)
                            .padding(.leading, -160)
                        HStack{
                            Spacer()
                            ZStack{
                                RoundedRectangle(cornerRadius: 30)
                                    .foregroundColor(.appCremeIconsNTitle)
                                    .frame(width: 170, height: 200)
                                VStack{
                                    Image(systemName: "a.book.closed").font(.system(size: 110))
                                        .foregroundColor(.appMoss)
                                    Text("Categorias\nseguidas")
                                        .foregroundColor(.appMoss)
                                        .font(.title3)
                                }
                            }
                            Spacer()
                            ZStack{
                                RoundedRectangle(cornerRadius: 30)
                                    .foregroundColor(.appCremeIconsNTitle)
                                    .frame(width: 170, height: 200)
                                VStack{
                                    Image(systemName: "bell.badge").font(.system(size: 110))
                                        .foregroundColor(.appMoss)
                                    Text("Notificações")
                                        .foregroundColor(.appMoss)
                                        .font(.title3)
                                }
                            }
                            Spacer()
                        }
                        Spacer()
                        
                    }
                        .toolbar{
                            ToolbarItem(placement: .navigationBarLeading) {
                                Button{
                                    dismiss()
                                }label:{
                                    CustomizedBackBar(pageName: "Perfil")
                                    
                                }
                            }
                        }
                        
                    
                )
        }
    }
}

struct PerfilView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
