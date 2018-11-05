

class Carpa {
	
	const  limiteDeGente
	//var property cervezaALaVenta
	var property cantidadDeGente=#{}
	var property marcaQueSirve
	const property hayMusicos= false
	
	
	//method marcaDeCervezaQueVende()= marcaQueSirve
	
	method puedeEntrar(persona){
		return not persona.estaEbria() and self.hayLugar()
	}
	
	method hayLugar(){
		return cantidadDeGente.size() < limiteDeGente
	}
	
	method hayCantidadPar(){
		return self.cantidadDeGente().size().even() 
	}
	
	
	method personaIngresa(persona){
		if(persona.puedoEntrarALa(self)){
			cantidadDeGente.add(persona)
			return true
		}
		else{
			self.error("No podes entrar ")
		}
	}
	
	method cantidadDeEbriosEmpedernidos(){
		return cantidadDeGente.count({ persona=> persona.ebrioEmpedermido() })
	}
	
}

class Jarras{
	var property capacidadEnLitros
	var property marca
	
	method cantidadDeAlcohol()= self.capacidadEnLitros()*self.marca().graduacion()
	method hechaEn()= self.marca().seFabricoEn()
}

class Persona{
	var peso
	var aguante
	var property cervezasCompradas=#{}
	var property gustaMusicaTradicional = false
	
	
	method alcoholIngerido(){
		return cervezasCompradas.sum({ cerveza=> cerveza.cantidadDeAlcohol() })
	}
	
	method estaEbria(){
		return self.alcoholIngerido()*peso > aguante
	}
	method gustaUna(marca)= true
	
	method quieroEntrarALa(carpa){
		return self.gustaUna(carpa.marcaQueSirve())  
			   and ( gustaMusicaTradicional == carpa.hayMusicos() )
			    
	}
	
	method puedoEntrarALa(carpa){
		return self.quieroEntrarALa(carpa) and carpa.puedeEntrar(self)
	}
	
	method ebrioEmpedermido(){
		return cervezasCompradas.all({ jarra=>jarra.capacidadEnLitros() >= 1 })
	}
	
}

class Aleman inherits Persona{
	method nacionalidad()= "alemania"
	
	override method gustaUna(marca)= true
	
	override method quieroEntrarALa(carpa){
		return super(carpa) and carpa.hayCantidadPar()
	}
	
	method esPatriota(){
		return self.cervezasCompradas().all({
			jarra=> jarra.hechaEn() == self.nacionalidad()
		})
	}
	
}

class Belgas inherits Persona{
	method nacionalidad()= "bulgaria"
	
	override method gustaUna(marca)= marca.gramosDeLupulo() > 4
	
	method esPatriota(){
		return self.cervezasCompradas().all({
			jarra=> jarra.hechaEn() == self.nacionalidad()
		})
	}
}

class Checos inherits Persona{
	method nacionalidad()= "republicaCheca"
	
	override method gustaUna(marca)= marca.graduacion() > 0.08

	method esPatriota(){
		return self.cervezasCompradas().all({
			jarra=> jarra.hechaEn() == self.nacionalidad()
		})
	}
	
}

class Cerveza{
	var property gramosDeLupulo
	var property seFabricoEn
	
	var graduacion
	
	method graduacion()
}

class CervezaRubia inherits Cerveza{
	override method graduacion()= graduacion
}

class CervezaNegra inherits Cerveza{
	override method graduacion(){
		return graduacionReglamentaria.graduacion().min(self.gramosDeLupulo()*2)
	}
}

class CervezaRoja inherits CervezaNegra{
	override method graduacion(){
		return super()*1.25
	}
}

object graduacionReglamentaria{
	var property graduacion
}



