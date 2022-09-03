import SwiftUI

enum Pazzle: String {
    case tetris = "Tetris"
    case puyopuyo = "PuyoPuyo"
}

struct SelectView: View {
    @State var pazzle: Pazzle = .tetris

    var body: some View {
        Group {
            switch pazzle {
            case .tetris:
                TetrisEditorView()
            case .puyopuyo:
                PuyoEditorView()
            }
        }
        .toolbar(id: "Pazzle") {
            ToolbarItem(id: Pazzle.tetris.rawValue, placement: .status) {
                Button {
                    pazzle = .tetris
                } label: {
                    Tetorimino(minoType: .s)
                }
            }
            ToolbarItem(id: Pazzle.puyopuyo.rawValue, placement: .status) {
                Button {
                    pazzle = .puyopuyo
                } label: {
                    Puyo(puyoType: .green, scale: 0.5)
                }
            }
        }
    }
}

struct SelectView_Previews: PreviewProvider {
    static var previews: some View {
        SelectView()
    }
}
