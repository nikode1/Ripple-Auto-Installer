cd $1
mkdir -p goenv
echo "export GOPATH=\$HOME/goenv
export GOBIN=\$GOPATH/bin" > .goenvrc
echo "
source ~/.goenvrc" >> .bashrc
chmod u+x .goenvrc
chown -R $2:$2 .goenvrc goenv
