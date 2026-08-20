//
//  FavoritesView.swift
//  Wordaily
//
//  Created by Sara Melo on 20/08/26.
//

import SwiftUI

struct FavoritesView: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        //NavigationLink{
            Color.appBackground
                .ignoresSafeArea()
                .overlay(
                    VStack{
                        SearchBar()
                            .padding()
                        //video da menina de cabelo assimetrico mostra como
                        //adicionar conforme a quantidade de dados
                        TermsRectangle(hasDescription: true)
                        TermsRectangle(hasDescription: true)
                        Spacer()
                        
                            /*.toolbar{
                                ToolbarItem(placement: .navigationBarLeading) {
                                    Button{
                                        dismiss()
                                    }label:{
                                        CustomizedBackBar(pageName: "Favoritos")
                                        
                                    }
                                }
                            }*/
                    }
                        .toolbar{
                            ToolbarItem(placement: .navigationBarLeading) {
                                Button{
                                    dismiss()
                                }label:{
                                    CustomizedBackBar(pageName: "Favoritos")
                                    
                                }
                            }
                        }
                )
        //}
        
    }
    
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
    }
}
