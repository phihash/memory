import Foundation

class MemoryGameViewModel : ObservableObject {
    @Published var cards : [Card] = []

    init(){
        startGame()
    }

    func startGame(){
        let imageNames : [String] = ["suiko","umako","jitou","sakau","taisi","koteko","susyun","tenji","tenmu"]
        print("ゲームを開始しました")
        for imageName in imageNames{
            cards.append(Card(fileName:imageName))
            cards.append(Card(fileName:imageName))
        }
        cards.shuffle()
    }

}
