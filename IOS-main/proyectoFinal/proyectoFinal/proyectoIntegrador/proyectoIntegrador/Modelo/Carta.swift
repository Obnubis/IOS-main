//
//  Carta.swift
//  proyectoIntegrador
//
//  Created by Mario Robles on 25/2/25.
//


import Foundation

struct Carta: Codable, Identifiable {
    let id: Int
    let nombre: String
    let precio: Double
    let descripcion: String
    let imagen: String
    let stock: Int
}
