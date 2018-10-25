import obrero.*

class Gasista inherits Obrero {
	const consumoMetrosCanios = 3
	const consumoFosforos = 20

	override method trabajarEn(obra) {
		obra.consumirMetrosDeCanio(consumoMetrosCanios)
		obra.consumirFosforos(consumoFosforos)
	}
}

