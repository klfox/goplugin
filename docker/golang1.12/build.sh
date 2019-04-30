git clone https://github.com/klfox/goplugin.git

cd goplugin/client
go build

cd ../plugin
go build -buildmode=plugin
