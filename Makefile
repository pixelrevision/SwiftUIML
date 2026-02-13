.PHONY: lint test testquiet format watchformat packagebuild coretest snapshottest tssnapshottest packagelint packageformat tstest tslint tsformat tsgeneratetestcases

SIM_NAME := SwiftUIML-Test
SIM_DEVICE := com.apple.CoreSimulator.SimDeviceType.iPhone-16
SIM_RUNTIME := com.apple.CoreSimulator.SimRuntime.iOS-18-5
SCHEME := SwiftUIML

packagebuild:
	$(eval SIM := $(shell ./Scripts/sim.sh "$(SIM_NAME)" "$(SIM_DEVICE)" "$(SIM_RUNTIME)" | tail -1))
	@xcrun xcodebuild -scheme $(SCHEME) -destination "platform=iOS Simulator,id=$(SIM)" build 2>&1 | xcbeautify

coretest:
	$(eval SIM := $(shell ./Scripts/sim.sh "$(SIM_NAME)" "$(SIM_DEVICE)" "$(SIM_RUNTIME)" | tail -1))
	@xcrun xcodebuild -scheme SwiftUIML-Package -destination "platform=iOS Simulator,id=$(SIM)" -only-testing:SwiftUIMLCoreTests test 2>&1 | xcbeautify

snapshottest:
	$(eval SIM := $(shell ./Scripts/sim.sh "$(SIM_NAME)" "$(SIM_DEVICE)" "$(SIM_RUNTIME)" | tail -1))
	@xcrun xcodebuild -scheme SwiftUIML-Package -destination "platform=iOS Simulator,id=$(SIM)" -only-testing:SwiftUIMLTests test 2>&1 | xcbeautify

tssnapshottest: tsgeneratetestcases
	$(eval SIM := $(shell ./Scripts/sim.sh "$(SIM_NAME)" "$(SIM_DEVICE)" "$(SIM_RUNTIME)" | tail -1))
	$(eval VIEW_TESTS := $(shell find Tests/SwiftUIMLTests/Views -name "*Tests.swift" -exec basename {} .swift \; | sed 's/^/-only-testing:SwiftUIMLTests\//' | tr '\n' ' '))
	$(eval MODIFIER_TESTS := $(shell find Tests/SwiftUIMLTests/Modifiers -name "*Tests.swift" -exec basename {} .swift \; | sed 's/^/-only-testing:SwiftUIMLTests\//' | tr '\n' ' '))
	@TEST_RUNNER_SWIFTUIML_TEST_LANGUAGE=TypeScript xcrun xcodebuild -scheme SwiftUIML-Package -destination "platform=iOS Simulator,id=$(SIM)" $(VIEW_TESTS) $(MODIFIER_TESTS) test 2>&1 | xcbeautify

tstest-single: tsgeneratetestcases
	$(eval SIM := $(shell ./Scripts/sim.sh "$(SIM_NAME)" "$(SIM_DEVICE)" "$(SIM_RUNTIME)" | tail -1))
	@TEST_RUNNER_SWIFTUIML_TEST_LANGUAGE=TypeScript xcrun xcodebuild -scheme SwiftUIML-Package -destination "platform=iOS Simulator,id=$(SIM)" -only-testing:SwiftUIMLTests/$(TEST) test 2>&1

packageformat:
	swiftlint --fix

packagelint:
	swiftlint

tstest:
	cd TypeScript && npm run test && cd ../

tsformat:
	cd TypeScript && npm run format && cd ../

tslint:
	cd TypeScript && npm run format:check && cd ../

tsgeneratetestcases:
	cd TypeScript && npm run generate:test-cases && cd ../

format: packageformat tsformat

watchformat:
	@./Scripts/watch-format.sh

test: coretest snapshottest tssnapshottest tstest

testquiet:
	@echo "=========================================="
	@echo "Swift Core Tests"
	@echo "=========================================="
	@$(eval SIM := $(shell ./Scripts/sim.sh "$(SIM_NAME)" "$(SIM_DEVICE)" "$(SIM_RUNTIME)" | tail -1))
	@xcrun xcodebuild -scheme SwiftUIML-Package -destination "platform=iOS Simulator,id=$(SIM)" -only-testing:SwiftUIMLCoreTests test 2>&1 | xcbeautify | tail -5 | grep -vE "(started at|Testing started)" || true
	@echo "=========================================="
	@echo "Swift Snapshot Tests"
	@echo "=========================================="
	@$(eval SIM := $(shell ./Scripts/sim.sh "$(SIM_NAME)" "$(SIM_DEVICE)" "$(SIM_RUNTIME)" | tail -1))
	@xcrun xcodebuild -scheme SwiftUIML-Package -destination "platform=iOS Simulator,id=$(SIM)" -only-testing:SwiftUIMLTests test 2>&1 | xcbeautify | tail -5 | grep -vE "(started at|Testing started)" || true
	@echo "=========================================="
	@echo "TypeScript Tests"
	@echo "=========================================="
	@cd TypeScript && npm run test 2>&1 | grep -E "(# tests|# suites|# pass|# fail)" && cd ../ || true

lint: packagelint tslint

cleanexample:
	cd TypeScript && npm run build && cd ../
	cd Example/Server && npm install && cd ../
