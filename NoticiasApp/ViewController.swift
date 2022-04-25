//
//  ViewController.swift
//  NoticiasApp
//
//  Created by mac19 on 01/04/22.
//

import UIKit

struct Noticias: Codable {
    var articles:[Noticia]
}

struct Noticia: Codable {
    
    var title: String?
    var description: String?
    
}

class ViewController: UIViewController {

    //para guardar los articulos de noticias y llenar la tabla
    var noticias = [Noticia]()
    
    @IBOutlet weak var tablaNoticias: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        //tablaNoticias.delegate = self
        //tablaNoticias.dataSource = self
        
        let urlString = ""
        
        if let url = URL(string: urlString){
            if let data = try? Data (contentsOf: url){
                analizarJSON(json: data)
            }
        }
    }
    func analizarJSON(json: Data){
        let decodificador = JSONDecoder()
        if let datosDecodificados = try? decodificador.decode(Noticia.self, from: json){
           // print("Articulos de Noticias son: \(datosDecodificados.articles.count)")
           // print("Los articulos son: \(datosDecodificados.articles)")
        }
        
    }
}

