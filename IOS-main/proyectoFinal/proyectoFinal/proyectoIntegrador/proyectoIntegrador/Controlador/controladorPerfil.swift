import SwiftUI

class PerfilController: ObservableObject {
    @Published var usuario: Usuario
    @Published var newsletter: Bool
    @Published var sesionCerrada: Bool = false
    @Published var usuarios: [Usuario] = []
    private var datosCargados = false  // Bandera para evitar cargar los datos múltiples veces

    init(usuario: Usuario) {
        self.usuario = usuario
        self.newsletter = usuario.newsletter
        cargarUsuarios()
    }

    func cargarUsuarios() {
        // Solo carga los datos si no han sido cargados previamente
        if datosCargados {
            return
        }

        let fileURL = obtenerURLArchivo()
        do {
            let data = try Data(contentsOf: fileURL)
            let decoder = JSONDecoder()
            let resultado = try decoder.decode([String: [Usuario]].self, from: data)
            if let listaUsuarios = resultado["usuarios"] {
                self.usuarios = listaUsuarios
                print("Usuarios cargados correctamente: \(usuarios.count) usuarios")
                print("Primer usuario en JSON: \(usuarios.first?.nombre ?? "No hay usuarios")")
                // Aquí, puedes encontrar y asignar el usuario específico con el email:
                if let usuarioEncontrado = usuarios.first(where: { $0.email == usuario.email }) {
                    self.usuario = usuarioEncontrado  // Asignamos el usuario cargado a la instancia
                }
                datosCargados = true  // Marcamos que ya cargamos los datos
            } else {
                print("El JSON no contiene la clave 'usuarios'.")
            }
        } catch {
            print("Error al cargar los usuarios desde el archivo JSON: \(error.localizedDescription)")
        }
    }

    func salvarUsuarios() {
        let fileURL = obtenerURLArchivo()
        do {
            let encoder = JSONEncoder()
            encoder.outputFormatting = .prettyPrinted
            let data = try encoder.encode(["usuarios": usuarios])
            try data.write(to: fileURL, options: .atomicWrite)
            print("Usuarios guardados correctamente en \(fileURL.path)")
        } catch {
            print("Error al guardar los usuarios en el archivo JSON: \(error.localizedDescription)")
        }
    }

    func cerrarSesion() {
        print("Sesión cerrada")
        sesionCerrada = true
    }

    func modificarUsuario(email: String, nuevoNombre: String, nuevaPassword: String, nuevoCP: String, nuevaImagen: String?, nuevaNotificaciones: Bool, nuevoNewsletter: Bool, nuevoCarrito: String?, nuevoHistorial: String?) {
        if let index = usuarios.firstIndex(where: { $0.email == email }) {
            usuarios[index].nombre = nuevoNombre
            usuarios[index].password = nuevaPassword
            usuarios[index].CP = nuevoCP
            usuarios[index].imagen = nuevaImagen
            usuarios[index].newsletter = nuevoNewsletter
            usuarios[index].carrito = nuevoCarrito
            usuarios[index].historial = nuevoHistorial

            usuario = usuarios[index]
            salvarUsuarios()  // Guardar los cambios en el archivo JSON
        }
    }

    private func obtenerURLArchivo() -> URL {
        FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("Usuarios.json")
    }
}
