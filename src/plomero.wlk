import obrero.*
import uocra.*

class Plomero inherits Obrero {
	const consumoMetrosCanio = 10
	const consumoArandelas = 30

	override method trabajarEn(obra) {
		obra.consumirMetrosDeCanio(consumoMetrosCanio)
		obra.consumirArandelas(consumoArandelas)
		obra.colocarImplementosDeAgua(0.5)
	}
	
	override method importeJornal() = uocra.jornalEspecialistaBanioCocina()	
	
}

