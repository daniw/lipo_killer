#!/bin/bash
# JST XH
wget -P JST_XH https://www.jst.com/wp-content/uploads/2021/01/eXH-new.pdf
wget -O JST_XH/xh_wtb.pdf https://jst.de/file/download/824/xh-wtb
jst_dir="JST_XH/"
jst_pre="B"
jst_post="B-XH-A"
jst_extension=".zip"
for pin in {2..16} 20
do
    if [ ! -f "${jst_dir}${jst_pre}${pin}${jst_post}${jst_extension}" ]; then
        curl -o /dev/null -H "Cookie: PHPSESSID=dani" "https://www.jst-mfg.com/product/index.php?type=10&series=277&doc=2&filename=${jst_pre}${pin}${jst_post}${jst_extension}"
        curl -OJ --output-dir ${jst_dir} -H "Cookie: PHPSESSID=dani" "https://www.jst-mfg.com/product/download.php"
    else
        echo "${jst_pre}${pin}${jst_post}${jst_extension} already exists"
    fi
done
