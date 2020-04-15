//import Foundation
//import UIKit
//
//class ContoCollectionViewCell: UICollectionViewCell {
//    public let gradient = UIImageView(frame: CGRect(x: 0, y: 0, width: 913, height: 591))
//    public let titulo = UILabel(frame: CGRect(x: 0, y: 385, width: 250, height: 50))
//    public let descricao = UILabel(frame: CGRect(x: 30, y: 450, width: 550, height: 50))
//    let autor = UILabel(frame: CGRect(x: 30, y: 510, width: 200, height: 20))
//    
//    public override init(frame: CGRect){
//        super.init(frame:frame)
//        //degrade
//        gradient.image = UIImage(named: "gradient")
//        //bordas
//        self.layer.cornerRadius = 15
//        self.layer.masksToBounds = true
//        self.layer.borderColor = #colorLiteral(red: 0.2278469205, green: 0.7874162793, blue: 0.7985491157, alpha: 1)
//        self.layer.borderWidth = 8
//        //titulo
//        titulo.textColor = #colorLiteral(red: 0.9607843137, green: 0.9607843137, blue: 0.9607843137, alpha: 1)
//        titulo.layer.masksToBounds = true
//        titulo.layer.cornerRadius = 25
//        titulo.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
//        titulo.backgroundColor = #colorLiteral(red: 0.2278469205, green: 0.7874162793, blue: 0.7985491157, alpha: 1)
//        titulo.font = UIFont(name: "LuckiestGuy-Regular", size: 24)
//        titulo.textAlignment = .center
//        titulo.sizeToFit()
//        //descricao
//        descricao.textColor = #colorLiteral(red: 0.9607843137, green: 0.9607843137, blue: 0.9607843137, alpha: 1)
//        descricao.numberOfLines = 2
//        descricao.font = UIFont(name: "ABeeZee-Regular", size: 20)
//        //autor
//        autor.textColor = #colorLiteral(red: 0.9607843137, green: 0.9607843137, blue: 0.9607843137, alpha: 1)
//        autor.font = UIFont(name: "ABeeZee-Regular", size: 16)
//        
//        self.addSubview(gradient)
//        self.addSubview(titulo)
//        self.addSubview(descricao)
//        self.addSubview(autor)
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//}

