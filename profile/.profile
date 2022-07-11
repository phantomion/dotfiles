export EDITOR="nvim"
export BROWSER="firefox"
export PATH=$HOME/.nimble/bin:$PATH
export EXA_COLORS="di=35"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export PATH="$CARGO_HOME/bin:$PATH"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export GOPATH="$XDG_DATA_HOME/go"
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc"
export LESSHISTFILE=-
export GRIPHOME="$XDG_CONFIG_HOME/grip"
export GEM_HOME="$XDG_DATA_HOME/gem"
export PATH="$GEM_HOME/ruby/2.6.0/bin:$PATH"
export PATH="$GEM_HOME/ruby/2.7.0/bin:$PATH"
export PATH="$GEM_HOME/ruby/3.0.0/bin:$PATH"
export PATH="$HOME/.gem/ruby/3.0.0/bin:$PATH"
export PATH="$HOME/.gem/ruby/2.7.0/bin:$PATH"
export PATH="$GOPATH/bin:$PATH"
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
export WINEPREFIX="$XDG_DATA_HOME/wineprefixes/default"
export SSH_ASKPASS="/usr/bin/lxqt-openssh-askpass"
export JAVA_HOME="/usr/lib/jvm/java-8-openjdk"
export PATH="/usr/lib/jvm/java-8-openjdk/bin:$PATH"
export QT_QPA_PLATFORMTHEME=qt5ct
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export PATH=$HOME/.config/rofi/bin:$PATH

update-docker-hosts(){
        # clear existing *.docker.local entries from /etc/hosts

        os=`uname -s`
        case $os in
          Darwin)
            sudo sed -i -e '/^127\.0\.0\.1/s/ bo-egov2\.dev\.edu\.uoc\.gr\.local//;/^127\.0\.0\.1/s/ egov2\.dev\.edu\.uoc\.gr\.local//;;/^127\.0\.0\.1/s/$/#/;/^127\.0\.0\.1/s/#.*/ bo-egov.dev.edu.uoc.gr.local &/;/^127\.0\.0\.1/s/#.*/ egov.dev.edu.uoc.gr.local &/;/^127\.0\.0\.1/s/#$//' /etc/hosts
            ;;
          *)
            sudo sed -i -e '/dev\.edu\.uoc\.gr\.local$/d' /etc/hosts

            # get ip of running machine
            export DOCKER_IP="$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' egov2)"

            # update /etc/hosts with docker machine ip
            [[ -n $DOCKER_IP ]] && sudo /bin/bash -c "echo \"${DOCKER_IP}       egov2.dev.edu.uoc.gr.local\" >> /etc/hosts"
            [[ -n $DOCKER_IP ]] && sudo /bin/bash -c "echo \"${DOCKER_IP}       bo-egov2.dev.edu.uoc.gr.local\" >> /etc/hosts"
            ;;
        esac
}
