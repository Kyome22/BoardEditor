import SwiftUI
import UniformTypeIdentifiers

extension View {
    func getSnapshotRep() -> NSBitmapImageRep? {
        let hostingView = NSHostingView(rootView: self)
        hostingView.setFrameSize(hostingView.fittingSize)
        guard let bitmapRep = hostingView.bitmapImageRepForCachingDisplay(in: hostingView.bounds) else {
            return nil
        }
        bitmapRep.size = hostingView.bounds.size
        hostingView.cacheDisplay(in: hostingView.bounds, to: bitmapRep)
        return bitmapRep
    }

    func saveSnapshot() {
        guard let rep = self.getSnapshotRep() else { return }
        let savePanel = NSSavePanel()
        savePanel.directoryURL = URL(fileURLWithPath: "\(NSHomeDirectory())/Desktop")
        savePanel.allowedContentTypes = [UTType.png]
        savePanel.canCreateDirectories = true
        savePanel.isExtensionHidden = false
        savePanel.message = "Save Snapshot"
        if let window = NSApplication.shared.mainWindow {
            savePanel.beginSheetModal(for: window) { response in
                if response == .OK, let url = savePanel.url {
                    let data = rep.representation(using: .jpeg, properties: [:])
                    try? data?.write(to: url)
                }
            }
        } else if savePanel.runModal() == .OK, let url = savePanel.url {
            let data = rep.representation(using: .png, properties: [:])
            try? data?.write(to: url)
        }
    }
}
