import SwiftUI

struct Puyo: View {
    private let puyoType: PuyoType
    private let scale: CGFloat
    private let side: CGFloat

    init(puyoType: PuyoType, scale: CGFloat = 1) {
        self.puyoType = puyoType
        self.scale = scale
        self.side = scale * 40
    }

    var body: some View {
        if puyoType == .none {
            nonePath
        } else {
            puyoPath
                .scale(scale, anchor: .topLeading)
                .fill(style: FillStyle(eoFill: true))
                .frame(width: side, height: side)
                .foregroundColor(puyoType.color)
        }
    }

    var nonePath: some View {
        Path { path in
            path.move(to: CGPoint(x: side, y: 0))
            path.addLine(to: CGPoint(x: 0, y: side))
        }
        .stroke(lineWidth: 2)
        .fill(Color.red)
        .frame(width: side, height: side)
        .background(Color.none)
        .clipShape(RoundedRectangle(cornerRadius: scale * 8))
    }

    var puyoPath: Path {
        switch puyoType {
        case .green:    return greenPuyo
        case .yellow:   return yellowPuyo
        case .red:      return redPuyo
        case .purple:   return purplePuyo
        case .blue:     return bluePuyo
        case .obstacle: return obstaclePuyo
        case .none:     return Path()
        }
    }

    var greenPuyo: Path {
        return Path { path in
            path.move(to: CGPoint(x: 40.0000, y: 20.0000))
            path.addCurve(to: CGPoint(x: 20.0000, y: 37.3529),
                          control1: CGPoint(x: 40.0000, y: 29.5837),
                          control2: CGPoint(x: 31.0457, y: 37.3529))
            path.addCurve(to: CGPoint(x: 0.0000, y: 20.0000),
                          control1: CGPoint(x: 8.9543, y: 37.3529),
                          control2: CGPoint(x: 0.0000, y: 29.5837))
            path.addCurve(to: CGPoint(x: 20.0000, y: 2.6471),
                          control1: CGPoint(x: 0.0000, y: 10.4163),
                          control2: CGPoint(x: 8.9543, y: 2.6471))
            path.addCurve(to: CGPoint(x: 40.0000, y: 20.0000),
                          control1: CGPoint(x: 31.0457, y: 2.6471),
                          control2: CGPoint(x: 40.0000, y: 10.4163))
            path.closeSubpath()
            path.move(to: CGPoint(x: 17.9014, y: 6.5459))
            path.addCurve(to: CGPoint(x: 3.8885, y: 19.5506),
                          control1: CGPoint(x: 24.0329, y: 13.1558),
                          control2: CGPoint(x: 10.0216, y: 26.1583))
            path.addCurve(to: CGPoint(x: 17.9014, y: 6.5459),
                          control1: CGPoint(x: -2.2426, y: 12.9411),
                          control2: CGPoint(x: 11.7686, y: -0.0614))
            path.closeSubpath()
            path.move(to: CGPoint(x: 22.0986, y: 6.5459))
            path.addCurve(to: CGPoint(x: 36.1115, y: 19.5506),
                          control1: CGPoint(x: 15.9671, y: 13.1558),
                          control2: CGPoint(x: 29.9784, y: 26.1583))
            path.addCurve(to: CGPoint(x: 22.0986, y: 6.5459),
                          control1: CGPoint(x: 42.2426, y: 12.9411),
                          control2: CGPoint(x: 28.2314, y: -0.0614))
            path.closeSubpath()
        }
    }

    var yellowPuyo: Path {
        return Path { path in
            path.move(to: CGPoint(x: 20.0002, y: 39.3305))
            path.addCurve(to: CGPoint(x: -0.0002, y: 23.4327),
                          control1: CGPoint(x: 8.9545, y: 39.3305),
                          control2: CGPoint(x: 0.0002, y: 32.2129))
            path.addCurve(to: CGPoint(x: 20.0008, y: 0.6695),
                          control1: CGPoint(x: 0.4110, y: 10.6942),
                          control2: CGPoint(x: 14.6130, y: 10.7760))
            path.addCurve(to: CGPoint(x: 40.0002, y: 23.4328),
                          control1: CGPoint(x: 25.4299, y: 10.8203),
                          control2: CGPoint(x: 39.5724, y: 10.6666))
            path.addCurve(to: CGPoint(x: 20.0002, y: 39.3305),
                          control1: CGPoint(x: 40.0002, y: 32.2128),
                          control2: CGPoint(x: 31.0459, y: 39.3305))
            path.closeSubpath()
            path.move(to: CGPoint(x: 15.8720, y: 21.9369))
            path.addCurve(to: CGPoint(x: 7.0052, y: 13.0697),
                          control1: CGPoint(x: 7.3920, y: 30.1869),
                          control2: CGPoint(x: -1.2448, y: 21.5484))
            path.addCurve(to: CGPoint(x: 15.8720, y: 21.9369),
                          control1: CGPoint(x: 15.4850, y: 4.8199),
                          control2: CGPoint(x: 24.1218, y: 13.4584))
            path.closeSubpath()
            path.move(to: CGPoint(x: 24.1284, y: 21.9369))
            path.addCurve(to: CGPoint(x: 32.9952, y: 13.0697),
                          control1: CGPoint(x: 32.6084, y: 30.1869),
                          control2: CGPoint(x: 41.2452, y: 21.5484))
            path.addCurve(to: CGPoint(x: 24.1284, y: 21.9369),
                          control1: CGPoint(x: 24.5154, y: 4.8199),
                          control2: CGPoint(x: 15.8786, y: 13.4584))
            path.closeSubpath()
        }
    }

    var redPuyo: Path {
        Path { path in
            path.move(to: CGPoint(x: 40.0000, y: 20.0000))
            path.addCurve(to: CGPoint(x: 20.0000, y: 37.3529),
                          control1: CGPoint(x: 40.0000, y: 29.5837),
                          control2: CGPoint(x: 31.0457, y: 37.3529))
            path.addCurve(to: CGPoint(x: 0.0000, y: 20.0000),
                          control1: CGPoint(x: 8.9543, y: 37.3529),
                          control2: CGPoint(x: 0.0000, y: 29.5837))
            path.addCurve(to: CGPoint(x: 20.0000, y: 2.6471),
                          control1: CGPoint(x: 0.0000, y: 10.4163),
                          control2: CGPoint(x: 8.9543, y: 2.6471))
            path.addCurve(to: CGPoint(x: 40.0000, y: 20.0000),
                          control1: CGPoint(x: 31.0457, y: 2.6471),
                          control2: CGPoint(x: 40.0000, y: 10.4163))
            path.closeSubpath()
            path.move(to: CGPoint(x: 4.5532, y: 13.9046))
            path.addCurve(to: CGPoint(x: 19.8583, y: 20.6000),
                          control1: CGPoint(x: -4.5856, y: 27.0607),
                          control2: CGPoint(x: 17.3944, y: 36.7408))
            path.addCurve(to: CGPoint(x: 4.5532, y: 13.9046),
                          control1: CGPoint(x: 13.2408, y: 20.5909),
                          control2: CGPoint(x: 7.4901, y: 17.8845))
            path.closeSubpath()
            path.move(to: CGPoint(x: 35.4466, y: 13.9046))
            path.addCurve(to: CGPoint(x: 20.1415, y: 20.6000),
                          control1: CGPoint(x: 32.5097, y: 17.8845),
                          control2: CGPoint(x: 26.7590, y: 20.5909))
            path.addCurve(to: CGPoint(x: 35.4466, y: 13.9046),
                          control1: CGPoint(x: 22.6121, y: 36.7497),
                          control2: CGPoint(x: 44.5853, y: 27.0486))
            path.closeSubpath()
        }
    }

    var purplePuyo: Path {
        return Path { path in
            path.move(to: CGPoint(x: 39.3266, y: 25.1458))
            path.addCurve(to: CGPoint(x: 0.6735, y: 14.8534),
                          control1: CGPoint(x: 33.4198, y: 47.0394),
                          control2: CGPoint(x: -5.0917, y: 36.7835))
            path.addCurve(to: CGPoint(x: 39.3266, y: 25.1458),
                          control1: CGPoint(x: 6.5799, y: -7.0390),
                          control2: CGPoint(x: 45.0914, y: 3.2169))
            path.closeSubpath()
            path.move(to: CGPoint(x: 18.3080, y: 20.9359))
            path.addCurve(to: CGPoint(x: 8.5843, y: 23.3978),
                          control1: CGPoint(x: 17.9233, y: 24.6714),
                          control2: CGPoint(x: 12.9792, y: 25.3582))
            path.addCurve(to: CGPoint(x: 3.3963, y: 13.6385),
                          control1: CGPoint(x: 4.1894, y: 21.4374),
                          control2: CGPoint(x: 1.2868, y: 16.7452))
            path.addCurve(to: CGPoint(x: 12.2640, y: 15.2949),
                          control1: CGPoint(x: 5.2128, y: 10.9634),
                          control2: CGPoint(x: 7.8691, y: 13.3345))
            path.addCurve(to: CGPoint(x: 18.3079, y: 20.9359),
                          control1: CGPoint(x: 16.6589, y: 17.2553),
                          control2: CGPoint(x: 18.6299, y: 17.8099))
            path.closeSubpath()
            path.move(to: CGPoint(x: 20.2173, y: 21.6910))
            path.addCurve(to: CGPoint(x: 25.2447, y: 30.3707),
                          control1: CGPoint(x: 17.8119, y: 24.5747),
                          control2: CGPoint(x: 20.7725, y: 28.5935))
            path.addCurve(to: CGPoint(x: 35.8534, y: 27.2699),
                          control1: CGPoint(x: 29.7169, y: 32.1479),
                          control2: CGPoint(x: 35.1025, y: 30.9493))
            path.addCurve(to: CGPoint(x: 28.4757, y: 22.0786),
                          control1: CGPoint(x: 36.5000, y: 24.1017),
                          control2: CGPoint(x: 32.9479, y: 23.8558))
            path.addCurve(to: CGPoint(x: 20.2174, y: 21.6910),
                          control1: CGPoint(x: 24.0035, y: 20.3013),
                          control2: CGPoint(x: 22.2303, y: 19.2778))
            path.closeSubpath()
        }
    }

    var bluePuyo: Path {
        return Path { path in
            path.move(to: CGPoint(x: 39.4671, y: 18.2158))
            path.addCurve(to: CGPoint(x: 34.4927, y: 28.0422),
                          control1: CGPoint(x: 39.4671, y: 22.4087),
                          control2: CGPoint(x: 37.1320, y: 24.9207))
            path.addCurve(to: CGPoint(x: 35.9030, y: 38.4176),
                          control1: CGPoint(x: 29.2546, y: 34.2372),
                          control2: CGPoint(x: 36.2085, y: 37.4886))
            path.addCurve(to: CGPoint(x: 21.4983, y: 38.6694),
                          control1: CGPoint(x: 35.6008, y: 39.3365),
                          control2: CGPoint(x: 26.9882, y: 39.3242))
            path.addCurve(to: CGPoint(x: 8.2560, y: 32.9530),
                          control1: CGPoint(x: 16.4776, y: 38.0706),
                          control2: CGPoint(x: 11.4009, y: 35.3469))
            path.addCurve(to: CGPoint(x: 0.5329, y: 18.2158),
                          control1: CGPoint(x: 3.1322, y: 29.0530),
                          control2: CGPoint(x: 0.5329, y: 24.9065))
            path.addCurve(to: CGPoint(x: 20.0000, y: 0.8629),
                          control1: CGPoint(x: 0.5329, y: 8.6320),
                          control2: CGPoint(x: 9.2486, y: 0.8629))
            path.addCurve(to: CGPoint(x: 39.4671, y: 18.2158),
                          control1: CGPoint(x: 30.7514, y: 0.8629),
                          control2: CGPoint(x: 39.4671, y: 8.6321))
            path.closeSubpath()
            path.move(to: CGPoint(x: 19.5339, y: 16.4580))
            path.addCurve(to: CGPoint(x: 11.4360, y: 24.8692),
                          control1: CGPoint(x: 19.5339, y: 21.1034),
                          control2: CGPoint(x: 15.9083, y: 24.8692))
            path.addCurve(to: CGPoint(x: 3.3380, y: 16.4580),
                          control1: CGPoint(x: 6.9637, y: 24.8692),
                          control2: CGPoint(x: 3.3380, y: 21.1033))
            path.addCurve(to: CGPoint(x: 3.5025, y: 14.7629),
                          control1: CGPoint(x: 3.3380, y: 15.8773),
                          control2: CGPoint(x: 3.5025, y: 14.7629))
            path.addCurve(to: CGPoint(x: 11.4359, y: 14.8967),
                          control1: CGPoint(x: 3.5025, y: 14.7629),
                          control2: CGPoint(x: 7.8129, y: 16.3757))
            path.addCurve(to: CGPoint(x: 19.0805, y: 9.0039),
                          control1: CGPoint(x: 16.8644, y: 12.6806),
                          control2: CGPoint(x: 19.0805, y: 9.0039))
            path.addCurve(to: CGPoint(x: 19.5338, y: 16.4581),
                          control1: CGPoint(x: 19.3827, y: 11.2704),
                          control2: CGPoint(x: 19.5338, y: 13.8129))
            path.closeSubpath()
            path.move(to: CGPoint(x: 20.7532, y: 16.4580))
            path.addCurve(to: CGPoint(x: 28.8511, y: 24.8692),
                          control1: CGPoint(x: 20.7532, y: 21.1034),
                          control2: CGPoint(x: 24.3788, y: 24.8692))
            path.addCurve(to: CGPoint(x: 36.9490, y: 16.4580),
                          control1: CGPoint(x: 33.3234, y: 24.8692),
                          control2: CGPoint(x: 36.9490, y: 21.1034))
            path.addCurve(to: CGPoint(x: 36.7845, y: 14.7629),
                          control1: CGPoint(x: 36.9490, y: 15.8773),
                          control2: CGPoint(x: 36.7845, y: 14.7629))
            path.addCurve(to: CGPoint(x: 28.8511, y: 14.8967),
                          control1: CGPoint(x: 36.7845, y: 14.7629),
                          control2: CGPoint(x: 32.4741, y: 16.3757))
            path.addCurve(to: CGPoint(x: 21.2065, y: 9.0039),
                          control1: CGPoint(x: 23.4226, y: 12.6806),
                          control2: CGPoint(x: 21.2065, y: 9.0039))
            path.addCurve(to: CGPoint(x: 20.7532, y: 16.4581),
                          control1: CGPoint(x: 20.9043, y: 11.2704),
                          control2: CGPoint(x: 20.7532, y: 13.8129))
            path.closeSubpath()
        }
    }

    var obstaclePuyo: Path {
        return Path { path in
            path.move(to: CGPoint(x: 19.4366, y: 20.2097))
            path.addCurve(to: CGPoint(x: 10.9239, y: 28.7224),
                          control1: CGPoint(x: 19.4366, y: 24.9111),
                          control2: CGPoint(x: 15.6253, y: 28.7224))
            path.addCurve(to: CGPoint(x: 2.4112, y: 20.2097),
                          control1: CGPoint(x: 6.2225, y: 28.7224),
                          control2: CGPoint(x: 2.4112, y: 24.9111))
            path.addCurve(to: CGPoint(x: 10.9239, y: 11.6970),
                          control1: CGPoint(x: 2.4112, y: 15.5083),
                          control2: CGPoint(x: 6.2225, y: 11.6970))
            path.addCurve(to: CGPoint(x: 19.4366, y: 20.2097),
                          control1: CGPoint(x: 15.6253, y: 11.6970),
                          control2: CGPoint(x: 19.4366, y: 15.5083))
            path.closeSubpath()
            path.move(to: CGPoint(x: 37.5888, y: 20.2097))
            path.addCurve(to: CGPoint(x: 29.0761, y: 28.7224),
                          control1: CGPoint(x: 37.5888, y: 24.9111),
                          control2: CGPoint(x: 33.7775, y: 28.7224))
            path.addCurve(to: CGPoint(x: 20.5634, y: 20.2097),
                          control1: CGPoint(x: 24.3747, y: 28.7224),
                          control2: CGPoint(x: 20.5634, y: 24.9111))
            path.addCurve(to: CGPoint(x: 29.0761, y: 11.6970),
                          control1: CGPoint(x: 20.5634, y: 15.5083),
                          control2: CGPoint(x: 24.3747, y: 11.6970))
            path.addCurve(to: CGPoint(x: 37.5888, y: 20.2097),
                          control1: CGPoint(x: 33.7775, y: 11.6970),
                          control2: CGPoint(x: 37.5888, y: 15.5083))
            path.closeSubpath()
            path.move(to: CGPoint(x: 40.0000, y: 20.0000))
            path.addCurve(to: CGPoint(x: 20.0000, y: 38.0216),
                          control1: CGPoint(x: 40.0000, y: 29.9531),
                          control2: CGPoint(x: 31.0457, y: 38.0216))
            path.addCurve(to: CGPoint(x: 0.0000, y: 20.0000),
                          control1: CGPoint(x: 8.9543, y: 38.0216),
                          control2: CGPoint(x: 0.0000, y: 29.9531))
            path.addCurve(to: CGPoint(x: 20.0000, y: 1.9784),
                          control1: CGPoint(x: 0.0000, y: 10.0469),
                          control2: CGPoint(x: 8.9543, y: 1.9784))
            path.addCurve(to: CGPoint(x: 40.0000, y: 20.0000),
                          control1: CGPoint(x: 31.0457, y: 1.9784),
                          control2: CGPoint(x: 40.0000, y: 10.0469))
            path.closeSubpath()
        }
    }
}

struct Puyo_Previews: PreviewProvider {
    static var previews: some View {
        Puyo(puyoType: .green)
    }
}
