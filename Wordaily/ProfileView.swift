//
//  ProfileView.swift
//  Wordaily
//
//  Account screen
//

import SwiftUI

struct ProfileView: View {
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        NavigationStack {
            ZStack {
                AppBackground()

                ScrollView {
                    VStack(alignment: .leading, spacing: 32) {
                        // Cabeçalho com X + título
                        HStack(spacing: 16) {
                            Button {
                                dismiss()
                            } label: {
                                Image(systemName: "xmark")
                                    .font(.system(size: 22, weight: .light))
                                    .foregroundColor(.appCream)
                            }
                            Text("Perfil")
                                .font(.system(size: 34, weight: .semibold, design: .rounded))
                                .foregroundColor(.appCream)
                        }
                        .padding(.top, 16)

                        // Seção Vocabulário
                        VStack(alignment: .leading, spacing: 16) {
                            Text("Vocabulário")
                                .font(.system(size: 30, weight: .regular, design: .rounded))
                                .foregroundColor(.appTitleGreen)

                            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 12) {
                                NavigationLink {
                                    FavoritesView()
                                } label: {
                                    PillButton(icon: "star.fill", title: "Favoritos")
                                }

                                NavigationLink {
                                    FoldersView()
                                } label: {
                                    PillButton(icon: "folder.fill", title: "Pastas")
                                }

                                NavigationLink {
                                    Text("Criações")
                                } label: {
                                    PillButton(icon: "square.and.pencil", title: "Criações")
                                }

                                NavigationLink {
                                    Text("Histórico")
                                } label: {
                                    PillButton(icon: "eye", title: "Histórico")
                                }
                            }
                        }

                        // Seção Personalização
                        VStack(alignment: .leading, spacing: 16) {
                            Text("Personalização")
                                .font(.system(size: 30, weight: .regular, design: .rounded))
                                .foregroundColor(.appTitleGreen)

                            HStack(spacing: 16) {
                                NavigationLink {
                                    Text("Categorias seguidas")
                                } label: {
                                    SquareCard(icon: "book.fill", title: "Categorias\nseguidas")
                                }

                                NavigationLink {
                                    Text("Notificações")
                                } label: {
                                    SquareCard(icon: "bell.fill", title: "Notificações")
                                }
                            }
                        }
                    }
                    .padding(.horizontal, 24)
                }
            }
            .navigationBarHidden(true)
        }
    }
}

private struct PillButton: View {
    let icon: String
    let title: String

    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(.appMuted)
            Text(title)
                .font(.system(size: 18, weight: .medium, design: .rounded))
                .foregroundColor(.appMuted)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 16)
        .background(RoundedRectangle(cornerRadius: 16).fill(Color.appCard))
    }
}

private struct SquareCard: View {
    let icon: String
    let title: String

    var body: some View {
        VStack(spacing: 12) {
            Image(systemName: icon)
                .font(.system(size: 42))
                .foregroundColor(.appMuted)
            Text(title)
                .font(.system(size: 18, weight: .medium, design: .rounded))
                .foregroundColor(.appMuted)
                .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity, minHeight: 180)
        .background(RoundedRectangle(cornerRadius: 24).fill(Color.appCard))
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
