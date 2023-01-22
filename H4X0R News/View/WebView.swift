//
//  WebView.swift
//  H4X0R News
//
//  Created by gonzalo trujillo vallejo on 22/1/23.
//

import Foundation
import WebKit
import SwiftUI

// creamos una estructura que conforma al protocolo UIViewRepresentable
struct WebView: UIViewRepresentable {
    
    // se declara una variable opcional de tipo String para almacenar la URL de la página web a mostrar
    let urlString: String?
    
    // función que devuelve una nueva instancia de WKWebView
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    // función que recibe una instancia de WKWebView existente y una URL, y carga la página web en la vista
    func updateUIView(_ uiView: WKWebView, context: Context) {
        // se verifica si se ha proporcionado una URL
        if let safeString = urlString {
            // se verifica si la URL es válida
            if let url = URL(string: safeString){
                // se crea una solicitud de URL
                let request = URLRequest(url: url)
                // se carga la página web en la vista
                uiView.load(request)
            }
        }
    }
}
