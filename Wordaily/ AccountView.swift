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
                .presentationDetents([.medium])
                .overlay(
                    VStack{
                        Text("Vocabulário")
                            .padding()
                            .padding(.leading, -190)
                            .foregroundColor(.appLimeTitle)
                            .font(.title)
                        HStack{
                            Spacer()
                            RectangleBox(text: "Favoritos", icon: "star.fill", toWhich: "favorites")
                            RectangleBox(text: "Pastas   ", icon: "folder.fill", toWhich: "teste")//{WordsView()}
                            Spacer()
                        }
                        HStack{
                            Spacer()
                            RectangleBox(text: "Criações", icon: "pencil.and.outline", toWhich: "teste")//{WordsView()}
                            RectangleBox(text: "Histórico", icon: "clock", toWhich: "teste")//{WordsView()}
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
