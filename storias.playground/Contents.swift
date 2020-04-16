//: A UIKit based Playground for presenting user interface

import UIKit
import PlaygroundSupport
import SpriteKit

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
    let collectionView = UICollectionView(frame: CGRect(x: 38, y: 204, width: 1365, height: 591), collectionViewLayout: UICollectionViewFlowLayout())
    
    override func loadView() {
        //view total
        let view = UIView()
        view.backgroundColor = .myWhite
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
        
        //collection view
        collectionView.register(ContoCollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
        }
        collectionView.backgroundColor = .myWhite
        
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



class ContoViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    var conto: Conto?
    let collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: 1440, height: 900), collectionViewLayout: UICollectionViewFlowLayout())
    
    
    override func loadView() {
        let view = UIView()
        view.frame.size = CGSize(width: 1440, height: 900)
        view.backgroundColor = .myWhite
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
        titulo.textColor = .myWhite
        titulo.layer.masksToBounds = true
        titulo.layer.cornerRadius = 25
        titulo.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
        titulo.backgroundColor = .myBlue
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
        collectionView.backgroundColor = .myBlack
        collectionView.delegate = self
        collectionView.dataSource = self
        
        view.addSubview(collectionView)
        view.addSubview(titulo)
        view.addSubview(camera)
        view.addSubview(voltar)
        
        self.view = view
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

class TelaInicialViewController: UIViewController {
    let grupo2 = SKSpriteNode(imageNamed: "bolhagrupo2")
    let grupo1 = SKSpriteNode(imageNamed: "bolhagrupo1")
    let scene = SKScene(size: CGSize(width: 1440, height: 900))
    let logo = UIImageView(frame: CGRect(x: 312, y: 210, width: 451, height: 170))
    let texto1 = UILabel(frame: CGRect(x: 344, y: 415, width: 797, height: 60))
    let texto2 = UILabel(frame: CGRect(x: 344, y: 485, width: 582, height: 60))
    let comecar = UIButton(frame: CGRect(x: 1022, y: 639, width: 183, height: 55))
    
    override func loadView() {
        //view total
        let view = SKView()
        view.backgroundColor = .myWhite
        view.frame.size = CGSize(width: 1440, height: 900)
        
        scene.backgroundColor = .myWhite
        
        // logo
        logo.image = UIImage(named: "logo1")
        
        //textos introdutorios
        texto1.text = "O playground tem como objetivo contar histórias através de imagens, propondo um novo olhar para aqueles que as leem."
        texto1.font = UIFont(name: "ABeeZee-Regular", size: 22)
        texto1.numberOfLines = 2
        texto2.text = "O foco é na diminuição do preconceito a partir das novas perspectivas observadas."
        texto2.font = UIFont(name: "ABeeZee-Regular", size: 22)
        texto2.numberOfLines = 2
        
        //botao comecar
        comecar.setBackgroundImage(UIImage(named: "comecar"), for: .normal)
        comecar.addTarget(nil, action: #selector(TelaInicialViewController.comecarButton), for: .touchUpInside)
        
        view.presentScene(scene)
        view.showsFPS
        view.addSubview(logo)
        view.addSubview(texto1)
        view.addSubview(texto2)
        view.addSubview(comecar)
        
        grupo1.anchorPoint = CGPoint.zero
        grupo1.position = CGPoint(x: -37, y: -50)
        
        grupo2.anchorPoint = CGPoint.zero
        grupo2.position = CGPoint(x: -52, y: -45)
        
        scene.addChild(grupo2)
        scene.addChild(grupo1)
        
        scene.alpha = 0
        logo.alpha = 0
        texto1.alpha = 0
        texto2.alpha = 0
        comecar.alpha = 0
        
        self.view = view
    }
    
    override func viewDidLoad() {
        let move1 = SKAction.moveBy(x: 10, y: 10, duration: 2.0)
        let move2 = SKAction.moveBy(x: 10, y: -20, duration: 2.5)
        let move3 = SKAction.moveBy(x: -10, y: -10, duration: 1.5)
        let move4 = SKAction.moveBy(x: -10, y: 20 , duration: 2.5)
        let sequence1 = SKAction.sequence([move1, move2, move3, move4])
        let runForever1 = SKAction.repeatForever(sequence1)
        
        let move5 = SKAction.moveBy(x: 10, y: -10, duration: 1.5)
        let move6 = SKAction.moveBy(x: -10, y: 20, duration: 2.0)
        let move7 = SKAction.moveBy(x: -10, y: 10, duration: 2.5)
        let move8 = SKAction.moveBy(x: 10, y: -20, duration: 2.0)
        let sequence2 = SKAction.sequence([move5, move6, move7, move8])
        let runForever2 = SKAction.repeatForever(sequence2)
        
        grupo1.run(runForever2)
        grupo2.run(runForever1)
        
        UIView.animate(withDuration: 1.5, delay: 1, options: .curveEaseInOut, animations: {
            //nao ta fazendo a animacao rs
            self.scene.alpha = 1
        }, completion: { _ in
            UIView.animate(withDuration: 1.5, delay: 1, options: .curveEaseInOut, animations: {
                self.logo.alpha = 1
            }) { _ in
                UIView.animate(withDuration: 1, delay: 1, options: .curveEaseInOut, animations: {
                    self.texto1.alpha = 1
                }) { _ in
                    UIView.animate(withDuration: 1, delay: 4, options: .curveEaseInOut, animations: {
                        self.texto2.alpha = 1
                    }) { _ in
                        UIView.animate(withDuration: 1, delay: 2.5, options: .curveEaseInOut, animations: {
                            self.comecar.alpha = 1
                        }) { _ in
                            
                        }
                    }
                }
            }
        })
    }
    
    @IBAction func comecarButton() {
        navigationController?.show(myViewController, sender: nil)
    }
}

let myViewController = MyViewController()
let contoViewController = ContoViewController()
let telaInicialViewController = TelaInicialViewController()

//contoViewController.modalPresentationStyle = .fullScreen
let navigation = UINavigationController(screenType: .mac, isPortrait: true)
navigation.navigationBar.isHidden = true
navigation.pushViewController(telaInicialViewController, animated: true)
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = navigation.scale(to: 0.5)
