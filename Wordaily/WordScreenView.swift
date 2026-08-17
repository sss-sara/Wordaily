//
//  WordScreenView.swift
//  Wordaily
//
//  main page
//

import SwiftUI

struct WordScreenView: View {
    @State private var word: WordEntry = MockData.sampleWord
    @State private var showMenu = false
    @State private var showRandomOptions = false
    @State private var isFavorited = false

    var body: some View {
        NavigationStack {
            ZStack {
                AppBackground()

                VStack {
                    // Barra superior
                    HStack {
                        Button {
                            showMenu = true
                        } label: {
                            Image(systemName: "line.horizontal.3")
                                .font(.system(size: 22, weight: .medium))
                        }
                        .outlinedCircleIcon()

                        Spacer()

                        Button {
                            showRandomOptions = true
                        } label: {
                            // grade 2x2 estilo "formas" do design original
                            VStack(spacing: 4) {
                                HStack(spacing: 4) {
                                    Circle().frame(width: 10, height: 10)
                                    RoundedRectangle(cornerRadius: 2).frame(width: 10, height: 10)
                                }
                                HStack(spacing: 4) {
                                    RoundedRectangle(cornerRadius: 2).frame(width: 10, height: 10)
                                    Diamond().frame(width: 10, height: 10)
                                }
                            }
                            .foregroundColor(.appCream)
                        }
                        .outlinedCircleIcon()
                    }
                    .padding(.horizontal, 24)
                    .padding(.top, 16)

                    Spacer()

                    // Conteúdo central: palavra, pronúncia, tipo + descrição
                    VStack(spacing: 18) {
                        Text(word.title)
                            .font(.system(size: 52, weight: .semibold, design: .rounded))
                            .foregroundColor(.appTitleGreen)

                        Button {
                            playPronunciation()
                        } label: {
                            HStack {
                                Text("pronuncia")
                                    .font(.system(size: 16, weight: .medium, design: .rounded))
                                    .foregroundColor(.appMuted)
                                Spacer()
                                Image(systemName: "speaker.wave.3.fill")
                                    .foregroundColor(.appMuted)
                            }
                            .padding(.horizontal, 20)
                            .padding(.vertical, 12)
                            .background(Capsule().fill(Color.appCard))
                        }
                        .frame(maxWidth: 280)

                        (
                            Text("(\(word.type)) ")
                                .foregroundColor(.appCream.opacity(0.7))
                            + Text(word.description)
                                .foregroundColor(.appCream.opacity(0.9))
                        )
                        .font(.system(size: 26, weight: .regular, design: .rounded))
                        .multilineTextAlignment(.center)
                    }

                    Spacer()
                    Spacer()

                    // Barra inferior: info à esquerda, pasta + favorito à direita
                    HStack {
                        Button {
                            // ação: mostrar informações adicionais
                        } label: {
                            Image(systemName: "info")
                                .font(.system(size: 20, weight: .semibold))
                        }
                        .outlinedCircleIcon(size: 48)

                        Spacer()

                        HStack(spacing: 18) {
                            Button {
                                // ação: adicionar a uma pasta
                            } label: {
                                Image(systemName: "folder.fill")
                                    .font(.system(size: 24))
                                    .foregroundColor(.appCream)
                            }

                            Button {
                                withAnimation(.spring()) { isFavorited.toggle() }
                            } label: {
                                Image(systemName: isFavorited ? "star.fill" : "star")
                                    .font(.system(size: 26))
                                    .foregroundColor(.appCream)
                            }
                        }
                    }
                    .padding(.horizontal, 24)
                    .padding(.bottom, 24)
                }
            }
            .navigationBarHidden(true)
            // Menu lateral (Imagem 2)
            .fullScreenCover(isPresented: $showMenu) {
                MenuView()
            }
            .confirmationDialog("Opções", isPresented: $showRandomOptions) {
                Button("Palavra aleatória") {}
                Button("Cancelar", role: .cancel) {}
            }
        }
    }

    private func playPronunciation() {
        // Integre aqui AVSpeechSynthesizer ou um player de áudio.
    }
}

/// Losango simples usado no ícone de "formas" do topo
struct Diamond: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.midY))
        path.closeSubpath()
        return path
    }
}

struct WordScreenView_Previews: PreviewProvider {
    static var previews: some View {
        WordScreenView()
    }
}
