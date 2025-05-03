object nave {
  const pasajeros = #{neo, morfeo, trinity}
  
  method cuantosPasajerosHay() = pasajeros.size()
  
  method pasajeroMayorVitalidad() = pasajeros.max({ p => p.vitalidad() })
  
  method pasajeroMenorVitalidad() = pasajeros.min({ p => p.vitalidad() })
  
  method estaEquilibrada() = self.pasajeroMayorVitalidad().vitalidad() < (self.pasajeroMenorVitalidad().vitalidad() * 2)
  
  method estaElElegido() = pasajeros.any({ p => p.esElElegido() })
  
  method chocar() {
    pasajeros.forEach({ p => p.salta() })
    pasajeros.clear()
  }
  
  method acelerar() {
    pasajeros.filter({ p => not p.esElElegido() }).forEach({ p => p.salta() })
  }
}

object neo {
  var energia = 100
  
  method esElElegido() = true
  
  method salta() {
    energia *= 0.5
  }
  
  method vitalidad() = energia * 0.1
}

object morfeo {
  var vitalidad = 8
  var estaDescansado = true
  
  method esElElegido() = false
  
  method salta() {
    estaDescansado = not estaDescansado
    vitalidad = (vitalidad - 1).max(0)
  }
  
  method vitalidad() = vitalidad
}

object trinity {
  method esElElegido() = false
  
  method vitalidad() = 0
  
  method salta() {
    
  }
}