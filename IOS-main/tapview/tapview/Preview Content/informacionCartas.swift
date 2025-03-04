//
//  informacionCartas.swift
//  tapview
//
//  Created by Usuario invitado on 20/2/25.
//

import Foundation
import SwiftUI

struct DetallesCoche: View {
    let cochecito: Pokemon
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text("Nombre: \(cochecito.name)").font(.title)
                Text("Precio: \(cochecito.prrecio)").font(.headline)
                Text("Descripcion: \(cochecito.descripcion)")
            }
            .padding()
        }
        .navigationTitle("\(cochecito.name) \(cochecito.prrecio)")
    }
}

