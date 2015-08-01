
#创建方法
'' docker build -t golang:wbuild .
'' 
#使用方法
首先设置环境变量，project值为要build的目录
然后运行
'' docker run --env project="git.coding.net/user/goproject"  -it --rm -v /Users/macuser/go/src/:/gopath/src/ golang:wbuild 

