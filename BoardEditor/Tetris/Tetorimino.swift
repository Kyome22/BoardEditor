import SwiftUI

struct Tetorimino: View {
    private let blocks: [[Color]]

    init(minoType: MinoType) {
        self.blocks = minoType.blocks
    }

    var body: some View {
        VStack(spacing: 2) {
            ForEach(0 ..< blocks.count, id: \.self) { i in
                HStack(spacing: 2) {
                    ForEach(0 ..< blocks[i].count, id: \.self) { j in
                        RoundedRectangle(cornerRadius: 1)
                            .frame(width: 8, height: 8)
                            .foregroundColor(blocks[i][j])
                    }
                }
            }
        }
    }
}
