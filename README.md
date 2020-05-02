# SwiftBase

[![codecov](https://codecov.io/gh/naughty-nine/SwiftBase/branch/master/graph/badge.svg)](https://codecov.io/gh/naughty-nine/SwiftBase)

A collection of extensions to Swift, Foundation, CoreGraphics, CoreData, UIKit & SwiftUI targeted for iOS 13+.

## Installation

### Swift Package Manager
Add `https://github.com/naughty-nine/SwiftBase` to Swift Packages in your Xcode project.

Or add the dependency to Package.swift:

```swift
dependencies: [
  .package(url: "https://github.com/naughty-nine/SwiftBase", from: "0.2.0"),
],
targets: [
  .target( name: "YourTarget", dependencies: ["SwiftBase"]),
]
```
## Run tests
```bash
.scripts/test.sh
```