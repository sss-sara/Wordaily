//
//  FoldersView.swift
//  Wordaily
//
//  Folders screen
//

import SwiftUI

struct FoldersView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var searchText: String = ""
    @State private var folders: [WordFolder] = MockData.sampleFolders
    @State private var showNewFolderAlert = false
    @State private var newFolderName = ""

    private let emptySlots = 4

    private var filteredFolders: [WordFolder] {
        guard !searchText.isEmpty else { return folders }
        return folders.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
    }

    var body: some View {
        ZStack {
            AppBackground()

            VStack(spacing: 20) {
                CloseHeader(title: "Pastas") { dismiss() }

                SearchBar(text: $searchText)

                ScrollView {
                    LazyVStack(spacing: 10) {
                        ForEach(filteredFolders) { folder in
                            NavigationLink {
                                FolderDetailView(folder: folder)
                            } label: {
                                FolderRow(folder: folder)
                            }
                        }

                        if searchText.isEmpty {
                            ForEach(0..<emptySlots, id: \.self) { _ in
                                EmptyRowCard()
                                    .frame(minHeight: 70)
                            }
                        }
                    }
                }

                Button {
                    showNewFolderAlert = true
                } label: {
                    Text("Nova pasta")
                        .italic()
                        .font(.system(size: 18, weight: .medium, design: .rounded))
                        .foregroundColor(.appMuted)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 16)
                        .background(Capsule().fill(Color.appCard))
                }
                .padding(.bottom, 24)
            }
            .padding(.horizontal, 24)
        }
        .navigationBarHidden(true)
        .alert("Nova pasta", isPresented: $showNewFolderAlert) {
            TextField("Nome da pasta", text: $newFolderName)
            Button("Cancelar", role: .cancel) { newFolderName = "" }
            Button("Criar") {
                guard !newFolderName.isEmpty else { return }
                folders.append(WordFolder(name: newFolderName))
                newFolderName = ""
            }
        }
    }
}

private struct FolderRow: View {
    let folder: WordFolder

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 6) {
                Text(folder.name)
                    .font(.system(size: 20, weight: .semibold, design: .rounded))
                    .foregroundColor(.black.opacity(0.75))
                Text("\(folder.termCount) termos")
                    .font(.system(size: 14, weight: .regular, design: .rounded))
                    .foregroundColor(.appMuted)
            }
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundColor(.appMuted)
        }
        .padding(.horizontal, 18)
        .padding(.vertical, 18)
        .background(RoundedRectangle(cornerRadius: 18).fill(Color.appCard))
    }
}

struct FoldersView_Previews: PreviewProvider {
    static var previews: some View {
        FoldersView()
    }
}
