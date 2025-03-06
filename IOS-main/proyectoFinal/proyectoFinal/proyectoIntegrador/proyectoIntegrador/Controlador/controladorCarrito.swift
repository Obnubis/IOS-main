import SwiftUI

class CarritoController: ObservableObject {
    @Published var carrito: [CartaCarrito] = []
    
    func agregarCarta(_ carta: Carta) {
        if let index = carrito.firstIndex(where: { $0.carta.id == carta.id }) {
            carrito[index].cantidad += 1
        } else {
            carrito.append(CartaCarrito(carta: carta, cantidad: 1))
        }
    }
    
    func modificarCantidad(carta: Carta, cantidad: Int) {
        if let index = carrito.firstIndex(where: { $0.carta.id == carta.id }) {
            carrito[index].cantidad = max(1, cantidad)
        }
    }
    

    func eliminarCarta(_ carta: Carta) {
        carrito.removeAll { $0.carta.id == carta.id }
    }
    
    func calcularTotal() -> Double {
        return carrito.reduce(0) { $0 + (Double($1.cantidad) * $1.carta.precio) }	
    }
    
    func comprar(historialController: HistorialController) {
        historialController.agregarCompra(cartasCompradas: carrito)
        carrito.removeAll() 
    }
}

struct CartaCarrito: Identifiable {
    let id = UUID()
    let carta: Carta
    var cantidad: Int
}


