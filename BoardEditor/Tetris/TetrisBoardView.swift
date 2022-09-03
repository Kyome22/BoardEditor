import AppKit
import SwiftUI

struct TetrisBoardView: View {
    private let r: CGFloat = 24
    private let g: CGFloat = 1
    @State var currentLocation: (x: Int, y: Int) = (-1, -1)
    @State var cells: [MinoType] = Array(repeating: .none, count: 21 * 10)
    @Binding var minoType: MinoType
    @Binding var isReset: Bool
    @Binding var isSnapshot: Bool

    var body: some View {
        VStack(spacing: g) {
            ForEach(0 ..< 21) { y in
                HStack(spacing: g) {
                    ForEach(0 ..< 10) { x in
                        Rectangle()
                            .frame(width: r, height: r)
                            .foregroundColor(cells[10 * y + x].color)
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
                    if (0 ..< 10).contains(x), (0 ..< 21).contains(y) {
                        if currentLocation.x != x || currentLocation.y != y {
                            currentLocation = (x, y)
                            cells[10 * y + x] = minoType
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
