//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {

    let infoButton = UIButton()
    let sairButton = UIButton()
    let viewInfo = UIView()
    
    override func loadView() {
        //view total
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.9607035518, green: 0.9608380198, blue: 0.9606611133, alpha: 1)
        //view.frame = CGRect(x: 0, y: 0, width: 1194, height: 834)
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
        
        let viewTest = UIView()
        viewTest.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.4)
        viewTest.frame.size = CGSize(width: 1440, height: 900)
        viewInfo.frame.size = CGSize(width: 1440, height: 900)
        viewInfo.addSubview(viewTest)
        viewInfo.addSubview(infos)
        viewInfo.addSubview(sairButton)
        viewInfo.alpha = 0
        viewInfo.isHidden = true
        
        
       
        view.addSubview(logo)
        view.addSubview(infoButton)
        view.addSubview(viewInfo)
        
        self.view = view
    }
    
    override func viewDidLoad() {
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
}
// Present the view controller in the Live View window
let vc = MyViewController(screenType: .mac, isPortrait: true)
PlaygroundPage.current.liveView = vc.scale(to: 0.5)
