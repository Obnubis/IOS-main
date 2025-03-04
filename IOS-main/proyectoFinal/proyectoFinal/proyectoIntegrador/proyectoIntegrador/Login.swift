import SwiftUI

struct Login: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var usuarioAutenticado: Usuario?
    @State private var mostrarError = false
    @State private var isLoggedIn = false
    
    @ObservedObject var usuarioController = UsuarioController() 
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Text("Bienvenido a Pokecartas.com")
                    .font(.title)
                    .bold()

                TextField("Email", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal, 40)

                SecureField("Contraseña", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal, 40)

                Button("Iniciar Sesión") {
                    if let usuario = usuarioController.autenticar(email: email, password: password) {
                        usuarioAutenticado = usuario
                        isLoggedIn = true
                        email = ""
                        password = ""
                    } else {
                        mostrarError = true
                    }
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
                .padding(.horizontal, 40)

                if mostrarError {
                    Text("Usuario o contraseña incorrectos")
                        .foregroundColor(.red)
                }

                NavigationLink("¿No tienes cuenta? Regístrate", destination: Registro())
                    .foregroundColor(.blue)
            }
            .padding()
            .navigationDestination(isPresented: $isLoggedIn) {
                ContentView2()
            }
        }
        .onAppear {
            usuarioController.cargarUsuarios()
        }
    }
}

#Preview {
    Login(usuarioController: UsuarioController())
}
