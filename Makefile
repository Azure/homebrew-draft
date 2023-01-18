install-dev:
	brew uninstall draft || true
	./create_formula.sh
	brew install --build-from-source ./Formula/draft.rb
