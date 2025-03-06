import SwiftUI

struct BusquedaView: View {
    @ObservedObject var historialController: HistorialController

    var body: some View {
        NavigationStack {
            List(historialController.historial) { compra in
                HStack {
                    Image(compra.carta.imagen)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)

                    VStack(alignment: .leading) {
                        Text(compra.carta.nombre)
                            .font(.headline)
                        Text("Cantidad: \(compra.cantidad)")
                            .font(.subheadline)
                        Text("Precio total: \(Double(compra.cantidad) * compra.carta.precio, specifier: "%.2f")€")
                            .font(.caption)
                    }
                }
            }
            .navigationTitle("Historial de Compras")
        }
    }
}

#Preview {
    BusquedaView(historialController: HistorialController())
}
