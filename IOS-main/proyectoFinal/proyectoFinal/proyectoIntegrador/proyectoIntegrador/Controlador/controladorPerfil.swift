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

    // Método para cargar los usuarios desde el archivo JSON
    func cargarUsuarios() {
        if datosCargados { return } // Evitar carga múltiple

        let fileURL = obtenerURLArchivo()
        do {
            let data = try Data(contentsOf: fileURL)
            let decoder = JSONDecoder()
            let resultado = try decoder.decode([String: [Usuario]].self, from: data)
            
            if let listaUsuarios = resultado["usuarios"] {
                self.usuarios = listaUsuarios
                print("Usuarios cargados correctamente: \(usuarios.count) usuarios")
                
                if let usuarioEncontrado = usuarios.first(where: { $0.email == usuario.email }) {
                    self.usuario = usuarioEncontrado
                }
                datosCargados = true
            } else {
                print("El JSON no contiene la clave 'usuarios'.")
            }
        } catch {
            print("Error al cargar los usuarios desde el archivo JSON: \(error.localizedDescription)")
        }
    }

    // Método para guardar los usuarios al archivo JSON
    func salvarUsuarios() {
        let fileURL = obtenerURLArchivo()
        do {
            let encoder = JSONEncoder()
            encoder.outputFormatting = .prettyPrinted
            let data = try encoder.encode(["usuarios": usuarios])
            
            print("Guardando datos en: \(fileURL.path)")
            
            try data.write(to: fileURL, options: .atomicWrite)
            print("Usuarios guardados correctamente en \(fileURL.path)")
        } catch {
            print("Error al guardar los usuarios en el archivo JSON: \(error.localizedDescription)")
        }
    }

    // Método para cerrar sesión
    func cerrarSesion() {
        print("Sesión cerrada")
        sesionCerrada = true
    }

    // Método para modificar un usuario
    func modificarUsuario(email: String, nuevoNombre: String, nuevaPassword: String, nuevoCP: String, nuevaImagen: String?, nuevaNotificaciones: Bool, nuevoNewsletter: Bool, nuevoCarrito: String?, nuevoHistorial: String?) {
        if let index = usuarios.firstIndex(where: { $0.email == email }) {
            usuarios[index].nombre = nuevoNombre
            usuarios[index].password = nuevaPassword
            usuarios[index].CP = nuevoCP
            usuarios[index].imagen = nuevaImagen
            usuarios[index].newsletter = nuevoNewsletter
            usuarios[index].carrito = nuevoCarrito
            usuarios[index].historial = nuevoHistorial

            print("Usuario modificado en memoria: \(usuarios[index])")

            usuario = usuarios[index]
            print("Usuario actualizado en memoria: \(usuario)")

            salvarUsuarios() // Guardar cambios en el JSON
        } else {
            print("No se encontró el usuario con el email \(email)")
        }
    }

    // Función para obtener la URL del archivo JSON
    private func obtenerURLArchivo() -> URL {
        FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("Usuarios.json")
    }

    // Método estático para cargar el usuario desde el JSON al iniciar la app
    static func cargarDesdeJSON() -> PerfilController {
        let fileURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("Usuarios.json")

        do {
            let data = try Data(contentsOf: fileURL)
            let decoder = JSONDecoder()
            let resultado = try decoder.decode([String: [Usuario]].self, from: data)

            if let usuarios = resultado["usuarios"], let usuario = usuarios.first {
                print("Usuario cargado desde JSON: \(usuario.nombre)")
                return PerfilController(usuario: usuario)
            } else {
                print("No se encontró usuario en JSON. Usando valores por defecto.")
            }
        } catch {
            print("Error al cargar usuarios desde JSON: \(error.localizedDescription)")
        }

        return PerfilController(usuario: Usuario(id: 0, nombre: "Desconocido", email: "", password: "", CP: "", imagen: nil, newsletter: false, carrito: nil, historial: nil))
    }
}
