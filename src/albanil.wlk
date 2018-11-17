import obrero.*
import uocra.*

class Albanil inherits Obrero {
	const consumoLadrillos = 100

	override method trabajarEn(obra) {
		obra.consumirLadrillos(consumoLadrillos)
		obra.levantarPared(3)
	}

	override method importeJornal() = uocra.jornalAlbanil()	
}