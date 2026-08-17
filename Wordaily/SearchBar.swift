//
//  SearchBar.swift
//  Palavra
//

import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    var placeholder: String = "Buscar"

    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.appMuted)
            TextField(placeholder, text: $text)
                .foregroundColor(.appMuted)
        }
        .padding(.horizontal, 18)
        .padding(.vertical, 14)
        .background(Capsule().fill(Color.appCard))
    }
}

/// Cabeçalho padrão com X para fechar + título, usado em várias telas
struct CloseHeader: View {
    let title: String
    var trailing: AnyView? = nil
    var onClose: () -> Void

    var body: some View {
        HStack(spacing: 16) {
            Button(action: onClose) {
                Image(systemName: "xmark")
                    .font(.system(size: 22, weight: .light))
                    .foregroundColor(.appCream)
            }
            Text(title)
                .font(.system(size: 34, weight: .semibold, design: .rounded))
                .foregroundColor(.appCream)

            Spacer()

            if let trailing {
                trailing
            }
        }
        .padding(.top, 16)
    }
}
