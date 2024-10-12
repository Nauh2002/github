import nivel1.*
object rick {
  var posicion = game.at(5,5)
  var imageRick = "rick0.png"
  //const pasos = game.sound("pasos.mp3")
  
  
  method image () = imageRick
  method position() = posicion

  method derecha() {
    //pasos.shouldLoop(true)
    //pasos.play()
    imageRick = "rick7.png"
    posicion = posicion.right(0.5)
    game.schedule(200, {imageRick = "rick6.png"})
    posicion = posicion.right(0.5)
    //pasos.resume()

  }

  method izquierda() {
    //pasos.shouldLoop(true)
    //pasos.play()
    imageRick = "rick3.png"
    posicion = posicion.left(0.5)
    game.schedule(200, {imageRick = "rick2.png"})
    posicion = posicion.left(0.5)
    //pasos.resume()
  }

  method arriba() {
    //pasos.shouldLoop(true)
    //pasos.play()
    imageRick = "rick5.png"
    posicion = posicion.up(0.5)
    game.schedule(200, {imageRick = "rick4.png"})
    posicion = posicion.up(0.5)
    //pasos.resume()
  }

  method abajo() {
    //pasos.shouldLoop(true)
    //pasos.play()
    imageRick = "rick1.png"
    posicion = posicion.down(0.5)
    game.schedule(200, {imageRick = "rick0.png"})
    posicion = posicion.down(0.5)
    //pasos.resume()
  }

  method limitador() {
    if(self.position().y() < (game.height() - 1)){
        self.arriba()
    }
  }

  method limitador2() {
    if(self.position().y() > (game.height() - game.width())){
        self.abajo()
    }
  }

  method limitador3() {
    if(self.position().x() > (game.height() - game.width())){
        self.izquierda()
    }
  }

  method limitador4() {
    if(self.position().x() < (game.width() - 1)){
        self.derecha()
    }
  }
  

}

class Ratas {
  var posicion
  var imageRata = "rata0.png"
  var property ratas = []
  
  method image () = imageRata
  method position() = posicion

  method derecha() {
    imageRata = "rata7.png"
    posicion = posicion.right(0.5)
    game.schedule(200, {imageRata = "rata6.png"})
    posicion = posicion.right(0.5)
    
  }

  method izquierda() {
    imageRata = "rata3.png"
    posicion = posicion.left(0.5)
    game.schedule(200, {imageRata = "rata2.png"})
    posicion = posicion.left(0.5)
    
  }

  method arriba() {
    imageRata = "rata5.png"
    posicion = posicion.up(0.5)
    game.schedule(200, {imageRata = "rata4.png"})
    posicion = posicion.up(0.5)
    
  }

  method abajo() {
    imageRata = "rata1.png"
    posicion = posicion.down(0.5)
    game.schedule(200, {imageRata = "rata0.png"})
    posicion = posicion.down(0.5)

  }


  method perseguir() {
    if(rick.position().x() > self.position().x()){
      self.derecha()
    } else if (rick.position().x() < self.position().x()){
      self.izquierda()
    }

    if(rick.position().y() > self.position().y()){
      self.arriba()
    } else if (rick.position().y() < self.position().y()){
      self.abajo()
    }  
  }



//method atrapo(player) {
	//game.addVisual(gameOver)
  //game.schedule(0000, { game.stop() })
//}
}

/* object aparecerRatas{
var property ratas = []

const x = 0.randomUpTo(6).truncate(0)
const y = 0.randomUpTo(6).truncate(0)

method generarRatas(maxRatas) {
	if (ratas.size() < maxRatas) {
		const nuevaRata = new Ratas(posicion = game.at(x, y))
		game.addVisual(nuevaRata)
		ratas.add(nuevaRata)
	}
}

method moverALasRatas() {
	ratas.forEach({ z => z.perseguir()})
}

method removerRatas(rata) = rata.remove(rata)
} */

const rata  = new Ratas(posicion = game.at(3.randomUpTo(6).truncate(0),3.randomUpTo(6).truncate(0)))
const rata2 = new Ratas(posicion = game.at(3.randomUpTo(6).truncate(0),3.randomUpTo(6).truncate(0)))
const rata3 = new Ratas(posicion = game.at(3.randomUpTo(6).truncate(0),3.randomUpTo(6).truncate(0)))


