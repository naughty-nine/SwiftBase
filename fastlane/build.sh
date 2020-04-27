
# https://finestructure.co/blog/2019/6/30/adding-code-coverage-to-a-swift-package-manager-project

source ../keys/codecov.io.SwiftBase.txt

swift package generate-xcodeproj \
	--enable-code-coverage 

xcodebuild test \
  -scheme SwiftBase-Package \
  -destination 'platform=iOS Simulator,name=iPhone 11' \
  -enableCodeCoverage YES \
  -derivedDataPath .build/derivedData

bash <(curl -s https://codecov.io/bash) \
	-t "$CODECOV_TOKEN" \
	-D .build/derivedData \
	-J '^SwiftBase$' 