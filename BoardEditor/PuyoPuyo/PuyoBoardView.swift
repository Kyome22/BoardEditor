import AppKit
import SwiftUI

struct PuyoBoardView: View {
    private let r: CGFloat = 40
    private let g: CGFloat = 1
    @State var currentLocation: (x: Int, y: Int) = (-1, -1)
    @State var cells: [PuyoType] = Array(repeating: .none, count: 12 * 6)
    @Binding var puyoType: PuyoType
    @Binding var isReset: Bool
    @Binding var isSnapshot: Bool

    var body: some View {
        VStack(spacing: g) {
            ForEach(0 ..< 12) { y in
                HStack(spacing: g) {
                    ForEach(0 ..< 6) { x in
                        Rectangle()
                            .frame(width: r, height: r)
                            .foregroundColor(Color.none)
                            .modifier(PuyoOverlayModifier(puyoType: cells[6 * y + x]))
                    }
                }
            }
        }
        .padding(1)
        .background(Color(NSColor.windowBackgroundColor))
        .gesture(
            DragGesture(minimumDistance: 0)
                .onChanged({ value in
                    let x = Int(value.location.x / (r + g))
                    let y = Int(value.location.y / (r + g))
                    if (0 ..< 6).contains(x), (0 ..< 12).contains(y) {
                        if currentLocation.x != x || currentLocation.y != y {
                            currentLocation = (x, y)
                            cells[6 * y + x] = puyoType
                        }
                    }
                })
                .onEnded({ value in
                    currentLocation = (-1, -1)
                })
        )
        .onChange(of: isReset) { newValue in
            if newValue {
                cells = Array(repeating: .none, count: 21 * 10)
                isReset = false
            }
        }
        .onChange(of: isSnapshot) { newValue in
            if newValue {
                saveSnapshot()
                isSnapshot = false
            }
        }
    }
}
