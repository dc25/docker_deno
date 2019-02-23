FROM sshd

ARG user
ARG id

RUN apt-get update && apt-get install -y \
    curl \
    gcc \
    git \
    entr 

COPY build_scripts/install_deno.sh /tmp
RUN su ${user} /tmp/install_deno.sh

COPY build_scripts/install_npm.sh /tmp
RUN /tmp/install_npm.sh

COPY build_scripts/install_javascript_typescript_langserver.sh /tmp
RUN /tmp/install_javascript_typescript_langserver.sh

COPY build_scripts/setup_vim_plug.sh /tmp
RUN su ${user} -c /tmp/setup_vim_plug.sh

COPY build_scripts/myVimrc /tmp
RUN su ${user} -c 'cp /tmp/myVimrc ~'
RUN su ${user} -c "echo so ~/myVimrc | tee -a ~/vimrc"

COPY build_scripts/install_neovim_plugins.sh /tmp
RUN su ${user} -c /tmp/install_neovim_plugins.sh

### COPY build_scripts/install_vscode.sh /tmp
### RUN /tmp/install_vscode.sh

COPY build_scripts/myBashrc /tmp
RUN su ${user} -c 'cp /tmp/myBashrc ~'
RUN su ${user} -c 'echo . ~/myBashrc | tee -a ~/.bashrc'

