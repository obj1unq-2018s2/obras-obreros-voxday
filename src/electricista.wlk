import obrero.*
import uocra.*

class Electricista inherits Obrero {
	const consumoMetrosCable = 4
	const consumoCintaAisladora = 1

	override method trabajarEn(obra) {
		obra.consumirMetrosDeCable(consumoMetrosCable)
		obra.consumirCinta(consumoCintaAisladora)
		obra.colocarCableElectrico(4)
	}
	
	override method importeJornal() = uocra.jornalElectricista()	
}

