//
//  RowView.swift
//  listass
//
//  Created by Usuario invitado on 20/2/25.
//

import SwiftUI
struct RowView:View {
    var pokemon: Carta
    var body: some View {
        HStack {
                    Image(pokemon.imagen)  // Carga la imagen desde Assets.xcassets
                        .resizable()
                        .frame(width: 120, height: 170)
                        .padding(10)

                    VStack(alignment: .leading) {
                        Text(pokemon.nombre)
                            .font(.title)
                        Text("$\(pokemon.precio, specifier: "%.2f")") // Formato de precio con 2 decimales
                            .font(.subheadline)
                    }
            Spacer()
        }
    }
}
struct RowView_Previews: PreviewProvider {
    static var previews: some View {
        RowView(pokemon: Carta(id: 1, nombre: "Pikachu", precio: 200, descripcion: "Carta de Pikachu", imagen: "pikachu1", stock: 1))
            .previewLayout(.fixed(width: 400, height: 100))
    }
}
