all: test

manifest = com.valvesoftware.Steam.json

test: repo $(manifest)
	flatpak-builder --force-clean --repo=repo --ccache --require-changes valve $(manifest)
	flatpak build-update-repo repo

repo:
	ostree init --mode=archive-z2 --repo=repo
