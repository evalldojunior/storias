import Foundation
import UIKit

public class ContoEspecificoCollectionViewCell: UICollectionViewCell {
    
    public let descricao = UILabel(frame: CGRect(x: 134, y: 550, width: 730, height: 250))
    
    public override init(frame: CGRect){
        super.init(frame:frame)        
        //descricao
        descricao.textColor = .myWhite
        descricao.numberOfLines = 5
        descricao.font = UIFont(name: "ABeeZee-Regular", size: 20)
        
        self.addSubview(descricao)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
