import obrero.*

class Albanil inherits Obrero {
	const consumoLadrillos = 100

	override method trabajarEn(obra) {
		obra.consumirLadrillos(consumoLadrillos)
	}
}