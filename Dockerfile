# Using minimal alpine image
FROM alpine

# Ryan P Smith
LABEL maintainer="ryan@girihlet.com"
LABEL vendor="Girihlet, Inc."
LABEL usage="SeqSig"

# Install dependencies
RUN apk add --no-cache \
	git \
	bash \
	curl \
	zlib-dev \
	g++ \
	make \
	openjdk8 \
	perl \
	python \
	python3

# Install seqtk
RUN git clone https://github.com/lh3/seqtk.git && \
	cd seqtk && \
	make && \
	cp ./seqtk /bin/ && \
	cd .. && \
	rm -rf seqtk

# Install fastqc
RUN curl -O https://www.bioinformatics.babraham.ac.uk/projects/fastqc/fastqc_v0.11.7.zip && \
	unzip fastqc_v0.11.7.zip && \
	rm fastqc_v0.11.7.zip && \
	chmod 755 FastQC/fastqc && \
	ln -s /FastQC/fastqc /bin/fastqc

ENTRYPOINT ["bash"]
