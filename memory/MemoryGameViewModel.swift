import Foundation

class MemoryGameViewModel : ObservableObject {
    @Published var cards : [Card] = []

    private var selectedIndex : Int? = nil

    init(){
        startGame()
    }

    func startGame(){
        selectedIndex = nil
        let imageNames : [String] = ["suiko","umako","jitou","sakau","taisi","koteko","susyun","tenji","tenmu","youdai","zensinni"]
        var copyCards : [Card] = []
        print("ゲームを開始しました")
        for imageName in imageNames{
            copyCards.append(Card(fileName:imageName))
            copyCards.append(Card(fileName:imageName))
        }
        copyCards.shuffled()
        cards = copyCards
    }

}
