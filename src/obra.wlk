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
	var plantillaDeObreros = []
	
	method habitaciones()	
	method pisos()
	method banios() 
	
	method recepcion(material){
		
	}
	method estaEnLaPlantilla(obrero) = plantillaDeObreros.contains(obrero)
	
	method obrerosDisponibles() = plantillaDeObreros.filter{obrero => not (obrero.estaDeLicencia())}
	
	method agregar(obrero){
		plantillaDeObreros.add(obrero)
	}
	
	method quitar(obrero){
		plantillaDeObreros.remove(obrero)
	}
	
	method jornadaLaboral(){
		self.obrerosDisponibles().forEach {obrero => obrero.consumo(self)}
	}
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
	override method pisos() = pisos
}

