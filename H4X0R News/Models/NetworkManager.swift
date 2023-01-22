//
//  NetworkManager.swift
//  H4X0R News
//
//  Created by gonzalo trujillo vallejo on 21/1/23.
//

// Importa la biblioteca Foundation para utilizar sus componentes y funcionalidades
import Foundation

// Declaración de la clase NetworkManager, la cual conforma un objeto para manejar la conexión a una red
class NetworkManager: ObservableObject {
    
    // Creación de una propiedad posts marcada con @Published
    // Esto indica que esta propiedad es susceptible de ser publicada y actualizada automáticamente
    @Published var posts = [Post]()
    
    // Función para obtener los datos de los posts a través de una conexión a una URL
    func fetchData(){
        // Se verifica si se puede crear una URL a partir de un string
        if  let url = URL(string: "http://hn.algolia.com/api/v1/search?tags=front_page") {
            // Se crea una sesión de red con la configuración predeterminada
            let session = URLSession(configuration: .default)
            // Se crea una tarea para obtener los datos de la URL
            let task = session.dataTask(with: url) { data, response, error in
                // Si no hay errores
                if error == nil {
                    // Se crea un decodificador de JSON
                    let decoder = JSONDecoder()
                    // Se verifica si se obtuvo algún dato
                    if let SafeData = data {
                        // Se intenta decodificar los datos obtenidos a un objeto Results
                        do{
                            let results = try decoder.decode(Results.self, from: SafeData)
                            // Se actualiza la propiedad posts en el hilo principal
                            DispatchQueue.main.async {
                                self.posts = results.hits
                            }
                        }catch{print(error)}
                    }
                    
                }
            }
            // Se inicia la tarea
            task.resume()
        }
    }
}
