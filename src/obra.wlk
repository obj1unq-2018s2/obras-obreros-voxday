import obrero.*

class Obra {
	var property ladrillos = 0
	var property metrosDeCanio = 0
	var property metrosDeCable = 0
	var property cinta = 0
	var property fosforos = 0
	var property arandelas = 0
	var property efectivo = 0
	var property metrosCuadradosConstruidos = 0
	var property implementosDeAguaColocados = 0
	var property implementosDeGasColocados = 0
	var property cablesElectricosColocados = 0
	
	var plantillaObreros = #{}

	method agregarObrero(obrero) {
		plantillaObreros.add(obrero)
		obrero.seAgregaAPlantilla(self)
	}

	method quitarObrero(obrero) {
		if (obrero.estaDeLicencia()) {
			self.error("Las leyes laborales están para respetarse - licencia implica estabilidad laboral")
		}
		plantillaObreros.remove(obrero)
	}

	method registrarJornada() {
		if (self.obrerosDisponibles().isEmpty()) {
			self.error("No hay obreros disponibles para trabajar")
		}
		self.obrerosDisponibles()
			.forEach({ obrero => obrero.registrarJornadaDeTrabajo(self)})
	}
	
	method importeAdeudadoEnJornales() {
		return plantillaObreros.sum { obrero => obrero.importeAdeudado() }
	}
	
	method pagarJornalesAdeudados() {
		efectivo -= self.importeAdeudadoEnJornales()
		plantillaObreros.forEach { obrero => obrero.cancelarJornalesAdeudados() }
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

	method levantarPared(metros) { metrosCuadradosConstruidos += metros }
	
	method colocarImplementosDeGas(cuantos) { implementosDeGasColocados += cuantos }

	method colocarImplementosDeAgua(cuantos) { implementosDeAguaColocados += cuantos }
	
	method colocarCableElectrico(cuanto) { cablesElectricosColocados += cuanto }
	
	method cantidadNecesariaPared() = 50 * self.habitaciones()
	method cantidadNecesariaImplementosAgua() = 10 * self.banios()
	method cantidadNecesariaImplementosGas() = 8 * self.banios() + 3 * self.habitaciones()
	method cantidadNecesariaCablesElectricos() = 50 * self.habitaciones() + 100 * self.pisos()	
	method habitaciones()
	
	method pisos()
	
	method banios() 
}


class Casa inherits Obra {
	var property habitaciones = 3
	var property banios = 1
	
	override method habitaciones() = habitaciones
	override method banios() = banios
	
	override method pisos() = 1
}

class Edificio inherits Obra {
	var property pisos = 4
	var property departamentosPorPiso = 5
	var property habitacionesPorDepartamento = 3
	var property ascensores = 2
	
	method departamentos() = pisos * departamentosPorPiso
	
	override method habitaciones() = self.departamentos() * habitacionesPorDepartamento
	
	override method	cantidadNecesariaCablesElectricos() = super() + 300 * self.ascensores()
}

