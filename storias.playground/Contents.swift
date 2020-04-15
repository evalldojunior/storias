//: A UIKit based Playground for presenting user interface

import UIKit
import PlaygroundSupport

let cfURL = Bundle.main.url(forResource: "LuckiestGuy-Regular", withExtension: "ttf")! as CFURL
CTFontManagerRegisterFontsForURL(cfURL, CTFontManagerScope.process, nil)
let cfURL1 = Bundle.main.url(forResource: "ABeeZee-Regular", withExtension: "ttf")! as CFURL
CTFontManagerRegisterFontsForURL(cfURL1, CTFontManagerScope.process, nil)

class MyViewController : UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let infoButton = UIButton()
    let sairButton = UIButton()
    let viewInfo = UIView()
    let testButton = UIButton()
    var contos: [Conto] = ContoDados.dadosGeral
    //let fotos: [UIImage] = [UIImage(named: "foto1")!, UIImage(named: "foto2")!, UIImage(named: "foto3")!, UIImage(named: "foto4")!, UIImage(named: "foto5")!]
    let collectionView = UICollectionView(frame: CGRect(x: 38, y: 204, width: 1365, height: 591), collectionViewLayout: UICollectionViewFlowLayout())
    
    override func loadView() {
        
        
        //view total
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.9607035518, green: 0.9608380198, blue: 0.9606611133, alpha: 1)
        view.frame.size = CGSize(width: 1440, height: 900)
        
        // logo storias e info
        let logo = UIImageView(image: UIImage(named: "logo"))
        logo.frame = CGRect(x: 85, y: 13, width: 429, height: 173)
        infoButton.frame = CGRect(x: 1275, y: 90, width: 32, height: 32)
        infoButton.setBackgroundImage(UIImage(named: "info"), for: .normal)
        
        // view para a info sobre o playground
        sairButton.frame = CGRect(x: 910, y: 290, width: 45, height: 44)
        sairButton.setBackgroundImage(UIImage(named: "sair"), for: .normal)
        let infos = UIImageView(image: UIImage(named: "infos"))
        infos.frame = CGRect(x: 465, y: 271, width: 510, height: 358)
        let viewBackground = UIView()
        viewBackground.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.4)
        viewBackground.frame.size = CGSize(width: 1440, height: 900)
        viewInfo.frame.size = CGSize(width: 1440, height: 900)
        viewInfo.addSubview(viewBackground)
        viewInfo.addSubview(infos)
        viewInfo.addSubview(sairButton)
        viewInfo.alpha = 0
        viewInfo.isHidden = true
        
        // teste para mudar de view
//        testButton.frame = CGRect(x: 629, y: 425, width: 183, height: 51)
//        testButton.setTitle("Teste", for: .normal)
//        testButton.backgroundColor = #colorLiteral(red: 0.2278469205, green: 0.7874162793, blue: 0.7985491157, alpha: 1)
//        testButton.layer.cornerRadius = 25
//        testButton.addTarget(nil, action: #selector(MyViewController.testar), for: .touchUpInside)
        
        //collection view
        collectionView.register(ContoCollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
        }
        collectionView.backgroundColor = #colorLiteral(red: 0.9607843137, green: 0.9607843137, blue: 0.9607843137, alpha: 1)
        
        //adicionando elementos na view geral
        view.addSubview(logo)
        view.addSubview(infoButton)
        view.addSubview(testButton) //apagar depois de tirar o test
        view.addSubview(collectionView)
        view.addSubview(viewInfo)
        
        self.view = view
    }
    
    override func viewDidLoad() {
        collectionView.delegate = self
        collectionView.dataSource = self
        infoButton.addTarget(self, action: #selector(MyViewController.infoTouched), for: .touchUpInside)
        sairButton.addTarget(self, action: #selector(MyViewController.sairTouched), for: .touchUpInside)
//        for constraint in self.view.constraints {
//            constraint.isActive = false
//        }
    }
    
    @IBAction func infoTouched() {
        viewInfo.isHidden = false
        UIView.animate(withDuration: 0.3) {
            self.viewInfo.alpha = 1
        }
        
    }
    
    @IBAction func sairTouched() {
        UIView.animate(withDuration: 0.3, animations: {
            self.viewInfo.alpha = 0
        }) { _ in
            self.viewInfo.isHidden = true
        }
    }
    
    @IBAction func testar() {
        navigationController?.show(contoViewController, sender: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 913, height: 591)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return contos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? ContoCollectionViewCell
        cell?.backgroundView = UIImageView(image: contos[indexPath.item].fotos[0])
        cell?.titulo.text = contos[indexPath.section].titulo
        cell?.descricao.text = contos[indexPath.section].descricao
        cell?.autor.text = contos[indexPath.section].autor
        // codigo para o tamanho da label mudar de acordo com o tamanho do texto
        cell?.titulo.sizeToFit()
        cell?.titulo.frame = CGRect(x: 0, y: 385, width: (cell?.titulo.frame.size.width)!+40, height: 50)
        
        return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //falta adicionar o dado a ser carregado na view
        contoViewController.conto = contos[indexPath.section]
        navigationController?.show(contoViewController, sender: nil)
    }
    
}

class ContoCollectionViewCell: UICollectionViewCell {
    public let gradient = UIImageView(frame: CGRect(x: 0, y: 0, width: 913, height: 591))
    public let titulo = UILabel(frame: CGRect(x: 0, y: 385, width: 250, height: 50))
    public let descricao = UILabel(frame: CGRect(x: 30, y: 450, width: 550, height: 50))
    let autor = UILabel(frame: CGRect(x: 30, y: 510, width: 200, height: 20))
    
    public override init(frame: CGRect){
        super.init(frame:frame)
        //degrade
        gradient.image = UIImage(named: "gradient")
        //bordas
        self.layer.cornerRadius = 15
        self.layer.masksToBounds = true
        self.layer.borderColor = #colorLiteral(red: 0.2278469205, green: 0.7874162793, blue: 0.7985491157, alpha: 1)
        self.layer.borderWidth = 8
        //titulo
        titulo.textColor = #colorLiteral(red: 0.9607843137, green: 0.9607843137, blue: 0.9607843137, alpha: 1)
        titulo.layer.masksToBounds = true
        titulo.layer.cornerRadius = 25
        titulo.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
        titulo.backgroundColor = #colorLiteral(red: 0.2278469205, green: 0.7874162793, blue: 0.7985491157, alpha: 1)
        titulo.font = UIFont(name: "LuckiestGuy-Regular", size: 24)
        titulo.textAlignment = .center
    
        
        //descricao
        descricao.textColor = #colorLiteral(red: 0.9607843137, green: 0.9607843137, blue: 0.9607843137, alpha: 1)
        descricao.numberOfLines = 2
        descricao.font = UIFont(name: "ABeeZee-Regular", size: 20)
        //autor
        autor.textColor = #colorLiteral(red: 0.9607843137, green: 0.9607843137, blue: 0.9607843137, alpha: 1)
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

class ContoViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    var conto: Conto?
    let collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: 1440, height: 900), collectionViewLayout: UICollectionViewFlowLayout())
    
    
    override func loadView() {
        let view = UIView()
        view.frame.size = CGSize(width: 1440, height: 900)
        view.backgroundColor = #colorLiteral(red: 0.9607035518, green: 0.9608380198, blue: 0.9606611133, alpha: 1)
        // imagem de camera
        let camera = UIImageView(image: UIImage(named: "camera"))
        camera.frame = CGRect(x: 89, y: 57, width: 91, height: 91)
        // botao voltar para a colecao
        let voltar = UIButton()
        voltar.frame = CGRect(x: 1183, y: 761, width: 164, height: 51)
        voltar.setBackgroundImage(UIImage(named: "voltar"), for: .normal)
        voltar.addTarget(nil, action: #selector(ContoViewController.voltarButton), for: .touchUpInside)
        // titulo
        let titulo = UILabel()
        //titulo.frame = CGRect(x: 175, y: 80, width: 339, height: 50)
        titulo.textColor = #colorLiteral(red: 0.9607843137, green: 0.9607843137, blue: 0.9607843137, alpha: 1)
        titulo.layer.masksToBounds = true
        titulo.layer.cornerRadius = 25
        titulo.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
        titulo.backgroundColor = #colorLiteral(red: 0.2278469205, green: 0.7874162793, blue: 0.7985491157, alpha: 1)
        titulo.font = UIFont(name: "LuckiestGuy-Regular", size: 30)
        titulo.textAlignment = .center
        titulo.text = conto?.titulo
        titulo.sizeToFit()
        titulo.frame = CGRect(x: 175, y: 80, width: titulo.frame.size.width+40, height: 50)
        // collectionView
        collectionView.register(ContoEspecificoCollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
        }
        collectionView.backgroundColor = #colorLiteral(red: 0.2156862745, green: 0.2156862745, blue: 0.2156862745, alpha: 1)
        collectionView.delegate = self
        collectionView.dataSource = self
        
        view.addSubview(collectionView)
        view.addSubview(titulo)
        view.addSubview(camera)
        view.addSubview(voltar)
        
        self.view = view
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
//        let imagem =  UIImage(named: self.cachorro!.foto)
//        self.imageView?.image = imagem;
//        self.labelRaca?.text = "Raça: \(self.cachorro!.raca)"
//        self.labelTempoMedioVida?.text = "Média de vida: \(self.cachorro!.lifespan) anos"
//        print("Carregando foto \(self.cachorro!.foto)")
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 1440, height: 900)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (conto?.fotos.count)!
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? ContoEspecificoCollectionViewCell
        cell?.backgroundView = UIImageView(image: conto?.fotos[indexPath.item])
        cell?.descricao.text = conto?.legendas[indexPath.item]
        return cell!
    }
    
    @IBAction func voltarButton() {
        navigationController?.popViewController(animated: true)
    }
}

class ContoEspecificoCollectionViewCell: UICollectionViewCell {
    
    public let descricao = UILabel(frame: CGRect(x: 134, y: 550, width: 730, height: 250))
    
    public override init(frame: CGRect){
        super.init(frame:frame)
        //bordas
//        self.layer.borderColor = #colorLiteral(red: 0.2278469205, green: 0.7874162793, blue: 0.7985491157, alpha: 1)
//        self.layer.borderWidth = 8
        
        //descricao
        descricao.textColor = #colorLiteral(red: 0.9607843137, green: 0.9607843137, blue: 0.9607843137, alpha: 1)
        descricao.numberOfLines = 5
        descricao.font = UIFont(name: "ABeeZee-Regular", size: 20)
    
        self.addSubview(descricao)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class TelaInicialViewController: UIViewController {
    override func loadView() {
        //view total
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.9607035518, green: 0.9608380198, blue: 0.9606611133, alpha: 1)
        view.frame.size = CGSize(width: 1440, height: 900)
        
        // logo
        let logo = UIImageView(frame: CGRect(x: 312, y: 210, width: 451, height: 170))
        logo.image = UIImage(named: "logo1")
        
        //textos introdutorios
        let texto1 = UILabel(frame: CGRect(x: 344, y: 415, width: 797, height: 60))
        texto1.text = "O playground tem como objetivo contar histórias através de imagens, propondo um novo olhar para aqueles que as leem."
        texto1.font = UIFont(name: "ABeeZee-Regular", size: 22)
        texto1.numberOfLines = 2
        let texto2 = UILabel(frame: CGRect(x: 344, y: 485, width: 582, height: 60))
        texto2.text = "O foco é na diminuição do preconceito a partir das novas perspectivas observadas."
        texto2.font = UIFont(name: "ABeeZee-Regular", size: 22)
        texto2.numberOfLines = 2
        
        //botao comecar
        let comecar = UIButton(frame: CGRect(x: 1022, y: 639, width: 183, height: 55))
        comecar.setBackgroundImage(UIImage(named: "comecar"), for: .normal)
        comecar.addTarget(nil, action: #selector(TelaInicialViewController.comecarButton), for: .touchUpInside)
        
        view.addSubview(logo)
        view.addSubview(texto1)
        view.addSubview(texto2)
        view.addSubview(comecar)

        // nao sei se essa parte vai entrar aqui, dai fica aqui por enquanto
        let bolha1 = UIImageView(image: UIImage(named: "bolha1"))
        bolha1.frame = CGRect(x: -52, y: -25, width: 578, height: 520)
        let bolha2 = UIImageView(image: UIImage(named: "bolha2"))
        bolha2.frame = CGRect(x: 669, y: -44, width: 342, height: 122)
        let bolha3 = UIImageView(image: UIImage(named: "bolha3"))
        bolha3.frame = CGRect(x: 985, y: -119, width: 488, height: 351)
        let bolha4 = UIImageView(image: UIImage(named: "bolha4"))
        bolha4.frame = CGRect(x: -37, y: 639, width: 420, height: 318)
        let bolha5 = UIImageView(image: UIImage(named: "bolha5"))
        bolha5.frame = CGRect(x: 270, y: 774, width: 451, height: 177)
        let bolha6 = UIImageView(image: UIImage(named: "bolha6"))
        bolha6.frame = CGRect(x: 1012, y: 354, width: 478, height: 597)
        
        
        
        view.addSubview(bolha1)
        view.addSubview(bolha2)
        view.addSubview(bolha3)
        view.addSubview(bolha5)
        view.addSubview(bolha4)
        view.addSubview(bolha6)
            
            
            
            
        self.view = view
    }
    
    @IBAction func comecarButton() {
        navigationController?.show(myViewController, sender: nil)
    }
}

let myViewController = MyViewController()
let contoViewController = ContoViewController()
let telaInicialViewController = TelaInicialViewController()
contoViewController.modalPresentationStyle = .fullScreen
let navigation = UINavigationController(screenType: .mac, isPortrait: true)
navigation.navigationBar.isHidden = true
navigation.pushViewController(telaInicialViewController, animated: true)
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = navigation.scale(to: 0.5)
