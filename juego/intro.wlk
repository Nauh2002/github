import wollok.game.*
import nivel1.*

object mensajeInicio {
  method position() = game.at(5,5) //se mide en celdas de 50 x 50px
  method text() = "Presiona E para empezar"
  method textColor() = "#ffffffff"
}

object fondo0 {
  method image () = "menu.jpeg"
  method position() = game.at(-7,0)
}

object primeraPantalla {
  const ancho = 12 //se mide en celdas de 50 x 50px
  const alto = 12   //se mide en celdas de 50 x 50px
      
  method inicio() {
    game.title("Pickle Rick")
	  game.height(alto) 
	  game.width(ancho)  
    game.addVisual(fondo0)
    game.addVisual(mensajeInicio)
    keyboard.e().onPressDo({ 
      game.removeVisual(mensajeInicio)
      game.removeVisual(fondo0)
      jugarla.jugar() 
      })
  }
}
