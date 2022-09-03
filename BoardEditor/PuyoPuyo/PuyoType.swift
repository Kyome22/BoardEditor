import SwiftUI

enum PuyoType: CaseIterable {
    case green
    case yellow
    case red
    case blue
    case purple
    case obstacle
    case none

    var color: Color {
        switch self {
        case .green:    return Color.greenPuyo
        case .yellow:   return Color.yellowPuyo
        case .red:      return Color.redPuyo
        case .blue:     return Color.bluePuyo
        case .purple:   return Color.purplePuyo
        case .obstacle: return Color.obstaclePuyo
        case .none:     return Color.clear
        }
    }
}
