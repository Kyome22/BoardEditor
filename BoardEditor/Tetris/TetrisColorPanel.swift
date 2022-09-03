import SwiftUI

struct TetrisColorPanel: View {
    let minoTypes: [MinoType] = MinoType.allCases
    @Binding var minoType: MinoType

    var body: some View {
        VStack(alignment: .trailing) {
            ForEach(0 ..< minoTypes.count, id: \.self) { i in
                HStack(spacing: 8) {
                    Tetorimino(minoType: minoTypes[i])
                    Group {
                        if minoTypes[i] == .none {
                            Path { path in
                                path.move(to: CGPoint(x: 40, y: 0))
                                path.addLine(to: CGPoint(x: 0, y: 40))
                            }
                            .stroke(lineWidth: 2)
                            .fill(Color.red)
                            .frame(width: 40, height: 40)
                            .background(Color.none)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                        } else {
                            RoundedRectangle(cornerRadius: 8)
                                .frame(width: 40, height: 40)
                                .foregroundColor(minoTypes[i].color)
                        }
                    }
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(minoTypes[i] == minoType ? Color.gray : Color.clear, lineWidth: 2)
                    )
                    .onTapGesture {
                        minoType = minoTypes[i]
                    }
                    .padding(4)
                }
            }
        }
    }
}
