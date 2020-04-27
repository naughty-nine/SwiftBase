#
# Usage: 
# `source build.sh` from project root
#
# https://finestructure.co/blog/2019/6/30/adding-code-coverage-to-a-swift-package-manager-project
#
source ../keys/codecov.io.SwiftBase.txt
echo "codecov.io upload token: $CODECOV_TOKEN"

bash <(curl -s https://codecov.io/bash) \
	-t "$CODECOV_TOKEN" \
	-D .build/derivedData \
	-J '^SwiftBase$' 
