.PHONY: clean
clean:
	flutter clean
	make pub_get

.PHONY: format
format:
	dart fix --apply
	flutter pub run import_sorter:main
	dart format lib/* test/*
	flutter analyze

.PHONY: builder
builder:
	make pub_get
	dart run build_runner clean
	dart run build_runner build --delete-conflicting-outputs