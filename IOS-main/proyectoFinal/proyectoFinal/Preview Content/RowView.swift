//
//  RowView.swift
//  proyectoFinal
//
//  Created by Usuario invitado on 13/2/25.
//

import Foundation
import SwiftUI
import SwiftUICore
struct RowView:View{
    
    var cartas : cartasPokemon
    var body: some View{
        HStack{
            cartas.image
                .resizable()
                .frame(width: 100,
                height: 100,
                alignment: .center)
            VStack(alignment: .leading){
                Text(cartas.name)
                    .font(.title)
                Text("Precio")
                    .font(.subheadline)
             
            }
            
        }
    }
}

struct RowView_previuw:
    PreviewProvider{
    static var previews:some View{
        RowView(cartas: cartasPokemon(id: 1, name: "Pikachu", Descripcion: "Es amarillo", precio: 1000, image: Image(systemName: "house")))
    }
}
