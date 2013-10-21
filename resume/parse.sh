#! /bin/bash
#将原始数据转换为HTML

umask 022
TEMPFILE=/tmp/temp
sed -n "/_.*_/,/^$/p" "$1" > $TEMPFILE

#抓取指定关键字的函数
function getKeyword() {
    KEYWORD=`grep "$2" "$1"|sed "s="$2" \(.*\)=\1="`
    echo $KEYWORD
}
#处理副标题的函数
function process() {
SUBTITLE=grep '#SUBTITLE' "$1" |sed -e 's+#SUBTITLE \(.*\)+<div class="subtitle"><h3>\1</h3></div>+'

echo $SUBTITLE
}
NAME=$(getKeyword "$1" "#NAME")
DESC=$(getKeyword "$1" "#DESC")

EMAIL=$(getKeyword "$1" "#EMAIL")
PHONE=$(getKeyword "$1" "#PHONE")
FINALLY=$(getKeyword "$1" "#FINALLY")
cat << EOFILE
<div id="page-english" class="main">
<!-- #header -->
<div id="header">
<div class="name">
<div>
EOFILE
printf "<h1>%s</h1>\n<p>%s</p>\n" "${NAME}" "${DESC}"
cat << EOFILE
</div>
</div>
<div class="contact">
EOFILE
echo ${EMAIL}|awk '{printf("<a href=mailto:\"%1$s\"> <em>%1$s</em></a>\n"),$1}'
printf "<em>%s</em>\n" "${PHONE}"
cat << EOFILE
</div>
<div class="clearboth"></div>
</div>
EOFILE
sed -e 's+_\(.*\)_+<!-- #\1 -->\n<div class="split"><h2>\1:</h2></div>+' \
    -e 's+#LINK \(.*\)+<div class="context"><strong><a target="_blank" href="http://\1">\1</a></strong></div>+' \
    -e 's+#SUBTITLE \(.*\)+<div class="subtitle"><h3>\1</h3></div>+' \
    -e 's+#BEGIN#+<div class="context"><p>+' \
    -e 's+#END#+</p></div>+' < $TEMPFILE
printf "<span><em>%s</em></span>\n" "${FINALLY}"
