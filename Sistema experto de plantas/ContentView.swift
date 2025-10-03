//
//  ContentView.swift
//  Sistema experto de plantas
//
//  Created by yatziri on 25/09/25.
//

import SwiftUI
import Combine

#if canImport(UIKit)
import UIKit
#endif

// MARK: - Modelo de Vista para manejar la lógica
class DiagnosticoModelo: ObservableObject {
    struct Resultado: Identifiable {
        let id = UUID()
        let diagnostico: String
        let tratamiento: String
        let porcentaje: Double
    }
    
    @Published var seleccionSintomas: Set<String> = []
    
    @Published private(set) var resultados: [Resultado] = []
    @Published private(set) var diagnostico: String = ""
    @Published private(set) var tratamiento: String = ""
    
    // Función para actualizar diagnóstico
    func actualizarDiagnostico() {
        let seleccion = seleccionSintomas
        var acumulados: [Resultado] = []

        for regla in reglas {
            let sintomasRegla = Set(regla.sintomas)
            if sintomasRegla.isEmpty || seleccion.isEmpty { continue }
            let comunes = seleccion.intersection(sintomasRegla)
            guard !comunes.isEmpty else { continue }
            let porcentaje = (Double(comunes.count) / Double(sintomasRegla.count)) * 100.0
            let item = Resultado(diagnostico: regla.diagnostico, tratamiento: regla.tratamiento, porcentaje: porcentaje)
            acumulados.append(item)
        }

        // Ordenar por porcentaje descendente
        acumulados.sort { $0.porcentaje > $1.porcentaje }
        resultados = acumulados

        if let primero = resultados.first {
            diagnostico = primero.diagnostico
            tratamiento = primero.tratamiento
        } else {
            diagnostico = "No se encontró un diagnóstico para esos síntomas."
            tratamiento = ""
        }
    }
    
    // Seleccionar todos los síntomas
    func seleccionarTodos() {
        seleccionSintomas = Set(listaClaves)
        actualizarDiagnostico()
    }
    
    // Deseleccionar todos
    func quitarSeleccion() {
        seleccionSintomas.removeAll()
        actualizarDiagnostico()
    }
    
    // Alternar un síntoma
    func toggleSintoma(_ clave: String) {
        if seleccionSintomas.contains(clave) {
            seleccionSintomas.remove(clave)
        } else {
            seleccionSintomas.insert(clave)
        }
        actualizarDiagnostico()
    }
}

/// Devuelve una imagen para un síntoma dado su `clave`.
/// Intenta cargar una imagen del catálogo de assets con ese nombre.
/// Si no existe, usa un símbolo del sistema como respaldo.
private func imagenDeSintoma(_ clave: String) -> Image {
    #if canImport(UIKit)
    if let uiImage = UIImage(named: clave) {
        return Image(uiImage: uiImage)
    }
    #endif
    // Respaldo genérico si no se encuentra la imagen en assets
    return Image(systemName: "leaf")
}

// MARK: - Vista Principal
struct ContentView: View {
    @StateObject private var modelo = DiagnosticoModelo()
    @State private var navegarResultado = false
    
    // Mapa para obtener el nombre por clave de síntoma
    private var nombrePorClave: [String: String] {
        Dictionary(uniqueKeysWithValues: zip(listaClaves, listaNombres))
    }
    
    var body: some View {
        NavigationView {
            VStack(spacing: 16) {
                
                List {
                    ForEach(listaClaves, id: \.self) { clave in
                        let nombre = nombrePorClave[clave] ?? clave
                        SintomaRow(
                            clave: clave,
                            nombre: nombre,
                            isSelected: Binding(
                                get: { modelo.seleccionSintomas.contains(clave) },
                                set: { isOn in
                                    if isOn {
                                        modelo.seleccionSintomas.insert(clave)
                                    } else {
                                        modelo.seleccionSintomas.remove(clave)
                                    }
                                    modelo.actualizarDiagnostico()
                                }
                            )
                        )
                    }
                }
                .listStyle(.insetGrouped)
                
                // Resumen visual de síntomas seleccionados
                VStack(alignment: .leading, spacing: 8) {
                    Text("Síntomas seleccionados:")
                        .font(.headline)
                        .padding(.horizontal)
                    
                    if modelo.seleccionSintomas.isEmpty {
                        Text("Ninguno seleccionado")
                            .foregroundColor(.secondary)
                            .padding(.horizontal)
                    } else {
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 12) {
                                ForEach(listaClaves.filter { modelo.seleccionSintomas.contains($0) }, id: \.self) { clave in
                                    VStack {
                                        imagenDeSintoma(clave)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 60, height: 60)
                                            .cornerRadius(8)
                                            .shadow(radius: 2)
                                        let nombre = nombrePorClave[clave] ?? clave
                                        Text(nombre)
                                            .font(.caption)
                                            .multilineTextAlignment(.center)
                                            .frame(width: 70)
                                            .foregroundColor(.primary)
                                    }
                                }
                            }
                            .padding(.horizontal)
                        }
                        .frame(height: 100)
                    }
                }
                
                // Botón para ver diagnóstico en otra vista
                VStack(spacing: 12) {
                    // Enlace de navegación oculto activado por estado
                    NavigationLink(destination: ResultadoView(modelo: modelo), isActive: $navegarResultado) {
                        EmptyView()
                    }
                    .hidden()

                    Button {
                        modelo.actualizarDiagnostico()
                        navegarResultado = true
                    } label: {
                        Label("Ver diagnóstico", systemImage: "stethoscope")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(modelo.seleccionSintomas.isEmpty ? Color.gray.opacity(0.4) : Color.blue.opacity(0.85))
                            .foregroundColor(.white)
                            .cornerRadius(12)
                    }
                    .disabled(modelo.seleccionSintomas.isEmpty)
                }
                .padding(.horizontal)
                
            }
            .navigationTitle("Sintomas")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        let allSelected = modelo.seleccionSintomas.count == listaClaves.count
                        if allSelected {
                            modelo.quitarSeleccion()
                        } else {
                            modelo.seleccionarTodos()
                        }
                    } label: {
                        let allSelected = modelo.seleccionSintomas.count == listaClaves.count
                        Image(systemName: allSelected ? "checkmark.square" : "square")
                    }
                    .accessibilityLabel({
                        let allSelected = modelo.seleccionSintomas.count == listaClaves.count
                        return allSelected ? "Quitar selección" : "Seleccionar todos"
                    }())
                }
            }
            .onAppear {
                modelo.actualizarDiagnostico()
            }
        }
    }
}

// Fila reutilizable para un síntoma
private struct SintomaRow: View {
    let clave: String
    let nombre: String
    @Binding var isSelected: Bool

    var body: some View {
        HStack {
            imagenDeSintoma(clave)
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40)
                .cornerRadius(6)
                .shadow(radius: 1)
                .padding(.trailing, 8)
            Text(nombre)
                .font(.body)
                .foregroundColor(.primary)
            Spacer()
            Toggle("", isOn: $isSelected)
                .toggleStyle(SwitchToggleStyle(tint: .green))
                .labelsHidden()
        }
        .padding(.horizontal)
    }
}

// MARK: - Previews
#Preview {
    ContentView()
}
