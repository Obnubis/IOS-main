import SwiftUI

struct DetalleCartaView: View {
    let carta: Carta
    @ObservedObject var carritoController: CarritoController  

    var body: some View {
        VStack {
            Image(carta.imagen)
                .resizable()
                .scaledToFit()
                .frame(width: 300, height: 400)
                .shadow(radius: 30)

            Text(carta.descripcion)
                .font(.body)

            // Botón de compra
            Button(action: {
                carritoController.agregarCarta(carta)
            }) {
                Text("Comprar \(carta.nombre)")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.red)
                    .foregroundColor(.white)
                    .shadow(radius: 10)
                    .cornerRadius(10)
                    .padding(.horizontal, 40)
            }	

            Text("Precio: \(carta.precio, specifier: "%.2f")€")
                .font(.body)

            Spacer()
        }
        .navigationTitle(carta.nombre)
    }
}
