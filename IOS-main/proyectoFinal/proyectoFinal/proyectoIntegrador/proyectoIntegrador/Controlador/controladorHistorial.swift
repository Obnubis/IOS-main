import SwiftUI

class HistorialController: ObservableObject {
    @Published var historial: [CartaCarrito] = []

    // Agregar compra al historial
    func agregarCompra(cartasCompradas: [CartaCarrito]) {
        historial.append(contentsOf: cartasCompradas)
    }
}
