.PHONY: all
all: 3.1.2-bullseye.tar.gz 3.1.2-bookworm.tar.gz

imagedate.txt:
	date -Iseconds > imagedate.txt

3.1.2-bullseye.tar.gz: imagedate.txt Dockerfile
	docker build -t ghcr.io/lutriseng/ruby-base/3.1.2/bullseye --build-arg FLAVOR=bullseye --build-arg RUBY_VERSION=3.1.2 .
	docker save -o bullseye.tar.gz ghcr.io/lutriseng/ruby-base/3.1.2/bullseye

3.1.2-bookworm.tar.gz: imagedate.txt Dockerfile
	docker build -t ghcr.io/lutriseng/ruby-base/3.1.2/bookworm --build-arg FLAVOR=bookworm --build-arg RUBY_VERSION=3.1.2 .
	docker save -o bookworm.tar.gz ghcr.io/lutriseng/ruby-base/3.1.2/bookworm