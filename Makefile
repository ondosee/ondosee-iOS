generate:
	tuist install
	tuist generate

ci_generate:
	tuist install
	TUIST_ENV=CI tuist generate

cd_generate:
	tuist install
	TUIST_ENV=CD tuist generate

clean:
	rm -rf **/*.xcodeproj
	rm -rf *.xcworkspace

reset:
	tuist clean
	rm -rf **/*.xcodeproj
	rm -rf *.xcworkspace
