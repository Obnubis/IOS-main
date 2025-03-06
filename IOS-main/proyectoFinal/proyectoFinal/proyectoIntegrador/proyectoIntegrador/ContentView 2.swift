import SwiftUI

struct ContentView2: View {
    @StateObject var perfilController: PerfilController
    @StateObject var historialController = HistorialController()
    
    @StateObject var carritoController = CarritoController()
    @State private var isLoggedIn = true

    init() {
        let perfilControllerTemp = PerfilController.cargarDesdeJSON()
        _perfilController = StateObject(wrappedValue: perfilControllerTemp)
    }

    var body: some View {
        TabView {
            ListView(carritoController: carritoController)
                .tabItem {
                    Label("Tienda", systemImage: "eurosign.circle")
                }
                .tag(1)

            CarritoView(carritoController: carritoController, historialController: historialController)
                .tabItem {
                    Label("Carrito", systemImage: "cart.badge.plus")
                }
                .tag(2)

            BusquedaView(historialController: historialController) 
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
