import Foundation
import UIKit

public class Conto {
    public var titulo: String
    public var descricao: String
    public var autor: String
    public var fotos: [UIImage]
    public var legendas: [String]

    public init(titulo: String, descricao: String, autor: String, fotos: [UIImage], legendas: [String]) {
        self.titulo = titulo
        self.descricao = descricao
        self.autor = autor
        self.fotos = fotos
        self.legendas = legendas
    }
    
}
