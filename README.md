## FB9715717

### Which area are you seeing an issue with?
FileProvider Framework
Incorrect/Unexpected Behavior

### Subject
`NSFileProviderManager.signalEnumerator` does not trigger update of `UIDocumentBrowserViewController`.

## Description 

Please find attached sample project that demonstrate the issue, along with the recorded video.

Class SessionManager calls NSFileProviderManager.default.signalEnumerator(for: .rootContainer) and extension receives it. The current SessionManage.shared.state value is properly updated from the app, and FileProvider extension gets correct value. The problem is that when FileProviderExtension.item(for:) or FileProviderExtension.enumerator(for:) throw error NSFileProviderError(.notAuthenticated), the UIDocumentBrowserViewController visible to the user does not actually update its view. To refresh the view user has to navigate outside and back.



https://user-images.githubusercontent.com/758033/138114474-a0c36f9d-a78c-4c68-aa49-0e8edf542021.mp4

