import SwiftUI

struct ListView: View {
    // Cargar las cartas desde el JSON
    let cartas: [Carta] = CartaLoader.loadCartas()

    var body: some View {
        NavigationStack {
            List(cartas) { carta in
                NavigationLink(destination: DetalleCartaView(carta: carta)) {
                    HStack {
                        // Mostrar la imagen
                        Image(carta.imagen)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)

                        // Mostrar los detalles de la carta
                        VStack(alignment: .leading) {
                            Text(carta.nombre)
                                .font(.headline)
                            Text(carta.descripcion)
                                .font(.subheadline)
                            Text("Precio: \(carta.precio, specifier: "%.2f")€")
                                .font(.caption)
                        }
                    }
                }
            }
            .navigationTitle("Tienda")
        }
    }
}

#Preview {
    ListView()
}
