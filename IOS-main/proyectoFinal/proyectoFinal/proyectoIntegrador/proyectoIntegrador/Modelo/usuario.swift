import Foundation

struct Usuario: Identifiable, Codable {
    var id: Int
    var nombre: String
    var email: String
    var password: String
    var CP: String
    var imagen: String?
    var newsletter: Bool
    var carrito: String?
    var historial: String?


    init(id: Int, nombre: String, email: String, password: String, CP: String, imagen: String? = nil, newsletter: Bool = false, carrito: String? = nil, historial: String? = nil) {
        self.id = id
        self.nombre = nombre
        self.email = email
        self.password = password
        self.CP = CP
        self.imagen = imagen

        self.newsletter = newsletter
        self.carrito = carrito
        self.historial = historial
    }
}
