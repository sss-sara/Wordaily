//
//  MenuView.swift
//  Wordaily
//
//  menu - settings n account
//

import SwiftUI

struct MenuView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var showSettings = false
    @State private var showProfile = false

    var body: some View {
        NavigationStack {
            ZStack(alignment: .topLeading) {
                AppBackground()

                VStack(alignment: .leading, spacing: 0) {
                    // Botão fechar/menu no topo, igual à tela principal
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "line.horizontal.3")
                            .font(.system(size: 22, weight: .medium))
                    }
                    .outlinedCircleIcon()
                    .padding(.leading, 24)
                    .padding(.top, 16)
                    .padding(.bottom, 40)

                    MenuRow(icon: "gearshape", title: "Configurações") {
                        showSettings = true
                    }

                    MenuRow(icon: "person.crop.circle", title: "Perfil") {
                        showProfile = true
                    }

                    Spacer()
                }
            }
            .navigationBarHidden(true)
            .navigationDestination(isPresented: $showProfile) {
                ProfileView()
            }
            .sheet(isPresented: $showSettings) {
                // Substitua por sua tela real de Configurações
                Text("Configurações")
                    .foregroundColor(.appCream)
                    .presentationDetents([.medium])
            }
        }
    }
}

private struct MenuRow: View {
    let icon: String
    let title: String
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack(spacing: 16) {
                Image(systemName: icon)
                    .font(.system(size: 26))
                    .frame(width: 44, height: 44)
                    .overlay(Circle().stroke(Color.appCream, lineWidth: 1.5))

                Text(title)
                    .font(.system(size: 24, weight: .regular, design: .rounded))
            }
            .foregroundColor(.appCream)
            .padding(.horizontal, 24)
            .padding(.vertical, 14)
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
