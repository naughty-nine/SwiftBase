
# swift package generate-xcodeproj \
# 	--enable-code-coverage 

xcodebuild test \
  -scheme SwiftBase-Package \
  -destination 'platform=iOS Simulator,name=iPhone 11' \
  -enableCodeCoverage YES \
  -derivedDataPath .build/derivedData
