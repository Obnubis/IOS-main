//
//  BusquedaView.swift
//  proyectoIntegrador
//
//  Created by Usuario invitado on 25/2/25.
//


import SwiftUI

struct BusquedaView: View {
    // Ejemplo de compras anteriores
    let comprasAnteriores: [Carta] = [
        Carta(id: 3, nombre: "Dialga", precio: 50.18, descripcion: "Carta de Dialga", imagen: "dialga"),
        Carta(id: 4, nombre: "Darkrai", precio: 30.25, descripcion: "Carta de darkrai", imagen: "darkrai")
    ]

    var body: some View {
        NavigationStack {
            List(comprasAnteriores) { carta in
                HStack {
                    Image(carta.imagen)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)

                    VStack(alignment: .leading) {
                        Text(carta.nombre)
                            .font(.headline)
                        Text("Precio: \(carta.precio, specifier: "%.2f")€")
                            .font(.caption)
                    }
                }
            }
            .navigationTitle("Historial")
        }
    }
}
