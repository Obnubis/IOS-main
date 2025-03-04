import SwiftUI

struct ContentView2: View {
    // Crear una instancia de PerfilController
    @StateObject var perfilController = PerfilController(usuario: Usuario(id: 1, nombre: "Juan Perez", email: "juan@example.com",password: "123456", CP: "28001", imagen: "pikachu", newsletter: false, carrito: nil, historial: nil))

    @State private var isLoggedIn = true

    var body: some View {
        TabView {
            // Pestaña de Tienda
            ListView()
                .tabItem {
                    Label("Tienda", systemImage: "eurosign.circle")
                }
                .tag(1)

            carritoView()
                .tabItem {
                    Label("Carrito", systemImage: "cart.badge.plus")
                }
                .tag(2)

            // Pestaña de Historial
            BusquedaView()
                .tabItem {
                    Label("Historial", systemImage: "clock")
                }
                .tag(3)
            Perfil(controller: perfilController, isLoggedIn: $isLoggedIn)
                .tabItem {
                    Label("Perfil", systemImage: "person.crop.circle")
                }
                .tag(4)
        }
    }
}

#Preview {
    ContentView2()
}
