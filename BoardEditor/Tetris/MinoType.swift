import SwiftUI

enum MinoType: String, CaseIterable {
    case t = "010:111"
    case z = "110:011"
    case s = "011:110"
    case o = "11:11"
    case l = "001:111"
    case j = "100:111"
    case i = "0000:1111"
    case some = "0:1"
    case none = "0:0"

    var color: Color {
        switch self {
        case .t: return Color.tMino
        case .z: return Color.zMino
        case .s: return Color.sMino
        case .o: return Color.oMino
        case .l: return Color.lMino
        case .j: return Color.jMino
        case .i: return Color.iMino
        case .some: return Color.primary
        case .none: return Color.none
        }
    }

    var blocks: [[Color]] {
        let lines = self.rawValue.components(separatedBy: ":")
        return lines.map { line in
            return line.map { $0 == "1" ? self.color : Color.clear }
        }
    }
}
