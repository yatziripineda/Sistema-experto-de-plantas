import SwiftUI
import Combine

struct ResultadoView: View {
    @ObservedObject var modelo: DiagnosticoModelo
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack(spacing: 16) {
            if modelo.resultados.isEmpty {
                VStack(alignment: .leading, spacing: 12) {
                    Text("Diagnóstico:")
                        .font(.headline)
                    Text("No se encontró un diagnóstico para esos síntomas.")
                        .foregroundColor(.red)
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 10).fill(Color(.systemGray6)))
                .shadow(radius: 1)

                VStack(alignment: .leading, spacing: 12) {
                    Text("Tratamiento:")
                        .font(.headline)
                    Text("Sin tratamiento disponible")
                        .foregroundColor(.secondary)
                        .italic()
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 10).fill(Color(.systemGray6)))
                .shadow(radius: 1)

                Spacer()

                Button("Editar selección") {
                    dismiss()
                }
                .buttonStyle(.borderedProminent)
                .padding(.bottom)
            } else {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Diagnósticos probables")
                        .font(.title3).bold()
                    Text("Ordenados por coincidencia de síntomas")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                .frame(maxWidth: .infinity, alignment: .leading)

                ScrollView {
                    LazyVStack(alignment: .leading, spacing: 12) {
                        ForEach(modelo.resultados) { res in
                            VStack(alignment: .leading, spacing: 8) {
                                HStack {
                                    Text(res.diagnostico)
                                        .font(.headline)
                                    Spacer()
                                    Text(String(format: "%.2f%%", res.porcentaje))
                                        .font(.subheadline)
                                        .bold()
                                        .padding(.horizontal, 8)
                                        .padding(.vertical, 4)
                                        .background(Color.blue.opacity(0.1))
                                        .cornerRadius(8)
                                }
                                VStack(alignment: .leading, spacing: 4) {
                                    Text("Tratamiento sugerido:")
                                        .font(.subheadline)
                                        .foregroundColor(.secondary)
                                    Text(res.tratamiento)
                                }
                            }
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 12).fill(Color(.systemGray6)))
                            .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(Color(.systemGray4), lineWidth: 1)
                            )
                        }
                    }
                }

                Spacer(minLength: 8)

                Button("Editar selección") {
                    dismiss()
                }
                .buttonStyle(.borderedProminent)
                .padding(.bottom)
            }
        }
        .padding()
        .navigationTitle("Resultado")
    }
}

#Preview {
    let modelo = DiagnosticoModelo()
    modelo.seleccionSintomas = ["hojas_lacias", "color_apagado"]
    modelo.actualizarDiagnostico()
    return NavigationView {
        ResultadoView(modelo: modelo)
    }
}
