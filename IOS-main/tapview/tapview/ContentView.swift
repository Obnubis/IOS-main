//
//  ContentView.swift
//  tapview
//
//  Created by Usuario invitado on 20/2/25.
//

import SwiftUI

struct InicioView: View {
    var body: some View {
        NavigationStack {
            Image(systemName: "eurosign.circle")
                .font(.system(size: 100))
                .foregroundColor(.green)
            Text("Página de Inicio")
                .navigationTitle("Tienda")
        }
    }
}

struct carritoView: View {
    var body: some View {
        NavigationStack {
            Image(systemName: "cart.badge.plus")
                .font(.system(size: 100))
                .foregroundColor(.blue)
            Text("Página de Búsqueda")
                .navigationTitle("Carro")
        }
    }
}

struct BusquedaView: View {
    var body: some View {
        NavigationStack {
            Image(systemName: "clock")
                .font(.system(size: 100))
                .foregroundColor(.blue)
            Text("Página de Búsqueda")
                .navigationTitle("Historial")
        }
    }
}

struct ConfiguracionView: View {
    var body: some View {
        NavigationStack {
            Image(systemName: "person.crop.circle")
                .font(.system(size: 100))
                .foregroundColor(.red)
            Text("Página de Configuración")
                .navigationTitle("Perfil")
        }
    }
}

struct ContentView: View {
    var body: some View {
        TabView {
            InicioView()
                .tabItem {
                    Label("Tienda", systemImage: "eurosign.circle")
                }
                .tag(1)
            
            carritoView()
                .tabItem {
                    Label("Carrito", systemImage: "cart.badge.plus")
                }
                .tag(2)
            
            BusquedaView()
                .tabItem {
                    Label("Historial", systemImage: "clock")
                }
                .tag(3)
            
            ConfiguracionView()
                .tabItem {
                    Label("Perfil", systemImage: "person.crop.circle")
                }
                .tag(4)
        }
    }
}

#Preview {
    ContentView()
}
