import SwiftUI

struct ToolBar: View {
    @Binding var isReset: Bool
    @Binding var isSnapShot: Bool

    var body: some View {
        VStack(spacing: 8) {
            Spacer()
            Button {
                isReset = true
            } label: {
                buttonImage(systemName: "arrow.counterclockwise")
            }
            .buttonStyle(.plain)
            Button {
                isSnapShot = true
            } label: {
                buttonImage(systemName: "camera.aperture")
            }
            .buttonStyle(.plain)
        }
    }

    func buttonImage(systemName: String) -> some View {
        return Image(systemName: systemName)
            .imageScale(.large)
            .frame(width: 30, height: 30, alignment: .center)
            .foregroundColor(Color.none)
            .background(Color.secondary)
            .clipShape(Circle())
    }
}
