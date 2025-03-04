//
//  DetalleCartaView.swift
//  proyectoIntegrador
//
//  Created by Usuario invitado on 25/2/25.
//


import SwiftUI

struct DetalleCartaView: View {
    let carta: Carta

    var body: some View {
        VStack {
            Image(carta.imagen)
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)

            Text(carta.nombre)
                .font(.largeTitle)
                .padding()

            Text(carta.descripcion)
                .font(.body)
                .padding()

            Text("Precio: \(carta.precio, specifier: "%.2f")€")
                .font(.title2)
                .padding()

            Spacer()
        }
        .navigationTitle(carta.nombre)
    }
}
