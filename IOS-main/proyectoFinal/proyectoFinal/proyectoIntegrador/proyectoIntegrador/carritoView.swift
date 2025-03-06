import SwiftUI

struct CarritoView: View {
    @ObservedObject var carritoController: CarritoController
    @ObservedObject var historialController: HistorialController

    var body: some View {
        VStack {
            List {
                ForEach(carritoController.carrito) { cartaCarrito in
                    HStack {
                        Image(cartaCarrito.carta.imagen)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                        
                        VStack(alignment: .leading) {
                            Text(cartaCarrito.carta.nombre)
                        }

                        Spacer()

                        // Muestra solo el número de unidades antes del Stepper
                        Text("\(cartaCarrito.cantidad)")
                            .font(.subheadline)
                            .foregroundColor(.gray)

                        Stepper(value: Binding(
                            get: { cartaCarrito.cantidad },
                            set: { newQuantity in
                                if newQuantity <= cartaCarrito.carta.stock {
                                    carritoController.modificarCantidad(carta: cartaCarrito.carta, cantidad: newQuantity)
                                }
                            }
                        ), in: 1...cartaCarrito.carta.stock) {
                            EmptyView()
                        }
                        .padding(.horizontal)

                        Text("\(cartaCarrito.carta.precio * Double(cartaCarrito.cantidad), specifier: "%.2f")€")

                        Button(action: {
                            carritoController.eliminarCarta(cartaCarrito.carta)
                        }) {
                            Image(systemName: "trash")
                                .foregroundColor(.red)
                        }
                    }
                }
            }

            Text("Total: \(carritoController.calcularTotal(), specifier: "%.2f")€")
                .font(.title)
                .padding()

            Button("Comprar") {
                carritoController.comprar(historialController: historialController)
            }
            .padding()
            .background(Color.green)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
        .navigationTitle("Carrito")
    }
}

#Preview {
    CarritoView(carritoController: CarritoController(), historialController: HistorialController())
}
