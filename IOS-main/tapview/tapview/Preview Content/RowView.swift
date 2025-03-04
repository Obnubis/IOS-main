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
        HStack{
            pokemon.imajen.resizable().frame(width: 100,height: 100,alignment: .center).padding(10)
            VStack(alignment:
                    .leading){
                Text(pokemon.name)
                    .font(.title)
                        Text(String(pokemon.prrecio)).font(.subheadline)
            }
            Spacer()
        }
    }
}
struct RowView_previews:
    PreviewProvider{
    static var previews: some View{
        RowView(pokemon: Pokemon(id: 1, name: "Pikachu", descripcion: "carta de pikachu", prrecio: 200, imajen: Image(systemName: "person.fill")))
            .previewLayout(
                .fixed(width: 400, height: 60)
            )
    }
}
