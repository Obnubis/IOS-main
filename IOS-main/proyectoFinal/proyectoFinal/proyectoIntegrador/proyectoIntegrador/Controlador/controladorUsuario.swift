import Foundation

class UsuarioController: ObservableObject {
    @Published var usuarios: [Usuario] = []
    
    private let nomFichJSON = "Usuarios.json"
    
    // Array de usuarios "hardcoded"
    let usuariosHardcoded: [Usuario] = [
        Usuario(id: 1, nombre: "Juan", email: "Juan89@gmail.com", password: "12345678", CP: "67045", imagen: "", newsletter: true, carrito: "", historial: ""),
        Usuario(id: 2, nombre: "Laura", email: "Laurich@gmail.com", password: "password123", CP: "50693", imagen: "", newsletter: false, carrito: "", historial: ""),
        Usuario(id: 3, nombre: "Mario", email: "mrobles@gmail.com", password: "securepassword", CP: "56230", imagen: "", newsletter: true, carrito: "", historial: ""),
        Usuario(id: 4, nombre: "Hugo", email: "Hosma@gmail.com", password: "hugo1234", CP: "56789", imagen: "", newsletter: true, carrito: "", historial: ""),
        Usuario(id: 5, nombre: "Anton", email: "Alu@gmail.com", password: "anton5678", CP: "45456", imagen: "", newsletter: false, carrito: "", historial: ""),
        Usuario(id: 6, nombre: "Hui", email: "huihui@gmail.com", password: "huihui123", CP: "56723", imagen: "", newsletter: true, carrito: "", historial: "")
    ]
    
    init() {
        cargarUsuarios()
    }

    private func obtenerDirectorioDocumentos() -> URL {
        FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    }
    
    private func obtenerURLArchivo() -> URL {
        obtenerDirectorioDocumentos().appendingPathComponent(nomFichJSON)
    }
    
    func cargarUsuarios() {
        let fileURL = obtenerURLArchivo()
        print("Ruta del archivo JSON: \(fileURL.path)")
        
        if !FileManager.default.fileExists(atPath: fileURL.path) {
            if let bundleURL = Bundle.main.url(forResource: "Usuarios", withExtension: "json") {
                do {
                    try FileManager.default.copyItem(at: bundleURL, to: fileURL)
                } catch {
                    print("Error copiando el JSON desde el bundle: \(error)")
                }
            }
        }
        
        do {
            let data = try Data(contentsOf: fileURL)
            let decoder = JSONDecoder()
            let resultado = try decoder.decode([String: [Usuario]].self, from: data)
            if let listaUsuarios = resultado["usuarios"] {
                self.usuarios = listaUsuarios
                print("Usuarios cargados correctamente desde JSON: \(usuarios.count) usuarios")
            } else {
                print("El JSON no contiene la clave 'usuarios'.")
            }
        } catch {
            print("Error al cargar el JSON: \(error)")
        }
    }

    func autenticar(email: String, password: String) -> Usuario? {
        if let usuario = usuariosHardcoded.first(where: { $0.email == email && $0.password == password }) {
            return usuario
        }
        cargarUsuarios()
        return usuarios.first(where: { $0.email == email && $0.password == password })
    }
}
