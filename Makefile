all: FORCE
	docker build -t docker.io/smstong/w0:latest .
	docker push docker.io/smstong/w0:latest

FORCE:
