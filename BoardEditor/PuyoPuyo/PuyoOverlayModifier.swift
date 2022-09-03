import SwiftUI

struct PuyoOverlayModifier: ViewModifier {
    let puyoType: PuyoType

    func body(content: Content) -> some View {
        if puyoType == .none {
            content
        } else {
            content.overlay(
                Puyo(puyoType: puyoType)
            )
        }
    }
}
