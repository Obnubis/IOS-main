import Foundation
import SwiftUI

class CargarDatos {
    var tienda: [Pokemon] = []
    
    init() {
        cargarDatos()
    }
    
    struct TiendaWrapper: Codable {
        let tienda: [Pokemon] // Se corrigió "tineda" por "tienda"
    }
    
    func cargarDatos() {
        if let url = Bundle.main.url(forResource: "tienda", withExtension: "json") {
            print("Archivo JSON encontrado en la ruta: \(url.path)")
            do {
                let data = try Data(contentsOf: url)
                let decodedData = try JSONDecoder().decode(TiendaWrapper.self, from: data)
                self.tienda = decodedData.tienda
                print("Datos cargados correctamente: \(self.tienda)")
            } catch {
                print("Error al cargar JSON: \(error)")
            }
        } else {
            print("No se encontró el archivo JSON.")
        }
    }
}
