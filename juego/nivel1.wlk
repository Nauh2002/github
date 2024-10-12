import wollok.game.*
import player.*

object suelo {
  method image () = "fondo1.jpg"
  method position() = game.origin()
}

class Portales {
  var image = "portal0.png"
  var position

  method image () = image
  method position() = position
  
  method titila() {
    image = "portal1.png"
    game.schedule(75, {image = "portal2.png"})
    game.schedule(75, {image = "portal3.png"})
    game.schedule(75, {image = "portal0.png"})
}           
}

const portal = new Portales(position = game.at(0,5))
const portal2 = new Portales(position = game.at(11,5))

class Armas {
  var position
  var image

  method position () = position

  method image () = image

  method titila () {
    image = "gun1.png"
    game.schedule(400, {image = "gun0.png"})
  }
}

const arma = new Armas(position = game.at(3,3), image = "gun0.png")

class Placas {
  var position
  var image

  method position () = position

  method image () = image

  method titila () {
    image = "placa1.png"
    game.schedule(400, {image = "placa0.png"})
  }
}

const placa = new Placas (position = game.at(4,4), image = "placa0.png")

object jugarla {
  const ancho = 12 //se mide en celdas de 50 x 50px
  const alto = 12  //se mide en celdas de 50 x 50px
  // Sonido libertadores
  //const libertadores = game.sound("libertadores.mp3")
   
  method jugar() {
    game.addVisual(suelo)
    game.title("Pickle Rick")
    game.height(alto) 
	  game.width(ancho)
    game.addVisual(portal)
    game.addVisual(portal2)
    game.addVisual(arma)
    game.addVisual(placa)
    game.addVisual(rata)
    game.addVisual(rata2)
    game.addVisual(rata3)
    game.addVisualCharacter(rick)
    //libertadores.shouldLoop(true)
    //libertadores.play()
    keyboard.w().onPressDo({ rick.limitador() })
    keyboard.s().onPressDo({ rick.limitador2() })
    keyboard.a().onPressDo({ rick.limitador3() })
    keyboard.d().onPressDo({ rick.limitador4() })
    //keyboard.z().onPressDo({libertadores.volume(0)})
    //keyboard.x().onPressDo({libertadores.volume(1)})
    keyboard.c().onPressDo({ game.say(rick, "holis") })
    game.onTick(300, "titilaPortal", {portal.titila()})
    game.onTick(300, "titilaPortal2", {portal2.titila()})
    game.onTick(2000, "titilaArma", {arma.titila()})
    game.onTick(2000, "titilaPlaca", {placa.titila()})
   // game.onTick(400, "distanciaConRickX", {rata.guardarPositionRicX()})
    //game.onTick(400, "distanciaConRickY", {rata.guardarPositionRicY()})
    game.onTick(400, "perseguir", {rata.perseguir()})
    game.onTick(600, "perseguir", {rata2.perseguir()})
    game.onTick(800, "perseguir", {rata3.perseguir()})
    //game.onTick(8000, "agregaRatas", { aparecerRatas.generarRatas(2)  })
    //game.onTick(1000, "moverRatas", { aparecerRatas.moverALasRatas() })
    //game.whenCollideDo(rick, { algo => algo.atrapo(rick) })
  }


}

//object gameOver {
	//method position() = game.center()
	//method text() = "GAME OVER"
//}

//EJEMPLO DE SONIDO
//object sonidoInicial {
  // Se llama el metodo con "libertadores.play"
  // tener en cuenta que esto es para que suene
  // hasta que termine.
  //method play(){
    //game.sound("libertadores.mp3").play()
  //}

  // Si uno quiere que se detenga, se usa
  // -const "nombre" = game.sound("zaraza.mp3")-
  // Se lo llama 
  // -nombre.shouldLoop(true)-
  // Se le pone play con
  // -nombre.play()-
  // Y se lo detiene con 
  // nombre.stop()
//}

object sonidoPasos{

  method play(){
    game.sound("muerte.mp3").play()
  }

}




