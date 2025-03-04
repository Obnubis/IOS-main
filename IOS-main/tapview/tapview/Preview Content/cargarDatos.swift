//
//  cargarDatos.swift
//  tapview
//
//  Created by Usuario invitado on 20/2/25.
//

import Foundation
import SwiftUI
func CargarDatosCoche() -> [Pokemon] {
    guard let url = Bundle.main.url(forResource: "tienda", withExtension: "json"),
          let data = try? Data(contentsOf: url) else {
        fatalError("Failed to load coches.json from the bundle.")
    }
    
    do {
        let decodedData = try JSONDecoder().decode([String: [Pokemon]].self, from: data)
        if let coches = decodedData["tienda"] {
            return coches
        } else {
            fatalError("Key 'coches' not found.")
        }
    } catch {
        fatalError("Failed to decode JSON: \(error)")
    }
}

