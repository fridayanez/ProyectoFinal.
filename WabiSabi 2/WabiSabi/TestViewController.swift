

import UIKit

class TestViewController: UIViewController {
    
    @IBOutlet weak var preguntasLbl: UITextField!
    
    @IBOutlet weak var respuesta1: UIButton!
    
    @IBOutlet weak var respuesta2: UIButton!
    
    
    @IBOutlet weak var progresoLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        pregu = preguntas[0]
        hacerPregunta()
        
        
    }
    struct Pregunta{
        let pregunta: String
        let respuestas: [String]
        let respuestaCorrecta: Int
        
    }
    var preguntas: [Pregunta] = [
        Pregunta(pregunta: "¿Te cuesta mucho relajarte?", respuestas: ["No","Si"], respuestaCorrecta: 1),
        Pregunta(pregunta: "¿Se te seca mucho la boca?", respuestas: ["Si","No"], respuestaCorrecta: 2),Pregunta(pregunta: "¿Batallas para sentir algun sentimiento positivo?", respuestas: ["Si","No"], respuestaCorrecta: 2),Pregunta(pregunta: "¿Te ha costado trabajo respirar?", respuestas: ["No","Si"], respuestaCorrecta: 1), Pregunta(pregunta: "¿Has sentido que tus manos tiemblan?", respuestas: ["No","Si"], respuestaCorrecta: 1),
        Pregunta(pregunta: "¿Te cuesta trabajo tomar la iniciativa para hacer una cosa?", respuestas: ["Si","No"], respuestaCorrecta: 2),Pregunta(pregunta: "¿Has sentido que no tenias nada porque vivir?", respuestas: ["Si","No"], respuestaCorrecta: 2),Pregunta(pregunta: "¿Te agitas mucho?", respuestas: ["No","Si"], respuestaCorrecta: 1), Pregunta(pregunta: "¿La mayoria del tiempo te sirntes triste y deprimido?", respuestas: ["No","Si"], respuestaCorrecta: 1),
        Pregunta(pregunta: "¿Te a pasado muchas veces que estas en el punto de panico?", respuestas: ["Si","No"], respuestaCorrecta: 2),Pregunta(pregunta: "¿Te cuesta trabajo que algo te entusiasme?", respuestas: ["Si","No"], respuestaCorrecta: 2),Pregunta(pregunta: "¿Sientes que vales muy poco como persona?", respuestas: ["No","Si"], respuestaCorrecta: 1), Pregunta(pregunta: "¿Has sentido miedo sin razon?", respuestas: ["No","Si"], respuestaCorrecta: 1),
        Pregunta(pregunta: "¿Has estado muy preocupado por algo?", respuestas: ["Si","No"], respuestaCorrecta: 2),Pregunta(pregunta: "¿Tienes dificultades para relajarte ?", respuestas: ["No","Si"], respuestaCorrecta: 2),Pregunta(pregunta: "¿Te cuesta trabajo poder dormir?", respuestas: ["No","Si"], respuestaCorrecta: 1), Pregunta(pregunta: "¿Te han dado muchos dolores de cabeza o nuca?", respuestas: ["No","Si"], respuestaCorrecta: 1),
        Pregunta(pregunta: "¿Has tenido alguno de los siguientes sintomas: mareos, sudores, diarrea?", respuestas: ["Si","No"], respuestaCorrecta: 2),Pregunta(pregunta: "¿Te has sentido con poca energia?", respuestas: ["Si","No"], respuestaCorrecta: 2),Pregunta(pregunta: "¿Se te dificulta concentrarte?", respuestas: ["No","Si"], respuestaCorrecta: 1)
    ]
    
    var pregu : Pregunta?
    var preguPos = 0
    var incorrecto = 0
    
    
    
    @IBAction func resp1(_ sender: Any) {
        revisarRespuesta(idx: 0)
    }
    
    @IBAction func resp2(_ sender: Any) {
        revisarRespuesta(idx:1)
    }
    func revisarRespuesta(idx: Int){
        if(idx == pregu!.respuestaCorrecta){
            incorrecto += 1
        }
        cargarSiguientePregunta()
    }
    
    func cargarSiguientePregunta(){
        if (preguPos + 1 < preguntas.count){
            preguPos += 1
            pregu = preguntas[preguPos]
            hacerPregunta()
        }else{
            performSegue(withIdentifier: "resultado", sender: nil)
        }
    }
    func hacerPregunta() {
        preguntasLbl.text = pregu!.pregunta
        respuesta1.setTitle(pregu!.respuestas[0], for:  .normal)
        respuesta2.setTitle(pregu!.respuestas[1], for:  .normal)
        progresoLbl.text = "\(preguPos + 1)/\(preguntas.count)"
        print("")
    }
    
   
    
}
