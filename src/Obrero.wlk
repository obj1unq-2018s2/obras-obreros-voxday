import obra.*

class Obrero {
	
	var property  estaDeLicencia
	 
	/* 
	method estaDeLicencia(obra){
		return not(obra.obrerosDisponibles().contains(self))
	} */
	
	method consumo(obra)
}

class Gasista inherits Obrero {
	override method consumo(obra){
		obra.metrosDeCanio() - 3
		obra.fosforos() -20
	}
}

class Plomero inherits Obrero {
	override method consumo(obra){
		obra.metrosDeCanio() - 10
		obra.arandelas() - 30
	}
}

class Electricista inherits Obrero {
	override method consumo(obra){
		obra.metrosDeCable() - 4
		obra.cinta() -1
	}
}

class Albanil inherits Obrero{
	override method consumo(obra){
		obra.ladrillos() - 100
	}
}