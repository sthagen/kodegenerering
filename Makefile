.DEFAULT_GOAL := all
isort = isort kodegenerering test
black = black -S -l 120 --target-version py39 kodegenerering test

.PHONY: install
install:
	pip install -U pip wheel
	pip install -r test/requirements.txt
	pip install -U .

.PHONY: install-all
install-all: install
	pip install -r test/requirements-dev.txt

.PHONY: format
format:
	$(isort)
	$(black)

.PHONY: lint
lint:
	python setup.py check -ms
	flake8 kodegenerering/ test/
	$(isort) --check-only --df
	$(black) --check --diff

.PHONY: mypy
mypy:
	mypy kodegenerering

.PHONY: fixtures
fixtures:
	mkdir -p test/fixtures/cache && cd test/fixtures/cache && touch index

.PHONY: test
test: clean fixtures
	pytest --asyncio-mode=strict --cov=kodegenerering --cov-report term-missing:skip-covered --cov-branch --log-format="%(levelname)s %(message)s"

.PHONY: testcov
testcov: test
	@echo "building coverage html"
	@coverage html

.PHONY: all
all: lint mypy testcov

.PHONY: clean
clean:
	rm -rf `find . -name __pycache__`
	rm -f `find . -type f -name '*.py[co]' `
	rm -f `find . -type f -name '*~' `
	rm -f `find . -type f -name '.*~' `
	rm -rf .cache
	rm -rf htmlcov
	rm -rf *.egg-info
	rm -f .coverage
	rm -f .coverage.*
	rm -rf build
	rm -rf test/fixtures/cache
	rm -f kodegenerering-report.*
	python setup.py clean

.PHONY: name
name:
	@printf "Revision.is(): sha1:%s\n" "$$(git rev-parse HEAD)"
	@printf "Name.derive(): '%s'\n" "$$(git-release-name "$$(git rev-parse HEAD)")"
