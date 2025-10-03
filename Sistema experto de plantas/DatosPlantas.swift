import Foundation

struct Regla {
    let sintomas: [String]
    let diagnostico: String
    let tratamiento: String
}

let listaClaves = [
    "hojas_lacias",
    "color_apagado",
    "sustrato_muy_ligero",
    "amarilleo_general",
    "mal_olor_en_suelo",
    "raices_marron_blandas",
    "maceta_sin_drenaje",
    "manchas_marron_lado_soleado",
    "tejido_pardo_en_lado_con_sol",
    "hojas_verde_claro",
    "tallos_alargados",
    "planta_se_inclina_hacia_luz",
    "caida_de_hojas_viejas",
    "puntas_bordes_amarillos_o_marrones",
    "costra_blanca_en_sustrato",
    "caida_hojas",
    "caida_flores",
    "cambio_reciente_de_lugar",
    "baja_luz_interior_en_invierno",
    "ampollas_hoja",
    "crecimientos_corchosos_de_color_blanco",
    "riego_irregular",
    "hojas_marchitas_o_manchadas_tras_frio",
    "exposicion_a_bajas_temperaturas",
    "moteado_hojas",
    "telarañas_finas",
    "hojas_amarillas_sucias",
    "bultos_escamosos_en_tallos_hojas",
    "hojas_amarillas",
    "melaza_pegajosa",
    "brotes_deformados",
    "hojas_pequenas",
    "colonia_de_insectos_en_brotes_y_envés",
    "melaza",
    "masas_blancas_algodonosas_en_axilas_y_tallos",
    "mosquitas_blancas_salen_al_agitar",
    "larvas_escamosas_en_envés",
    "hojas_moteadas_amarillas",
    "estrias_plateadas",
    "deformacion_brotes",
    "floraciones_afectadas",
    "adultos_pequenos_negros_volando_al_mover",
    "planta_debil",
    "sustrato_cronicamente_humedo",
    "polvo_blanco_en_hojas_tallos_flores",
    "moho_blanco_que_luego_grisea_en_hojas_flores",
    "alta_humedad",
    "tallo_aniquilado",
    "mal_olor",
    "suelo_muy_humedo",
    "moteado_en_anillos_o_patrones_irregulares",
    "sin_plagas_visibles",
    "progreso_interno",
    "hojas_nuevas_amarillas_con_venas_verdes",
    "amarilleo_en_hojas_viejas_desde_bordes_hacia_dentro",
    "crecimiento_reducido",
]

let listaNombres = [
    "Hojas lacias",
    "Color apagado",
    "Sustrato muy ligero",
    "Amarilleo general",
    "Mal olor en suelo",
    "Raíces marrón blandas",
    "Maceta sin drenaje",
    "Manchas marrón (lado soleado)",
    "Tejido pardo en lado con sol",
    "Hojas verde claro",
    "Tallos alargados",
    "Planta se inclina hacia la luz",
    "Caída de hojas viejas",
    "Puntas/bordes amarillos o marrones",
    "Costra blanca en sustrato",
    "Caída hojas",
    "Caída de flores",
    "Cambio reciente de lugar",
    "Baja luz interior en invierno",
    "Ampollas en hoja",
    "Crecimientos corchosos de color blanco",
    "Riego irregular",
    "Hojas marchitas o manchadas tras frío",
    "Exposición a bajas temperaturas",
    "Moteado en hojas",
    "Telarañas finas",
    "Hojas amarillas sucias",
    "Bultos escamosos en tallos/hojas",
    "Hojas amarillas",
    "Melaza pegajosa",
    "Brotes deformados",
    "Hojas pequeñas",
    "Colonia de insectos en brotes y envés",
    "Melaza",
    "Masas blancas algodonosas en axilas y tallos",
    "Mosquitas blancas (salen al agitar)",
    "Larvas escamosas en envés",
    "Hojas moteadas amarillas",
    "Estrías plateadas",
    "Deformación de brotes",
    "Floraciones afectadas",
    "Adultos pequeños negros volando al mover",
    "Planta débil",
    "Sustrato crónicamente húmedo",
    "Polvo blanco en hojas/tallos/flores",
    "Moho blanco que luego grisea en hojas/flores",
    "Alta humedad",
    "Tallo aniquilado",
    "Mal olor",
    "Suelo muy húmedo",
    "Moteado en anillos o patrones irregulares",
    "Sin plagas visibles",
    "Progreso interno",
    "Hojas nuevas amarillas con venas verdes",
    "Amarilleo en hojas viejas desde bordes hacia dentro",
    "Crecimiento reducido",
]

let reglas: [Regla] = [
    // ---- Condiciones ambientales (MBG) ----
    Regla(
        sintomas: ["hojas_lacias", "color_apagado", "sustrato_muy_ligero"],
        diagnostico: "Sequía (demasiado seco)",
        tratamiento: "Rehidratar bien el sustrato (posible remojo inicial), ajustar el riego y aprender el peso de la maceta como guía."
    ),
    Regla(
        sintomas: ["hojas_lacias", "amarilleo_general", "mal_olor_en_suelo", "raices_marron_blandas", "maceta_sin_drenaje"],
        diagnostico: "Exceso de riego / asfixia radicular",
        tratamiento: "Revisar raíces; si hay pudrición, sanear y reponer sustrato. Nunca dejar la maceta en agua; usar maceta con drenaje."
    ),
    Regla(
        sintomas: ["manchas_marron_lado_soleado"],
        diagnostico: "Quemadura solar",
        tratamiento: "Mover a luz indirecta y retirar tejido muy dañado."
    ),
    Regla(
        sintomas: ["hojas_verde_claro", "tallos_alargados", "planta_se_inclina_hacia_luz", "caida_de_hojas_viejas"],
        diagnostico: "Falta de luz",
        tratamiento: "Aumentar la luz (luz brillante indirecta o luz artificial) y rotar la planta periódicamente."
    ),
    Regla(
        sintomas: ["puntas_bordes_amarillos_o_marrones", "costra_blanca_en_sustrato"],
        diagnostico: "Acumulación de sales",
        tratamiento: "Lavar el sustrato dejando correr agua 3-4 veces por la maceta y trasplantar periódicamente."
    ),
    Regla(
        sintomas: ["caida_hojas", "caida_flores", "cambio_reciente_de_lugar", "baja_luz_interior_en_invierno"],
        diagnostico: "Caída por estrés/traslado",
        tratamiento: "Verificar riego/luz, permitir aclimatación, mejorar humedad ambiental si viene del exterior."
    ),
    Regla(
        sintomas: ["ampollas_hoja", "crecimientos_corchosos_de_color_blanco", "riego_irregular"],
        diagnostico: "Edema (Oedema)",
        tratamiento: "Regular el riego, evitar fluctuaciones y exceso de agua."
    ),
    Regla(
        sintomas: ["hojas_marchitas_o_manchadas_tras_frio", "exposicion_a_bajas_temperaturas"],
        diagnostico: "Daño por enfriamiento",
        tratamiento: "Ubicar en sitio más cálido, retirar hojas muy dañadas; evitar suelo frío y mojado."
    ),

    // ---- Plagas (MBG + manejo general MBG) ----
    Regla(
        sintomas: ["moteado_hojas", "telarañas_finas", "hojas_amarillas_sucias"],
        diagnostico: "Araña roja (ácaros)",
        tratamiento: "Aislar, limpiar hojas, aumentar humedad y aplicar jabón insecticida/aceite hortícola según etiqueta."
    ),
    Regla(
        sintomas: ["bultos_escamosos_en_tallos_hojas", "hojas_amarillas", "melaza_pegajosa"],
        diagnostico: "Cochinilla/escama (Scale)",
        tratamiento: "Retirar manualmente y tratar con jabón insecticida u aceite hortícola; repetir aplicaciones."
    ),
    Regla(
        sintomas: ["brotes_deformados", "hojas_pequenas", "colonia_de_insectos_en_brotes_y_envés", "melaza_pegajosa"],
        diagnostico: "Pulgones (Aphids)",
        tratamiento: "Lavar con agua/jabón potásico y usar aceite hortícola si persiste."
    ),
    Regla(
        sintomas: ["masas_blancas_algodonosas_en_axilas_y_tallos"],
        diagnostico: "Cochinilla algodonosa (Mealybug)",
        tratamiento: "Retirar con hisopo y alcohol y aplicar jabón/aceite hortícola; revisar rebrotes."
    ),
    Regla(
        sintomas: ["mosquitas_blancas_salen_al_agitar", "larvas_escamosas_en_envés", "hojas_moteadas_amarillas"],
        diagnostico: "Mosca blanca (Whiteflies)",
        tratamiento: "Aislar, lavar, trampas amarillas y jabón/aceite hortícola; constancia en el control."
    ),
    Regla(
        sintomas: ["estrias_plateadas", "deformacion_brotes", "floraciones_afectadas"],
        diagnostico: "Trips",
        tratamiento: "Aislar, sanear flores/hojas afectadas y aplicar insecticida acorde a etiqueta (aceites/jabón)."
    ),
    Regla(
        sintomas: ["adultos_pequenos_negros_volando_al_mover", "planta_debil", "sustrato_cronicamente_humedo"],
        diagnostico: "Mosquitos del sustrato (Fungus gnats)",
        tratamiento: "Dejar secar la capa superior del sustrato, evitar encharcamientos y mejorar drenaje."
    ),

    // ---- Enfermedades (MBG) ----
    Regla(
        sintomas: ["polvo_blanco_en_hojas_tallos_flores"],
        diagnostico: "Oídio (Powdery mildew)",
        tratamiento: "Podar tejido afectado y aumentar la ventilación alrededor de la planta."
    ),
    Regla(
        sintomas: ["moho_blanco_que_luego_grisea_en_hojas_flores", "alta_humedad"],
        diagnostico: "Moho gris (Botrytis)",
        tratamiento: "Retirar flores marchitas, sanear y mejorar circulación de aire; higiene del entorno."
    ),
    Regla(
        sintomas: ["raices_marron_blandas", "tallo_aniquilado", "mal_olor_en_suelo", "suelo_muy_humedo"],
        diagnostico: "Pudriciones (especialmente de raíz)",
        tratamiento: "Descartar plantas con pudrición radicular extensa; si es localizado, podar y replantar en sustrato nuevo y drenante."
    ),
    Regla(
        sintomas: ["moteado_en_anillos_o_patrones_irregulares", "sin_plagas_visibles", "progreso_interno"],
        diagnostico: "Virus",
        tratamiento: "No hay cura efectiva; aislar y descartar para evitar diseminación."
    ),

    // ---- Deficiencias nutricionales (MBG) ----
    Regla(
        sintomas: ["hojas_nuevas_amarillas_con_venas_verdes"],
        diagnostico: "Clorosis férrica (deficiencia de hierro)",
        tratamiento: "Ajustar manejo y utilizar quelatos de hierro; revisar pH si la especie prefiere sustrato ácido."
    ),
    Regla(
        sintomas: ["amarilleo_en_hojas_viejas_desde_bordes_hacia_dentro", "crecimiento_reducido"],
        diagnostico: "Deficiencia de nitrógeno",
        tratamiento: "Aplicar fertilizante con nitrógeno y mantener un plan de fertilización balanceado."
    ),
]
