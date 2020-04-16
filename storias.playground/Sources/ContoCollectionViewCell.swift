import UIKit
import Foundation

public class ContoCollectionViewCell: UICollectionViewCell {
    public let gradient = UIImageView(frame: CGRect(x: 0, y: 0, width: 913, height: 591))
    public let titulo = UILabel(frame: CGRect(x: 0, y: 385, width: 250, height: 50))
    public let descricao = UILabel(frame: CGRect(x: 30, y: 450, width: 550, height: 50))
    public let autor = UILabel(frame: CGRect(x: 30, y: 510, width: 200, height: 20))
    
    public override init(frame: CGRect){
        super.init(frame:frame)
        //degrade
        gradient.image = UIImage(named: "gradient")
        //bordas
        self.layer.cornerRadius = 15
        self.layer.masksToBounds = true
        self.layer.borderColor = #colorLiteral(red: 0.2278469205, green: 0.7874162793, blue: 0.7985491157, alpha: 1) //mudar depois para myBlue, agora nao ta funcionando
        self.layer.borderWidth = 8
        //titulo
        titulo.textColor = .myWhite
        titulo.layer.masksToBounds = true
        titulo.layer.cornerRadius = 25
        titulo.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
        titulo.backgroundColor = .myBlue
        titulo.font = UIFont(name: "LuckiestGuy-Regular", size: 24)
        titulo.textAlignment = .center
        //descricao
        descricao.textColor = .myWhite
        descricao.numberOfLines = 2
        descricao.font = UIFont(name: "ABeeZee-Regular", size: 20)
        //autor
        autor.textColor = .myWhite
        autor.font = UIFont(name: "ABeeZee-Regular", size: 16)
        
        self.addSubview(gradient)
        self.addSubview(titulo)
        self.addSubview(descricao)
        self.addSubview(autor)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
