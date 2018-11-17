import obrero.*
import uocra.*

class Gasista inherits Obrero {
	const consumoMetrosCanios = 3
	const consumoFosforos = 20

	override method trabajarEn(obra) {
		obra.consumirMetrosDeCanio(consumoMetrosCanios)
		obra.consumirFosforos(consumoFosforos)
		obra.colocarImplementosDeGas(1)
	}

	override method importeJornal() = uocra.jornalEspecialistaBanioCocina()	
}

