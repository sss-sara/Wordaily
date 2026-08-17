//
//  WordRowCard.swift
//  Palavra
//
//  Card de palavra reutilizado nas telas de Favoritos e Pasta (Imagens 4 e 6)
//

import SwiftUI

struct WordRowCard: View {
    let word: WordEntry
    var showFolderButton: Bool = true
    var showStarButton: Bool = true
    var onToggleFavorite: (() -> Void)? = nil
    var onAddToFolder: (() -> Void)? = nil

    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 6) {
                Text(word.title)
                    .font(.system(size: 22, weight: .semibold, design: .rounded))
                    .foregroundColor(.black.opacity(0.75))

                (
                    Text("(\(word.type)) ")
                        .foregroundColor(.appMuted)
                    + Text(word.description)
                        .foregroundColor(.appMuted)
                )
                .font(.system(size: 16, weight: .regular, design: .rounded))

                Spacer(minLength: 12)

                Text(word.date)
                    .font(.system(size: 14, weight: .regular, design: .rounded))
                    .foregroundColor(.appMuted.opacity(0.8))
            }

            Spacer()

            VStack {
                Spacer()
                HStack(spacing: 14) {
                    if showFolderButton {
                        Button {
                            onAddToFolder?()
                        } label: {
                            Image(systemName: "folder")
                                .font(.system(size: 20))
                                .foregroundColor(.appCream)
                        }
                    }
                    if showStarButton {
                        Button {
                            onToggleFavorite?()
                        } label: {
                            Image(systemName: word.isFavorite ? "star.fill" : "star")
                                .font(.system(size: 22))
                                .foregroundColor(.appCream)
                        }
                    }
                }
            }
        }
        .padding(.horizontal, 18)
        .padding(.vertical, 16)
        .frame(minHeight: 100)
        .background(RoundedRectangle(cornerRadius: 18).fill(Color.appCard))
    }
}

/// Card vazio (placeholder) usado para preencher listas, como no design original
struct EmptyRowCard: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 18)
            .fill(Color.appCardLight)
            .frame(minHeight: 100)
            .overlay(
                HStack {
                    Spacer()
                    VStack {
                        Spacer()
                        HStack(spacing: 14) {
                            Image(systemName: "folder")
                            Image(systemName: "star.fill")
                        }
                        .foregroundColor(.appCream)
                    }
                }
                .padding(18)
            )
    }
}
