//
//  CartaLoader.swift
//  proyectoIntegrador
//
//  Created by Usuario invitado on 25/2/25.
//

import Foundation


class CartaLoader {
    static func loadCartas() -> [Carta] {
        guard let url = Bundle.main.url(forResource: "tienda", withExtension: "json") else {
            print("No se encontró el archivo 'tienda.json'.")
            return []
        }

        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let resultado = try decoder.decode([String: [Carta]].self, from: data)

            if let cartas = resultado["CartasComprar"] {
                return cartas
            } else {
                print("El JSON no contiene la clave 'CartasComprar'.")
                return []
            }
        } catch {
            print("Error al cargar el archivo JSON: \(error.localizedDescription)")
            return []
        }
    }
}
