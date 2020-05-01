# SwiftBase

[![codecov](https://codecov.io/gh/naughty-nine/SwiftBase/branch/master/graph/badge.svg)](https://codecov.io/gh/naughty-nine/SwiftBase)

A collection of extensions to Foundation, UIKit, SwiftUI, CoreData targeted for iOS 13+.

# Installation

## [Swift Package Manager](https://github.com/apple/swift-package-manager)
Add `https://github.com/naughty-nine/SwiftBase` to Swift Packages in your Xcode project.

Or add the dependency to your Package.swift file:

```swift
dependencies: [
    .package(url: "https://github.com/naughty-nine/SwiftBase", from: "0.2.0"),
],
targets: [
    .target( name: "YourTarget", dependencies: ["SwiftBase"]),
]
```