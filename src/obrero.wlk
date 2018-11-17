class Obrero {
	var property estaDeLicencia = false
	const property obrasEnLasQueTrabajo = #{}
	var property cantidadJornalesAdeudados = 0

	method trabajarEn(obra)
	
	method seAgregaAPlantilla(obra) { obrasEnLasQueTrabajo.add(obra) }
	
	method pasoPor(obra) = obrasEnLasQueTrabajo.contains(obra)
	
	method registrarJornadaDeTrabajo(obra) {
		self.trabajarEn(obra)
		cantidadJornalesAdeudados += 1
	}
	
	method importeAdeudado() { 
		return cantidadJornalesAdeudados * self.importeJornal()
	}
	
	method importeJornal()
	
	method cancelarJornalesAdeudados() { cantidadJornalesAdeudados = 0 }
}

