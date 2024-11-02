import Enemigos.*
import wollok.game.*
import Config.*
import Objetos.*
import intro.*
import Mapas.*
import Niveles.*
//-------------------   PICKLE RICK -------------------
object rick {
  
  var posicion = game.at(5,5) // posicion inicial de Rick
  var imageRick = "rickfrente1.png" // Imagen0 de Rick 

  const property objetos = [] // Lista de objetos agarrados

  const property lasers = []

  var property vida = 50 // vida inicial de rick
  
  method poder() {
    
  }// Obetiene el poder del arma ? o solo el laser tiene el poder y listo 

  method reiniciarVida(){
    vida = 50
  }

  method reiniciarPosicion(){
    posicion = game.at(5,5)
    imageRick = "rickfrente1.png"
  }

  method morir() {
        if (self.vida()==0) {game.removeVisual(self)}
      
    }// si la vida llega a 0  GAME OVER

  method estasSiendoAtacado() {
    game.whenCollideDo(self, {enemigo => (self.vidaRestar(enemigo))})
    
  }


  method vidaRestar(enemigo) {
    vida-=enemigo.poder()
    if(vida <= 0){
      niveles.gameOver()
    }
    }//Se le resta a la vida el poder del personaje que lo ataque

    //agregar transicion de colores en vida y barra pero en config

  method image () = imageRick 
  method position() = posicion

  method derecha() {
    if(self.position().x() < (game.width() - 1)){
      sonido.play("pasos3.mp3")
      //pasos.play()
      imageRick = "rickderecha2.png"
      posicion = posicion.right(0.5)
      game.schedule(200, {imageRick = "rickderecha1.png"})
      posicion = posicion.right(0.5)
    }  
  }

  method izquierda() {
    if(self.position().x() > 0){
      sonido.play("pasos3.mp3")
      //pasos.play()
      imageRick = "rickizquierda2.png"
      posicion = posicion.left(0.5)
      game.schedule(200, {imageRick = "rickizquierda1.png"})
      posicion = posicion.left(0.5)
    }  
  }

  method arriba() {
    if(self.position().y() < (game.height() - 2)){
      sonido.play("pasos3.mp3")
      //pasos.play()
      imageRick = "rickespalda2.png"
      posicion = posicion.up(0.5)
      game.schedule(200, {imageRick = "rickespalda1.png"})
      posicion = posicion.up(0.5)
    }  
  }

  method abajo() {
    if(self.position().y() > 0){
      sonido.play("pasos3.mp3")
      //pasos.play()
      imageRick = "rickfrente2.png"
      posicion = posicion.down(0.5)
      game.schedule(200, {imageRick = "rickfrente1.png"})
      posicion = posicion.down(0.5)
    }  
  }

  method esPortal(objeto){
    if (objeto.className() == "Objetos.Portales"){
      //objeto.mapa()
      mapaRandom.elegirMapa()
    } else {self.agarrar(objeto)}
  }
  
  method agarrar(objeto) {
    objetos.add(objeto)
		objeto.agarrado(objeto)
  }

  method soltarObjetos(){
    objetos.clear()
    lasers.clear()
  }

}

