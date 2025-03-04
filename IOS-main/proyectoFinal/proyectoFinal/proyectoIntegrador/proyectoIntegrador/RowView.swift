//
//  RowView.swift
//  listass
//
//  Created by Usuario invitado on 20/2/25.
//

import SwiftUI
struct RowView:View {
    var pokemon: Pokemon
    var body: some View {
        HStack {
                    Image(pokemon.imagen)  // Carga la imagen desde Assets.xcassets
                        .resizable()
                        .frame(width: 120, height: 170)
                        .padding(10)

                    VStack(alignment: .leading) {
                        Text(pokemon.name)
                            .font(.title)
                        Text("$\(pokemon.prrecio, specifier: "%.2f")") // Formato de precio con 2 decimales
                            .font(.subheadline)
                    }
            Spacer()
        }
    }
}
struct RowView_Previews: PreviewProvider {
    static var previews: some View {
        RowView(pokemon: Pokemon(id: 1, name: "Pikachu", descripcion: "Carta de Pikachu", prrecio: 200, imagen: "pikachu1"))
            .previewLayout(.fixed(width: 400, height: 100))
    }
}
