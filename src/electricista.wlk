import obrero.*

class Electricista inherits Obrero {
	const consumoMetrosCable = 4
	const consumoCintaAisladora = 1

	override method trabajarEn(obra) {
		obra.consumirMetrosDeCable(consumoMetrosCable)
		obra.consumirCinta(consumoCintaAisladora)
	}
}

