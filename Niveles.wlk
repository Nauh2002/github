import wollok.game.*
import PickleRick.*
import Config.*
import Enemigos.*
import Objetos.*
import intro.*
import Mapas.*


//--------------------- Nivel 1 --------------------
object niveles {
  const ancho = 12 //se mide en celdas de 50 x 50px
  const alto = 12  //se mide en celdas de 50 x 50px
  const fondo = game.sound("fondo.mp3")

    method sonidoFondo() {
      fondo.shouldLoop(true)
      keyboard.down().onPressDo({ fondo.volume(0) }) 
      keyboard.up().onPressDo({fondo.volume(1)})
      fondo.play()
    }
  

  method nivel1() {
      game.clear()
      config.configurarTeclasRick()

      game.addVisual(mapa0)
      game.title("Pickle Rick")
      game.height(alto) 
      game.width(ancho)

      config.printearLoQueTenemos()

      config.crearPortal(0,5)
      config.crearPortal(11,5)

      config.crearPlaca(4,4)

      config.crearArma(3,3)

      config.crearRata()
      config.crearRata()
      config.crearRata()

      game.addVisual(rick)
      game.addVisual(vidaRick)

      self.sonidoFondo()
      
    }

  method nivel2() {
      game.clear()
      config.configurarTeclasRick()

      game.addVisual(mapa1)
      game.title("Pickle Rick")
      game.height(alto) 
      game.width(ancho)

      config.printearLoQueTenemos()

      config.crearPortal(0,5)
      config.crearPortal(11,5)
      
      config.crearPlaca(3,4)

      config.crearRata()

      game.addVisual(rick)

      config.textoCharlado(3000, 6000, saludo2)//Pruebas
      self.sonidoFondo()

    }

  method nivel3() {
      game.clear()
      config.configurarTeclasRick()
      
      game.addVisual(mapa2)
      game.title("Pickle Rick")
      game.height(alto) 
      game.width(ancho)

      config.crearPortal(0,5)
      config.crearPortal(11,5)

      config.crearPlaca(2,4)

      config.printearLoQueTenemos()
      
      config.crearRata()
      game.addVisual(rick)
      config.textoCharlado(3000, 6000, saludo2)//Pruebas
      self.sonidoFondo()

    }

  method nivel4() {
      game.clear()
      config.configurarTeclasRick()
      
      game.addVisual(mapa3)
      game.title("Pickle Rick")
      game.height(alto) 
      game.width(ancho)

      config.printearLoQueTenemos()

      config.crearPortal(0,5)
      config.crearPortal(11,5)
      
      config.crearRata()
      game.addVisual(rick)
      config.textoCharlado(3000, 6000, saludo2) //Pruebas
      self.sonidoFondo()

    }

  method nivel5() {
      game.clear()
      config.configurarTeclasRick()
      
      game.addVisual(mapa4)
      game.title("Pickle Rick")
      game.height(alto) 
      game.width(ancho)

      config.printearLoQueTenemos()
      
      config.crearRata()
      game.addVisual(rick)
      config.textoCharlado(3000, 6000, saludo2) //Pruebas
      self.sonidoFondo()
    }


    method gameOver(){
      fondo.stop()
      game.clear()
      game.addVisual(gameOver)
      keyboard.r().onPressDo({primeraPantalla.inicio()})
      primeraPantalla.habilitador()
      rick.reiniciarVida()
      rick.reiniciarPosicion()
      rick.soltarObjetos()
    }

    method winner(){
      fondo.stop()
      game.clear()
      game.addVisual(winner)
      keyboard.r().onPressDo({primeraPantalla.inicio()})
      primeraPantalla.habilitador()
      rick.reiniciarVida()
      rick.reiniciarPosicion()
    }

}

object gameOver {
    method position() = game.origin()
    method image() = "GameOver2.jpg"
  
}

object winner {
    method position() = game.origin()
    method image() = "Winner2.jpg"
}


