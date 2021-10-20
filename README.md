## What

`NSFileProviderManager.signalEnumerator` does not trigger update of `UIDocumentBrowserViewController`.

# Please find attached sample project that demonstrate the issue, along with the recorded video.

## Description 
Class SessionManager calls NSFileProviderManager.default.signalEnumerator(for: .rootContainer) and extension receives it. The current SessionManage.shared.state value is properly updated from the app, and FileProvider extension gets correct value. The problem is that when FileProviderExtension.item(for:) or FileProviderExtension.enumerator(for:) throw error NSFileProviderError(.notAuthenticated), the UIDocumentBrowserViewController visible to the user does not actually update its view. To refresh the view user has to navigate outside and back.

