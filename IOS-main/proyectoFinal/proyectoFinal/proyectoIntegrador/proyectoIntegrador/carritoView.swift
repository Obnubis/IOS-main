import SwiftUI

struct carritoView: View {
    // Ejemplo de cartas en el carrito
    let cartasEnCarrito: [Carta] = [
        Carta(id: 1, nombre: "Pikachu", precio: 20.50, descripcion: "Carta especial de pikachu", imagen: "pikachu1"),
        Carta(id: 2, nombre: "Charizard", precio: 100.99, descripcion: "Carta unica de Charizard", imagen: "charizard")
    ]

    var body: some View {
        NavigationStack {
            List(cartasEnCarrito) { carta in
                HStack {
                    Image(carta.imagen)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)

                    VStack(alignment: .leading) {
                        Text(carta.nombre)
                            .font(.headline)
                        Text("Precio: \(carta.precio, specifier: "%.2f")€")
                            .font(.caption)
                    }
                }
            }
            .navigationTitle("Carrito")
        }
    }
}
