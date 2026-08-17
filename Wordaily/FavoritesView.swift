//
//  FavoritesView.swift
//  Palavra
//
//  favorites screen
//

import SwiftUI

struct FavoritesView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var searchText: String = ""
    @State private var words: [WordEntry] = MockData.sampleWords

    /// Número de linhas vazias extras para reproduzir o placeholder do design
    private let emptySlots = 3

    private var filteredWords: [WordEntry] {
        guard !searchText.isEmpty else { return words }
        return words.filter { $0.title.localizedCaseInsensitiveContains(searchText) }
    }

    var body: some View {
        ZStack {
            AppBackground()

            VStack(spacing: 20) {
                CloseHeader(title: "Favoritos") { dismiss() }

                SearchBar(text: $searchText)

                ScrollView {
                    LazyVStack(spacing: 10) {
                        ForEach(filteredWords) { word in
                            WordRowCard(
                                word: word,
                                onToggleFavorite: { toggleFavorite(word) },
                                onAddToFolder: { /* abrir seletor de pasta */ }
                            )
                        }

                        if searchText.isEmpty {
                            ForEach(0..<emptySlots, id: \.self) { _ in
                                EmptyRowCard()
                            }
                        }
                    }
                }
            }
            .padding(.horizontal, 24)
        }
        .navigationBarHidden(true)
    }

    private func toggleFavorite(_ word: WordEntry) {
        if let index = words.firstIndex(of: word) {
            words[index].isFavorite.toggle()
        }
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
    }
}
