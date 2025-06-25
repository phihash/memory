import Foundation

@MainActor
class MemoryGameViewModel : ObservableObject {
    @Published var cards : [Card] = []
    @Published var isJudge : Bool = false
    @Published var isGameStart : Bool = false

    private var selectedIndex : Int? = nil
    
    init(){
        startGame()
    }
    
    func startGame(){
        selectedIndex = nil
        let imageNames : [String] = ["suiko","umako","jitou","sakau","taisi","koteko","susyun","tenji","tenmu","youdai","zensinni","imoko","kamatari"]
        var copyCards : [Card] = []
        print("ゲームを開始しました")
        for imageName in imageNames{
            copyCards.append(Card(fileName:imageName))
            copyCards.append(Card(fileName:imageName))
        }
        copyCards.shuffle()
        cards = copyCards
    }
    
    func choose (card:Card) async {
        //選択されたカードから、indexを探す、表あるいはマッチ済みは何もしない、indexが見つからないときは何もしない(そんなことはありえない)
        guard let tapIndex = cards.firstIndex(where:{$0.id == card.id}), !cards[tapIndex].isFace , !cards[tapIndex].isMatch , !isJudge else {
            return
        }

        if let matchIndex = selectedIndex {
            //2回目のタップ
            isJudge = true
            cards[tapIndex].isFace = true

            if cards[matchIndex].fileName == cards[tapIndex].fileName {
                cards[matchIndex].isMatch = true
                cards[tapIndex].isMatch = true
            }else{
                try? await Task.sleep(nanoseconds: 1_000_000_000)
                cards[matchIndex].isFace = false
                cards[tapIndex].isFace = false
            }

            selectedIndex = nil
            isJudge = false
        } else {
            //1回目のタップ
            for i in cards.indices{
                if !cards[i].isMatch{
                    //cardsの中からマッチしてないカードだけ念の為に、全部裏にする作業
                    cards[i].isFace = false
                }
            }
            // タップされたカードだけ表にして、タップされたindexを保存
            cards[tapIndex].isFace  = true
            selectedIndex = tapIndex
        }

    }
    
}
