import SwiftUI

struct ListView: View {
    @ObservedObject var carritoController: CarritoController // Recibimos el carritoController como un ObservedObject
    let cartas: [Carta] = CartaLoader.loadCartas()

    var body: some View {
        NavigationStack {
            List(cartas) { carta in
                HStack {
                    NavigationLink(destination: DetalleCartaView(carta: carta, carritoController: carritoController)) {
                        HStack {
                            Image(carta.imagen)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50, height: 50)

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

                    Spacer()
                }
            }
            .navigationTitle("Tienda")
        }
    }
}
