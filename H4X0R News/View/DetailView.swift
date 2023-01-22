//
//  DetailView.swift
//  H4X0R News
//
//  Created by gonzalo trujillo vallejo on 21/1/23.
//

import SwiftUI // importamos la librería de SwiftUI

// creamos la estructura DetailView que conforma al protocolo View de SwiftUI
struct DetailView: View {
    
    // se declara una variable opcional de tipo String para almacenar la URL de la página web a mostrar
    var url: String?
    
    // se define el cuerpo de la vista, que en este caso es una instancia de WebView, pasando como parámetro la URL
    var body: some View {
        WebView(urlString: url)
    }
}

// creamos una estructura para poder visualizar una vista previa de nuestra vista de detalle
struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        // se establece una URL de ejemplo para mostrar en la vista previa
        DetailView(url: "https://www.google.com")
    }
}

