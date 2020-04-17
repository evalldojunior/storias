import Foundation
import UIKit

public class ContoEspecificoCollectionViewCell: UICollectionViewCell {
    
    public let descricao = UITextView(frame: CGRect(x: 0, y: 750, width: 930, height: 250))
    
    public override init(frame: CGRect){
        super.init(frame:frame)        
        //descricao
        descricao.textColor = .myWhite
        descricao.font = UIFont(name: "ABeeZee-Regular", size: 20)
        descricao.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.4)
        descricao.layer.masksToBounds = true
        descricao.layer.cornerRadius = 20
        descricao.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
        descricao.isEditable = false
        descricao.textContainerInset = UIEdgeInsets(top: 14, left: 89, bottom: 14, right: 14)
        
        self.addSubview(descricao)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
