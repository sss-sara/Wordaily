//
//  FoldersView.swift
//  Wordaily
//
//  Created by Sara Melo on 20/08/26.
//

import SwiftUI

struct FoldersView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Color.appBackground
            .ignoresSafeArea()
            .overlay(
                VStack{
                    SearchBar()
                    FolderRectangle()
                    FolderRectangle()
                    Spacer()
                }
        
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading) {
                    Button{
                        dismiss()
                    }label:{
                        CustomizedBackBar(pageName: "Pastas")
                        
                    }
                }
            }
        )
    }
}

struct FoldersView_Previews: PreviewProvider {
    static var previews: some View {
        FoldersView()
    }
}
