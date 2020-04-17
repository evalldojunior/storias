import Foundation
import UIKit


public class ContoDados {
    
    // Conto 1
    public static let conto1 = Conto(titulo: "Fotografia do Bem", descricao: "Uma história sobre crianças com necessidades especiais retratadas a mostrar diversas formas de ser feliz.", autor: "por  Mykaela Carbonera", fotos: [UIImage(named: "foto1")!, UIImage(named: "conto1-2.jpg")!, UIImage(named: "conto1-3.jpg")!, UIImage(named: "conto1-4.jpg")!, UIImage(named: "conto1-5.jpg")!], legendas: ["O projeto Fotografia do Bem começou em 2016 e hoje se tornou um movimento de cunho social e de combate ao preconceito. Começou com fotografias de animais de ONGs que precisavam de um novo lar. Em 2018, o projeto se estendeu à crianças com necessidades especiais, às vezes com a presença de animais resgatados.", "Quando comecei a fazer fotos de crianças, eu queria que tivesse uma causa social por trás de cada imagem. Por isso escolhi trabalhar com crianças especiais, inicialmente com autismo e síndrome de Down e depois as próprias mães foram indicando crianças com outras síndromes.", "O projeto, idealizado pela fotógrafa Mykaela Carbonera, que é gratuito para as famílias e ONGs, visa mostrar a beleza tanto das crianças quanto animais, através de imagens alegres. As fotos ressaltam o lado bom de cada criança e suas personalidades, além de conscientizar sobre as necessidades especiais das crianças", "Nem todos conhecem as histórias sobre suas vidas e não conseguem enxergar além da condição em que a mesma se encontra. Por isso, o meu foco é mostrar alegria, brincadeiras com animais, em meio à natureza.", "Conforme avançam os trabalhos, eu aumento o meu portfólio, desenvolvo mais minha fotografia neste estilo fine art e divulgo o meu trabalho. Quanto às crianças e suas famílias, isto as ajuda a combater o preconceito, a divulgar informações e as presenteia com uma fotografia diferenciada, alegre e bonita daquela criança."])
    
    public static let conto2 = Conto(titulo: "O Poder dos Cachos", descricao: "Exemplo de texto para a descrição do conto de Emily, deus me ajude espero que ela mande", autor: "por  Emily Silva", fotos: [UIImage(named: "Emily01.jpeg")!, UIImage(named: "Emily02.jpeg")!, UIImage(named: "Emily05.jpeg")!, UIImage(named: "Emily03.jpeg")!, UIImage(named: "Emily11.jpeg")!, UIImage(named: "Emily04.jpeg")!, UIImage(named: "Emily07.jpeg")!], legendas: ["Exemplo para a celula, socorro meu deus nao aguento mais me ajude eu sei que me sondas entao faca o trabalho deus", "Exemplo para a celula, por favor vamos todos escutar future nostalgia porque é bom demais", "Exemplo para a celula, e vamos de surto gracas a deus esse projeto acaba na sexta porque nao aguento mais ess playgrounds bugado", "Exemplo para a celula, ilarie uhuuu, lesgo lesgo texto teste", "Exemplo para a celula, um beijo é o que precisa para me apaixonar por voce e é isto", "Exemplo para a celula, quando eu nem esperava voce chegou, me preencheu com seu amor era tu era tu amor da minha vida", "Exemplo para a celula, nao sei mais o que escrever entao vamos de surto kkkkkkkkkk cada k uma lagrima gera bb"])
    
    public static var dadosGeral: [Conto] = [conto1, conto2]

    
    private init() {
        
    }
}
