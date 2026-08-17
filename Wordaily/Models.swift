//
//  Models.swift
//  Wordaily
//

import Foundation

struct WordEntry: Identifiable, Hashable {
    let id = UUID()
    var title: String
    var type: String          // ex: "substantivo", "verbo"
    var description: String
    var date: String
    var isFavorite: Bool = false
}

struct WordFolder: Identifiable, Hashable {
    let id = UUID()
    var name: String
    var words: [WordEntry] = []

    var termCount: Int { words.count }
}

// MARK: - Dados de exemplo (mock) para preencher os previews/telas

enum MockData {
    static let sampleWord = WordEntry(
        title: "Palavra",
        type: "tipo",
        description: "Descrição",
        date: "16/08/2026"
    )

    static let sampleWords: [WordEntry] = [
        WordEntry(title: "GitHub", type: "tipo", description: "Descrição", date: "data", isFavorite: true),
        WordEntry(title: "GitHub", type: "tipo", description: "Descrição", date: "data", isFavorite: true),
        WordEntry(title: "GitHub", type: "tipo", description: "Descrição", date: "data", isFavorite: true)
    ]

    static let sampleFolders: [WordFolder] = [
        WordFolder(name: "Nome da pasta", words: sampleWords)
    ]
}
