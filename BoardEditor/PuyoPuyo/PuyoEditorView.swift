import SwiftUI

struct PuyoEditorView: View {
    @State var puyoType: PuyoType = .none
    @State var isReset: Bool = false
    @State var isSnapshot: Bool = false

    var body: some View {
        HStack {
            PuyoColorPanel(puyoType: $puyoType)
            PuyoBoardView(puyoType: $puyoType,
                          isReset: $isReset,
                          isSnapshot: $isSnapshot)
            ToolBar(isReset: $isReset,
                    isSnapShot: $isSnapshot)
        }
        .fixedSize()
        .padding()
    }
}

struct PuyoEditorView_Previews: PreviewProvider {
    static var previews: some View {
        PuyoEditorView()
    }
}
