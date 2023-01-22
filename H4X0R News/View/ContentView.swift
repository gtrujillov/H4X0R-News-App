//
//  ContentView.swift
//  H4X0R News
//
//  Created by gonzalo trujillo vallejo on 21/1/23.
//

// Importa la biblioteca SwiftUI para utilizar sus componentes y funcionalidades
import SwiftUI

// Declaración de la estructura ContentView, la cual conforma una vista de SwiftUI
struct ContentView: View {
    
    // Creación de un objeto networkManager, el cual es marcado con @ObservedObject
    // Esto indica que el objeto es susceptible de ser observado y actualizado automáticamente
    @ObservedObject var networkManager = NetworkManager()
    
    // El cuerpo de la vista, especificado con la propiedad "body"
    var body: some View {
        // Contenedor VStack (vertical) que alineará los elementos internos
        VStack{
            // Contenedor NavigationView, el cual permite navegar entre diferentes elementos
            NavigationView{
                // Lista de elementos, donde cada uno es un post obtenido del objeto networkManager
                List(networkManager.posts){ post in
                    // Enlace de navegación que lleva a otra vista llamada DetailView, pasando como parámetro la url del post
                    NavigationLink(destination: DetailView(url: post.url)){
                        // Contenedor HStack (horizontal) que alineará dos elementos de texto
                        HStack {
                            // Primer elemento de texto: el número de puntos del post
                            Text(String(post.points))
                            // Segundo elemento de texto: el título del post
                            Text(post.title)
                        }
                    }
                }
                // Título de la vista de navegación
                .navigationTitle("Tech News")
            }
            // Acción al momento de aparecer en pantalla: llamada al método fetchData del objeto networkManager
            .onAppear{
                self.networkManager.fetchData()
            }
        }
    }
}

