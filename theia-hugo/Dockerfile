FROM davidvergison/theia-debian:latest
USER root

# aws-cli
RUN curl -s "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && \
    ./aws/install && \
    rm -f awscliv2.zip && rm -rf aws && \
    aws --version

# hugo
ENV HUGO_VER=hugo_0.78.2_Linux-64bit.tar.gz
RUN wget -q https://github.com/gohugoio/hugo/releases/download/v0.78.2/${HUGO_VER} && \
    tar -xzf ${HUGO_VER} && \
    mv ./hugo /usr/local/bin && \
    rm -rf ${HUGO_VER} && \
    hugo version

USER theia