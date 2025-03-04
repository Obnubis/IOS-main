//
//  ContentView.swift
//  proyectoIntegrador
//
//  Created by Mario Robles on 13/2/25.
//


import SwiftUI

struct Registro: View {
    
    
    @State var username: String = ""
    @State var direccion: String = ""
    @State var correo: String = ""
    
    var body: some View {
        VStack {
            
            VStack(spacing: 20) {
                Text("Bienvenido a Pokecartas.com")
                    .font(.custom("Arial", size: 24))
                    .bold()
                    .italic()
                TextField("Username", text: $username)
                    .keyboardType(.emailAddress)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                    .font(.headline)
                    .background(Color.white.opacity(0.8))
                    .cornerRadius(6)
                    .border(Color.black)
                    .padding(.horizontal, 60)
                    .foregroundStyle(Color.black)
                
                TextField("Dirección postal", text: $direccion)
                    .keyboardType(.emailAddress)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                    .font(.headline)
                    .background(Color.white.opacity(0.8))
                    .cornerRadius(6)
                    .border(Color.black)
                    .padding(.horizontal, 60)
                    .foregroundStyle(Color.black)
                
                TextField("Correo electronico", text: $correo)
                    .keyboardType(.emailAddress)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                    .font(.headline)
                    .background(Color.white.opacity(0.8))
                    .cornerRadius(6)
                    .border(Color.black)
                    .padding(.horizontal, 60)
                    .foregroundStyle(Color.black)
                
                Button("Registrarse"){
                    print("**********")
                    print("Usuario \(username)")
                    print("Dirección \(direccion)")
                    print("Correo\(correo)")
                }
                .padding(.bottom, 20)
            }
            
        }
    }
}

struct Registro_Previews: PreviewProvider {
    static var previews: some View {
        Registro()
    }
}
