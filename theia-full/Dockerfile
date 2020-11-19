FROM davidvergison/debian-base:latest

# theia
RUN apt-get install -y make pkg-config gcc g++ python libx11-dev git openssh-client bash
ARG version=latest
WORKDIR /home/theia
ADD package.json ./package.json
ARG GITHUB_TOKEN
RUN yarn --pure-lockfile && \
    NODE_OPTIONS="--max_old_space_size=4096" yarn theia build && \
    yarn theia download:plugins && \
    yarn --production && \
    yarn autoclean --init && \
    echo *.ts >> .yarnclean && \
    echo *.ts.map >> .yarnclean && \
    echo *.spec.* >> .yarnclean && \
    yarn autoclean --force && \
    yarn cache clean

# user & permissions
RUN cat /etc/group
ARG USER_ID=1000
ARG GROUP_ID=1000
# See : https://github.com/theia-ide/theia-apps/issues/34
RUN addgroup --gid ${GROUP_ID} theia
RUN adduser -u ${USER_ID} --ingroup theia --shell /bin/sh --disabled-password theia;
RUN chmod g+rw /home && \
    mkdir -p /home/project && \
    chown -R theia:theia /home/theia && \
    chown -R theia:theia /home/project;

# env & starting values
ENV HOME /home/theia
ENV SHELL=/bin/bash
ENV THEIA_DEFAULT_PLUGINS=local-dir:/home/theia/plugins
ENV USE_LOCAL_GIT true

EXPOSE 3000
ENTRYPOINT [ "node", "/home/theia/src-gen/backend/main.js", "/home/project", "--hostname=0.0.0.0" ]

USER theia