import SwiftUI

struct PuyoColorPanel: View {
    let puyoTypes: [PuyoType] = PuyoType.allCases
    @Binding var puyoType: PuyoType

    var body: some View {
        VStack {
            ForEach(0 ..< puyoTypes.count, id: \.self) { i in
                HStack(spacing: 8) {
                    Puyo(puyoType: puyoTypes[i])
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(puyoTypes[i] == puyoType ? Color.gray : Color.clear, lineWidth: 2)
                        )
                        .contentShape(RoundedRectangle(cornerRadius: 8))
                        .onTapGesture {
                            puyoType = puyoTypes[i]
                        }
                        .padding(4)
                }
            }
        }
    }
}
