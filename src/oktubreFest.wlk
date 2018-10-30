

class CarpaCervecera {
	
	var property limiteDeGente
	var property marcaQueSirve
	var property hayMusicos= false
	
	
	method marcaDeCervezaQueVende(){}
	
}

class Jarras{
	var capacidadEnLitros
	var marca
	
	method cantidadDeAlcohol()=0
}

class Persona{
	var peso
	var aguante
	var cervezasCompradas=#{}
	var property gustaMusicaTradicional = false
	
	
	method alcoholIngerido(){
		return cervezasCompradas.sum({ cerveza=> cerveza.cantidadDeAlcohol() })
	}
	
	method estaEbria(){
		return self.alcoholIngerido()*peso > aguante
	}
	
}

class Aleman inherits Persona{
	method nacionalidad()= "aleman"
	
	method gustaUna(marca)= true
	
}

class Marca{
	var property gramosDeLupulo
		
}


