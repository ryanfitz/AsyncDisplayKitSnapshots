SWIFTLINT := $(shell command -v swiftlint 2> /dev/null)

default: test

install-deps:
ifndef SWIFTLINT
	brew install swiftlint
endif
	bundle install
	bundle exec pod install

test:
	bundle exec fastlane test

test-cov: test
	bundle exec slather coverage -s

test-cov-html: test
	bundle exec slather coverage --html --show

lint:
	swiftlint
