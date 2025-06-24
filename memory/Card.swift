import Foundation

struct Card : Identifiable {
    let id = UUID()
    let fileName : String
    var isMatch : Bool = false
    var isFace : Bool = false
}
