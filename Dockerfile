FROM            ubuntu:14.04

MAINTAINER      Julien Phalip <jphalip@gmail.com>

ENV             MCROUTER_BRANCH         release-40-0
ENV             MCROUTER_DIR            /usr/local/mcrouter
ENV             MCROUTER_REPO           https://github.com/facebook/mcrouter.git
ENV             DEBIAN_FRONTEND         noninteractive

RUN             apt-get update && apt-get install -y git curl software-properties-common && \
                mkdir -p $MCROUTER_DIR/repo && \
                cd $MCROUTER_DIR/repo && git clone $MCROUTER_REPO && \
                cd $MCROUTER_DIR/repo/mcrouter/mcrouter/scripts && \
                git checkout $MCROUTER_BRANCH && \
                ./install_ubuntu_14.04.sh $MCROUTER_DIR && \
                ./clean_ubuntu_14.04.sh $MCROUTER_DIR && rm -rf $MCROUTER_DIR/repo && \
                ln -s $MCROUTER_DIR/install/bin/mcrouter /usr/local/bin/mcrouter

ENV             DEBIAN_FRONTEND newt
