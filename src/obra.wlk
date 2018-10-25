import obrero.*

class Obra {
	var property ladrillos
	var property metrosDeCanio
	var property metrosDeCable
	var property cinta
	var property fosforos
	var property arandelas
	
	var plantillaObreros = #{}

	method agregarObrero(obrero) {
		plantillaObreros.add(obrero)
	}

	method quitarObrero(obrero) {
		plantillaObreros.remove(obrero)
	}

	method registrarJornada() {
		self.obrerosDisponibles()
			.forEach({ obrero => obrero.trabajarEn(self)})
	}

	method obrerosDisponibles() {
		return plantillaObreros.filter { obrero => !obrero.estaDeLicencia() }
	}

	method estaEnLaPlantilla(obrero) {
		return plantillaObreros.contains(obrero)
	}

	method consumirLadrillos(cant) {
		ladrillos = ladrillos - cant
	}

	method consumirMetrosDeCanio(cant) {
		metrosDeCanio = metrosDeCanio - cant
	}

	method consumirMetrosDeCable(cant) {
		metrosDeCable = metrosDeCable - cant
	}

	method consumirCinta(cant) {
		cinta = cinta - cant
	}

	method consumirFosforos(cant) {
		fosforos = fosforos - cant
	}

	method consumirArandelas(cant) {
		arandelas = arandelas - cant
	}

}

