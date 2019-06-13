


import UIKit
import AVFoundation

class AVPlayerViewController: UIViewController {
    
    var reproducir = AVAudioPlayer()
    var reproducir2 = AVAudioPlayer()
    var reproducir3 = AVAudioPlayer()
    var reproducir4 = AVAudioPlayer()
    override func viewDidLoad() {
        super.viewDidLoad()
        do {
            
            reproducir = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "waterfall-1", ofType: "mp3")!))
        }catch{
            print(error)
        }
        
        do {
            
            reproducir2 = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "la-lluvia_3", ofType: "mp3")!))
        }catch{
            print(error)
        }
        
        do {
            
            reproducir3 = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "sea-waves", ofType: "mp3")!))
        }catch{
            print(error)
        }
        
        do {
            
            reproducir4 = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "aves_4", ofType: "mp3")!))
        }catch{
            print(error)
        }
        
        
    }
    
    
    
    
    @IBAction func reproducirSonido(_ sender: Any) {
        if reproducir.isPlaying == false{
            reproducir.play()
        }
    }
    
    @IBAction func detenerSonido(_ sender: Any) {
        if reproducir.isPlaying{
            reproducir.stop()
        }
        
    }
    
    @IBAction func reproducirSonido2(_ sender: Any) {
        if reproducir2.isPlaying == false{
            reproducir2.play()
        }
        
    }
    
    @IBAction func detenerSonido2(_ sender: Any) {
        
        if reproducir2.isPlaying{
            reproducir2.stop()
        }
    }
    
    
    @IBAction func reproducirSonido3(_ sender: Any) {
        if reproducir3.isPlaying == false{
            reproducir3.play()
        }
        
    }
    
    @IBAction func detenerSonido3(_ sender: Any) {
        if reproducir3.isPlaying{
            reproducir3.stop()
        }
        
    }
    
    
    @IBAction func reproducirSonido4(_ sender: Any) {
        if reproducir4.isPlaying == false{
            reproducir4.play()
        }
    }
    
    
    @IBAction func detenerSonido4(_ sender: Any) {
        if reproducir4.isPlaying{
            reproducir4.stop()
        }
        
    }
    
    
}
