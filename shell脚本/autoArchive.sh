# 传入这次的版本号
version_string=$1

# build号  我们是使用前时间作为build号的 2016041517 即为16年4月15号17点
build_number=$(date +%Y%m%d%H)

# 清空上一次的文件夹
#rm -rf ~/Desktop/project

# 创建要工作的文件夹
#mkdir ~/Desktop/project

# 进入要工作的文件夹
cd ~/Desktop/project

# 去svn上拉取最新的代码 如果你们使用的git或其他版本控制则修改对应的拉取代码命令即可
#svn export svn://https://jiangke@svn.bxt189.com:435/svn/yidongzhanye/rbs/trunk/picc/WebContent/H5

# 下面是一些用到的变量给抽取出来了
# 工程环境路径
workspace_path=~/Desktop/project/BanTang/BanTang

# 打包项目名字
scheme_name=BanTang

# 打包使用的证书 
CODE_SIGN_IDENTITY="LanZhou SeKeSeSi Electronic Technology CO.,LTD"

# 打包使用的描述文件 这描述文件的名字不是自己命名的那个名字，而是对应的8b11ac11-xxxx-xxxx-xxxx-b022665db452这个名字
PROVISIONING_PROFILE="01b132c2-8e70-44ab-a4d3-e1525d3dad44"

# 指定BanTang.app的输出位置 也就是Demo中build文件夹的位置
build_path=~/Desktop/project/build

# 指定BanTang.ipa的输出位置
ipa_path=~/Desktop/project

# info.plist文件的位置
info_plist=~/Desktop/project/BanTang/BanTang/Info.plist

# 下面是读取.plist文件的位置然后修改版本号和build号，这点没有使用xcodebuild提供的命令，在上面也有叙述
# 修改版本号
/usr/libexec/PlistBuddy -c "Set :CFBundleShortVersionString $version_string" ${info_plist}

# 修改build号
/usr/libexec/PlistBuddy -c "Set :CFBundleVersion $build_number" ${info_plist}

# 生成BanTang.app, 在build_path路径下面
xcodebuild -workspace ${workspace_path}.xcworkspace -scheme ${scheme_name} -configuration Release clean -sdk iphoneos build CODE_SIGN_IDENTITY="${CODE_SIGN_IDENTITY}" PROVISIONING_PROFILE="${PROVISIONING_PROFILE}" SYMROOT="${build_path}"

# 生成BanTang.ipa, 在ipa_path路径下面
xcrun -sdk iphoneos -v PackageApplication ${build_path}/Release-iphoneos/BanTang.app -o ${ipa_path}/BanTang_ios_${version_string}.ipa

# .ipa文件的位置
ipa_file_path=~/Desktop/project/BanTang_ios_${version_string}.ipa

# .plist文件的位置
plist_file_path=~/Desktop/project/BanTang_ios_${version_string}.plist

# 这里就要把.ipa和.plist文件上传到对应的服务器上，当然这一步也是可以使用命令来完成的。
# 这里要看你们要把测试包上传到哪儿，Fir、蒲公英、七牛等一般都提供了命令上传文件的方式。
# 如果需要修改数据库中测试包的指向，也可以开一个网络请求接口然后使用curl命令共同集成到测试包中。
# 同样可以增加一些判断(判断需要上次的文件存在不存在)和一些Log输出来让此脚本更为清晰安全和准确。