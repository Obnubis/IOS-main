import SwiftUI

struct Perfil: View {
    
    @ObservedObject var controller: PerfilController
    @Binding var isLoggedIn: Bool
    
    @State private var showLogoutAlert = false
    @State private var isEditing = false  
    @State private var nombre: String
    @State private var email: String
    @State private var CP: String
    @State private var newsletter: Bool

    init(controller: PerfilController, isLoggedIn: Binding<Bool>) {
        self._controller = ObservedObject(wrappedValue: controller)
        self._isLoggedIn = isLoggedIn
        self._nombre = State(initialValue: controller.usuario.nombre)
        self._email = State(initialValue: controller.usuario.email)
        self._CP = State(initialValue: controller.usuario.CP)
        self._newsletter = State(initialValue: controller.usuario.newsletter)
    }

    var body: some View {
        VStack {
            Image("pikachu")
                .resizable()
                .scaledToFill()
                .frame(width: 120, height: 120)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 4))
                .shadow(radius: 10)
                .padding()

            Text("Datos del Usuario")
                .font(.title)
                .bold()
                .padding(.bottom, 10)

            VStack(spacing: 15) {
                // Campos editables
                TextField("Nombre", text: $nombre)
                    .disabled(!isEditing)
                    .padding(.horizontal, 40)

                TextField("Dirección Postal", text: $CP)
                    .disabled(!isEditing)
                    .padding(.horizontal, 40)

                TextField("Correo Electrónico", text: $email)
                    .disabled(!isEditing)
                    .padding(.horizontal, 40)

                Toggle(isOn: $newsletter) {
                    Text("Suscripción al Newsletter")
                        .font(.subheadline)
                }
                .disabled(!isEditing)
                .padding(.horizontal, 40)
                .padding(.top, 10)
            }

            HStack {
                if isEditing {
                    Button(action: {
                        print("Guardar datos - Nombre: \(nombre), CP: \(CP), Newsletter: \(newsletter)")
                        controller.modificarUsuario(email: controller.usuario.email, nuevoNombre: nombre, nuevaPassword: controller.usuario.password, nuevoCP: CP, nuevaImagen: controller.usuario.imagen, nuevaNotificaciones: newsletter, nuevoNewsletter: newsletter, nuevoCarrito: controller.usuario.carrito, nuevoHistorial: controller.usuario.historial)
                        isEditing = false  // Desactivar modo edición
                    }) {
                        Text("Guardar Datos")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.green)
                            .cornerRadius(20)
                            .padding(.horizontal, 40)
                    }
                } else {
                    Button(action: {
                        // Activar modo edición
                        isEditing = true
                    }) {
                        Text("Modificar Datos")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.blue)
                            .cornerRadius(20)
                            .padding(.horizontal, 40)
                    }
                }
            }

            Button(action: {
                showLogoutAlert = true
            }) {
                Text("Cerrar sesión")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.red)
                    .cornerRadius(20)
                    .padding(.horizontal, 40)
            }
            .padding(.top, 20)
            .alert(isPresented: $showLogoutAlert) {
                Alert(
                    title: Text("¿Estás seguro?"),
                    message: Text("¿Quieres cerrar sesión?"),
                    primaryButton: .destructive(Text("Cerrar sesión")) {
                        controller.cerrarSesion()
                        isLoggedIn = false
                    },
                    secondaryButton: .cancel()
                )
            }
        }
        .navigationTitle("Perfil")
    }
}
