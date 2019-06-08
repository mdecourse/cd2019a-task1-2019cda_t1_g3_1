<?xml version="1.0" encoding="utf-8"?>
<!-- Created by Leo: http://leoeditor.com/leo_toc.html -->
<leo_file xmlns:leo="http://leoeditor.com/namespaces/leo-python-editor/1.1" >
<leo_header file_format="2"/>
<globals/>
<preferences/>
<find_panel_settings/>
<vnodes>
<v t="ahshoe.20161120121808.1"><vh>@settings</vh>
<v t="ahshoe.20170315212615.1"><vh>@data qt-gui-plugin-style-sheet</vh></v>
<v t="ahshoe.20170315212626.1"><vh>@string initial_split_orientation = horizontal</vh></v>
</v>
<v t="40323230.20170123213451.1"><vh>@button Report pdf</vh></v>
<v t="yen.20170429132400.1"><vh>協同著作規劃</vh></v>
<v t="yen.20170429103742.1"><vh>@path ./../</vh>
<v t="yen.20170429103940.1"><vh>@path markdown</vh>
<v t="ahshoe.20170322182713.1"><vh>@edit reference.md</vh></v>
<v t="ahshoe.20170322181453.1"><vh>@edit refer.bib</vh></v>
<v t="leo.20171119234752.1"><vh>封面以及摘要</vh>
<v t="ahshoe.20161120122151.1"><vh>@clean cover_and_abstract.md</vh>
<v t="ahshoe.20170317115820.1"><vh>摘要</vh></v>
</v>
</v>
<v t="leo.20171119234822.1"><vh>各章節內容</vh>
<v t="yen.20170429214845.1"><vh>@path paragraph</vh>
<v t="leo.20190106201047.1"><vh>@clean introduction.md</vh></v>
<v t="leo.20190519180750.1"><vh>@clean tablefootball_design.md</vh>
<v t="leo.20190519181552.1"><vh>零組件尺寸分析</vh></v>
<v t="leo.20190519181710.1"><vh>參數設計與繪圖</vh></v>
<v t="leo.20190519181713.1"><vh>細部設計與 BOM</vh></v>
</v>
<v t="leo.20190519180919.1"><vh>@clean vrep_tablefootball.md</vh></v>
<v t="leo.20190106201247.3"><vh>@clean vrep_take_ball.md</vh>
<v t="leo.20190519181857.1"><vh>送球機構設計</vh></v>
<v t="leo.20190519181902.1"><vh>送球機構模擬</vh></v>
</v>
<v t="leo.20190110193829.1"><vh>@clean vrep_python_control.md</vh>
<v t="leo.20190519182839.1"><vh>雙人鍵盤控制對打</vh></v>
<v t="leo.20190519182843.1"><vh>單人鍵盤控制與電腦對打</vh></v>
<v t="leo.20190519182841.1"><vh>雙電腦對打</vh></v>
<v t="leo.20190601163505.1"><vh>影像辨識</vh></v>
<v t="leo.20190601163506.1"><vh>影像辨識對打</vh></v>
</v>
</v>
</v>
</v>
</v>
</vnodes>
<tnodes>
<t tx="40323230.20170123213451.1">@language python
filename = "report"
import os, platform
import chapter
# 更換目錄到 markdown 
os.chdir("./../markdown")

# 若在 Linux 環境則使用 ukai.ttc 系統字形
if platform.system().lower()=="linux": font = "ukai.ttc"
# 在 windows 環境使用 SimSun 字形
elif platform.system().lower()=="windows": font = "SimSun"
else: font = "Arial"
fontsize = "12"
margin = "1in"
# --pdf-engine 使用 xelatex
# lang 請參照 https://tools.ietf.org/html/bcp47, 這裡的 zh-cmn 為 Mandarin Chinese 國語
# -V lang=zh-cmn 為一組 key=value 對應的 Variable 設定
# -N 表示 Number section headings in LaTeX, ConTeXt, HTML, or EPUB output. By default, sections are not numbered.
settingFlag = "--pdf-engine=xelatex -V lang=zh-cmn -N --toc --highlight-style kate -V documentclass=report  --filter pandoc-fignos --filter pandoc-tablenos --template=template.tex -V \"CJKmainfont:{0}\" -V fontsize={1}pt -V geometry:margin={2} --bibliography=refer.bib --csl=ieee.csl".format(font, fontsize, margin)
g.es("---Pandoc---")

# 選擇所要納入的 Markdown 檔案, 不納入的檔案名稱前方加上  # 即可
chapter_list = " ".join("./paragraph/" + i for i in [
"introduction.md", 
"tablefootball_design.md", 
"vrep_take_ball.md", 
"vrep_tablefootball.md",
"vrep_python_control.md"
])

# 若系統並未正確轉檔, 可以將 os.system 改為 g.es 表示要使用 Leo Editor 的 global 物件中的 echo string 將指令印在 log 區
# 然後複製指令, 然後在命令列視窗中的 markdown 目錄中執行, 就可以得到錯誤訊息
# 或許可以再從 https://stackoverflow.com/questions/26005583/return-value-of-x-os-system 中的建議改進此一指令
g.es(os.system("pandoc cover_and_abstract.md " + chapter_list + " reference.md -o ../pdf/report.pdf {}".format(settingFlag)))
g.es("pandoc cover_and_abstract.md " + chapter_list + " reference.md -o ../pdf/report.pdf {}".format(settingFlag))
g.es("PDF 轉換完畢")
g.es('-'*12)</t>
<t tx="ahshoe.20161120121808.1"></t>
<t tx="ahshoe.20161120122151.1">---
university_zh: '國立虎尾科技大學'
institute_zh: '機械設計工程系'
category_zh: '產品協同設計第三組'
title_zh: '手足球'
title_en: 'Table Football'
author:
- 設計二甲 40623105 陳微云
- 設計二甲 40623109 李如芳
- 設計二甲 40623112 王柏翔
- 設計二甲 40623118 楊秉澤
- 設計二甲 40623125 鍾旻諺
- 設計二甲 40623127 張育偉 
- 設計二甲 40623128 張華倞
- 設計二甲 40623135 洪明棋
- 設計二甲 40623141 何立翔
- 設計二甲 40623156 林聖翰
advisor_zh: '嚴家銘'
---

@others
</t>
<t tx="ahshoe.20170315212615.1">QTreeWidget {
    /* These apply to the selected item, but not to editing items.*/
    background-color: #ffffec; /* Leo's traditional tree color */
    selection-color: black; /* was white */
    selection-background-color: lightgrey;
    /* font-family: SansSerif; */
    /*font-family: DejaVu Sans Mono;*/
    font-family:YaHei Mono;
    /* 標題字型大小設定 */
    font-size: 20px;
    font-weight: normal; /* normal,bold,100,..,900 */
    font-style: normal; /* normal, italic,oblique */
 }

/* Headline edit widgets */
QTreeWidget QLineEdit {
    background-color: cornsilk;
    selection-color: white;
    selection-background-color: blue;
    /*font-family: DejaVu Sans Mono;*/    
    font-family:YaHei Mono;
    /* 沒有特別對應字型大小 */
    font-size: 20px;
    font-weight: normal; /* normal,bold,100,..,900 */
    font-style: normal; /* normal, italic,oblique */
}

/* The log panes */
QTextEdit {
    background-color: #f2fdff;
    selection-color: red;
    selection-background-color: blue;
    /* font-family: Courier New; */
    font-family:YaHei Mono;
    /* log font 大小 */
    font-size: 20px;
    font-weight: normal; /* normal,bold,100,..,900 */
    font-style: normal; /* normal, italic,oblique */
}

/* The body pane */
QTextEdit#richTextEdit {
    background-color: #fdf5f5; /* A kind of pink. */
    selection-color: white;
    selection-background-color: red;
    /*font-family: DejaVu Sans Mono;*/
    /* font-family: Courier New; */
    font-family:YaHei Mono;
    /* 內文字型大小 */
    font-size: 20px;
    font-weight: normal; /* normal,bold,100,..,900 */
    font-style: normal; /* normal,italic,oblique */
}

QLabel {
    font-family:YaHei Mono;'CherryPy', 'pytz', 'mako', 'beautifulsoup4', 'pymysql', 'peewee'
    /* 下方的 Minibuffer 標題字型大小 */
    font-size: 20px;
    font-weight: normal; /* normal,bold,100,..,900 */
    font-style: normal; /* normal,italic,oblique */
}

/* Editor labels */
QLineEdit#editorLabel {
    background-color: #ffffec;
    font-family:YaHei Mono;
    /* 沒有直接對應字型大小 */
    font-size: 20px;
    font-weight: normal; /* normal,bold,100,..,900 */
    font-style: normal; /* normal,italic,oblique */
    border: 2px;
    margin: 2px;
}</t>
<t tx="ahshoe.20170315212626.1">horizontal: body pane to the left
vertical: body pane on the botton</t>
<t tx="ahshoe.20170317115820.1">---
abstract: |
    手足球系統設計
    
    手足球系統模擬
    
    送球機構設計
    
    送球機構模擬
    
    手足球系統功能
    
---


</t>
<t tx="leo.20171119234752.1"></t>
<t tx="leo.20171119234822.1"></t>
<t tx="leo.20190106201047.1">前言
===

![Test][test]

[test]: ./images/kmol.png {#fig:駱駝}


@others
</t>
<t tx="leo.20190106201247.3"> 送球機構設計與模擬
===


@others
</t>
<t tx="leo.20190110193829.1">系統功能展示
===

@others
</t>
<t tx="leo.20190519180750.1">設計與繪圖
===


@others
</t>
<t tx="leo.20190519180919.1">手足球系統模擬
===



@others
</t>
<t tx="leo.20190519181552.1">零組件尺寸分析
---

7.送球機構:

在撥桿的部分原本是呈現長方形的，因考慮到了沒有角度在撥球時可能會造成球的動向無法預期，所以在兩邊斜面的部分增加了10度的傾角。


![撥桿修改圖][polemod]

[polemod]: ./images/撥桿修改圖.jpg

搭配撥桿的造型後，在外殼的設計上各增加了厚度5mm，而在與撥桿相差2mm的誤差是因為組員反映出在v-rep模擬時兩機件會互相干涉，所以更動了原先的尺寸。

![送球機構本體修改圖][bsmmod]

[bsmmod]: ./images/送球機透本體修改圖.jpg

在進球口高度的設計上，為了方便負責軌道組員的製作，所以將孔的位置標於圓的底部，而球口的高度也有經過設計，與撥桿的部分切齊在進球時不會造成干涉。

![入球口修改圖][bmmod]

[bmmod]: ./images/入球口修改圖.jpg



![撥桿修改圖][SAM0]



繪圖影片

https://youtu.be/l5HXjuSZNig

@others
</t>
<t tx="leo.20190519181710.1">參數設計與繪圖
---
w11進度

本周進行人員的工作分配，王柏翔與鍾旻諺分配到參數設計與繪圖的工作，我們先上網搜尋手足球桌的國際規格之後，參考國際比賽桌的尺寸之後再做了一些些微的調整，為了之後設計和配合可以方便一點。

![國際球桌][nike]


[nike]: ./images/w11-1.png

[SAM2]: ./images/入球口修改圖.jpg



W12進度

本周繪製完(球桌)(球員)，和一些((手把)和串聯球員的(桿件)，以及另外一個分工小組的分球機構還在等我們的尺寸確定，他們的送球軌道尺寸才能配合到我們的球桌上，配合之後我們兩邊再去做一些尺寸的微調，讓分球機構能完美的和球桌合體。


![球桌][nikeD]

[nikeD]: ./images/w12-1.png

![球員][nikeS]

[nikeS]: ./images/w12-2.png

![送球機構零件][nikeA]

[nikeA]: ./images/w12-3.png

![送球機構零件][nikeF]

[nikeF]: ./images/w12-4.png

W13進度

本周我們進行零組件、送球機構、足球桌的組裝，組裝之後我們發現各組件在配合上有些許的誤差，在設定球員和手把連桿時我們為了設定它的移動範圍花了許多的時間，因為不知道為什麼同樣的參數卻不能套用在同位置的球桿上，所以我們只好每根都自己慢慢的去試，才不會讓它過度移動(例如整根拔出來)，不過在其他組員分工的幫忙下順利的組裝完成了。

![球桌組合圖][nikeG]

[nikeG]: ./images/w13-1.png

![送球機構組合圖][nikeH]

[nikeH]: ./images/w-13-2.png

W14進度

我們把所有機構做組裝，發現球員與球員間會互相碰撞所以去做了尺寸上的更改，把球員長度改到以下尺寸並把球桌的洞上下間距做更改。

![球員尺寸更改圖][nikeJ]

[nikeJ]: ./images/w14-1.png

W15進度

我們前兩個禮拜已經把所有機構做好限制，這禮拜做最後檢查然後就把圖交由操作V-rep組員去做簡化與模擬。

8.球門:

球門的外型依照球桌的大小與軌道的進球口進行尺寸配合，內部為了讓球可以順利的進入軌道進行了多次的斜度變動，在進球口處也利用圓角讓球可以更順暢的流通，外型用Draft分上下殼修改外型的斜度。

![球門3D圖][goals]

[goals]: ./images/球門3D圖.png




送球機構繪製:https://youtu.be/l5HXjuSZNig


@others
</t>
<t tx="leo.20190519181713.1">細部設計與 BOM
---

發球機構: 

1.發球機構本體:

工程圖連結網址請點這:https://cad.onshape.com/documents/7063242033d0934280d360d8/w/172d28e1bcc6647f37e823d3/e/cc2fcff733a6da56f285b8b8

![發球機構本體][bsmt]

[bsmt]: ./images/發球機構本體.jpg

2.撥桿:

工程圖連結網址請點這:https://cad.onshape.com/documents/7063242033d0934280d360d8/w/172d28e1bcc6647f37e823d3/e/79a2471d3dbdab0247698c7b

![撥桿][polet]

[polet]: ./images/撥桿.jpg


3.球桌:

工程圖連結網址請點這:https://cad.onshape.com/documents/7063242033d0934280d360d8/w/172d28e1bcc6647f37e823d3/e/af2860e27a45e3d65e4744ae

![球桌][poletA]

[poletA]: ./images/球桌 bomnew.png

4.手把:

工程圖連結網址請點這:https://cad.onshape.com/documents/7063242033d0934280d360d8/w/172d28e1bcc6647f37e823d3/e/0ffbf2d9caded49fe7b47679

![手把][poletS]

[poletS]: ./images/手把 bomnew.png

5.桿子:

工程圖連結網址請點這:https://cad.onshape.com/documents/7063242033d0934280d360d8/w/172d28e1bcc6647f37e823d3/e/558a2fa8dc9cd780958dc74f

![桿子][poletD]

[poletD]: ./images/桿子.png



3.球門:

工程圖連結網址請點這:https://cad.onshape.com/documents/7063242033d0934280d360d8/w/172d28e1bcc6647f37e823d3/e/87427ddbdbb5063db4e9e7e7

![球門三視圖][gole]

[gole]: ./images/球門三視圖.png



@others
</t>
<t tx="leo.20190519181857.1">送球機構設計
---

本組將軌道的部分隱藏在球桌下方，軌道不凸出球桌外圍影響操作者操作，此外也將發球機構簡單化，利用單純的轉動系統讓球進入機構後以撥桿旋轉將球從球桌正中間發出，而選轉撥桿的好處還有能依得分系統的判斷，以正逆轉的方式控制球的動向。

![送球機構設計][partdd]

[partdd]: ./images/送球機構設計 .jpg




@others
</t>
<t tx="leo.20190519181902.1">送球機構模擬
---
40623156

製作發球機構模擬，確定發球機構能順利進行發球的動作。

https://youtu.be/VNxQo9RTClY



@others
</t>
<t tx="leo.20190519182839.1">雙人鍵盤控制對打
---



@others
</t>
<t tx="leo.20190519182841.1">雙電腦對打
---



@others
</t>
<t tx="leo.20190519182843.1">單人鍵盤控制與電腦對打
---



@others
</t>
<t tx="leo.20190601163505.1">影像辨識
---

利用vrep的vision sensor來拍攝模擬畫面，並輸出至外部python程式中進行影像處理。

首先進行影像模糊化來降低雜訊

![原圖][opencvori]

[opencvori]: ./images/opencv_ori.png {#fig:駱駝}

![模糊處理後][opencvblur]

[opencvblur]: ./images/opencv_blur.png {#fig:駱駝}

處理完的圖片再進行顏色處理把RGB轉為

![hsv處理後][opencvhsv]

[opencvhsv]: ./images/opencv_hsv.png {#fig:駱駝}

處理完後運用opencv的
[canny](https://docs.opencv.org/2.4/doc/tutorials/imgproc/imgtrans/canny_detector/canny_detector.html)
來尋找物體邊界，並用找到的邊界計算形心位置。


@others
</t>
<t tx="leo.20190601163506.1">影像辨識電腦對打
---


利用上一節所得形心座標判斷各球員與球的相對運動
，再利用判斷的結果控制球員該往哪裡移動，或是否該踢球(整體架構如下圖)。

![守門員程式架構][Diagram]

[Diagram]: ./images/Diagram.png {#fig:駱駝}

@others
</t>
<t tx="yen.20170429103742.1"></t>
<t tx="yen.20170429103940.1"></t>
<t tx="yen.20170429132400.1">每一位協同人員各在 users 目錄中建立一個 .leo 檔案

各自選擇要編輯的 .md 檔案, 可以使用 @edit 或 @clean 節點編輯指令

除非必要否則不更動 markdown 目錄下的 template.tex 檔案</t>
<t tx="yen.20170429214845.1"></t>
</tnodes>
</leo_file>
