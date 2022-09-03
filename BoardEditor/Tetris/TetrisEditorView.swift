import SwiftUI

struct TetrisEditorView: View {
    @State var minoType: MinoType = .none
    @State var isReset: Bool = false
    @State var isSnapshot: Bool = false

    var body: some View {
        HStack(spacing: 8) {
            TetrisColorPanel(minoType: $minoType)
            TetrisBoardView(minoType: $minoType,
                            isReset: $isReset,
                            isSnapshot: $isSnapshot)
            ToolBar(isReset: $isReset,
                    isSnapShot: $isSnapshot)
        }
        .fixedSize()
        .padding()
    }
}

struct TetrisEditorView_Previews: PreviewProvider {
    static var previews: some View {
        TetrisEditorView()
    }
}
