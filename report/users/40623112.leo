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



人物簡化
---

首先在 onshape 將想要使用的零件圖或組合圖按照圖 4.1 及圖 4.2 匯出成 .stl 檔，再從 v-rep 中開啟 .stl 檔(使用[ File --&gt; Import --&gt; Mash... ])，會出現如圖 4.3 的對話框，依據個人所需去做點選，在按 OK 即可在視窗中導入模型。可以從圖 4.4 中看出，導入的模型是未分離的模型(如若是零件圖則不須此步驟)，所以我們使用[ Edit --&gt; Grouping/Merging --&gt; Divide selected shapes ]來將模型中的物件全都爆開，如圖 4.5。

![onshape匯出][onshape匯出1]

[onshape匯出1]:  ./images/簡化/onshape匯出1.png { #fig:駱駝 width=70% align="right" }

![onshape匯出對話框][onshape匯出2]

[onshape匯出2]: ./images/簡化/onshape匯出2.png { #fig:駱駝 width=50% }

![匯入 .STL 檔後的對話框][開啟stl檔案2]

[開啟stl檔案2]: ./images/簡化/開啟stl檔案2.png {#fig:駱駝}

![分離模型步驟點選][爆開1]

[爆開1]: ./images/簡化/爆開1.png {#fig:駱駝 width=50% }

![模型爆開後][爆開2]

[爆開2]: ./images/簡化/爆開2.png {#fig:駱駝 width=50% }

接下來說明人物簡化步驟，先來進行人物頭部的簡化，先選擇人物將其複製(使用[ Edit --&gt; Copy selected Objects ])到一個新建的場景(使用[ File --&gt; New scene ])，再將人物貼上(使用[ Edit --&gt; Paste buffer ])。再點選[頁面選擇器工具欄按鈕](http://www.coppeliarobotics.com/helpFiles/en/pagesAndViews.htm) ，如圖4.5，使得在簡化的過程中更容易點選，接著選取人物再點選[形狀編輯模式工具欄按鈕](http://www.coppeliarobotics.com/helpFiles/en/shapeEditModes.htm) 來進行簡化，如圖4.6，在此我框選人物的頭部如圖4.7，再點選簡化的對話框 Operations on selected triangles 中的 Extract cuboid 如圖4.8，之後會出現 Primitive cuboid 的對話框並按下 OK 即會產生一個立方體如圖4.9，頭部的簡化就完成了，再將簡化對話框關閉，此時會出現 Shape edit mode 對話框詢問是否應用這些變化嗎？(點擊否會保
留提取的對象)，所以在這選擇 No 將新加入的物件保留。 

&lt;div align="center"&gt;
![頁面選擇器工具欄按鈕][人物簡化4]

[人物簡化4]: ./images/簡化/人物簡化/人物簡化4.png {#fig:駱駝}

![形狀編輯模式工具欄按鈕][人物簡化6]

[人物簡化6]: ./images/簡化/人物簡化/人物簡化6.png {#fig:駱駝}

![框選人物頭部][人物簡化7]

[人物簡化7]: ./images/簡化/人物簡化/人物簡化7.png {#fig:駱駝 width=30%}

![簡化的對話框 - 人物][人物簡化9]

[人物簡化9]: ./images/簡化/人物簡化/人物簡化9.png {#fig:駱駝 width=50%}

![頭部簡化完成後][人物簡化11]

[人物簡化11]: ./images/簡化/人物簡化/人物簡化11.png {#fig:駱駝 width=30%}

再來要說明人物身體的簡化，其簡化步驟和人物頭部簡化很相似，所以直接跳至身體簡化所需框選的部位如圖4.10，之後再點選簡化的對話框 Operations on selected triangles 中的 Extract cuboid 如圖4.8，身體簡化完的圖片如圖4.11。

![框選人物頭部以下的部位][人物保留1-15]

[人物保留1-15]: ./images/簡化/人物簡化/人物保留1-15.png {#fig:駱駝 width=30%}

![頭部簡化完成後][人物簡化16]

[人物簡化16]: ./images/簡化/人物簡化/人物簡化16.png {#fig:駱駝 width=50%}

人物的簡化就到這，接著要將兩個新增的物件合併成一個全新的物件，先將兩個物件選取(使用[ Edit --&gt; Grouping/Merging --&gt; Group selected shapes ])，如圖4.12，新物件的名稱為 people_dyn ，之後在剪下貼回第一個場景，如圖4.13。

![合併物件][人物簡化17]

[人物簡化17]: ./images/簡化/人物簡化/人物簡化17.png {#fig:駱駝 width=50%}

![新物件people_dyn新加並貼回原位][人物簡化21]

[人物簡化21]: ./images/簡化/人物簡化/人物簡化21.png {#fig:駱駝 width=50%}

其餘人物的簡化可以使用複製將剛剛簡化後的新物件複製在貼上，如圖4.14，之後點選新貼上的物件使用 Ctrl 在選取其他尚未簡化的一個人物，如圖4.15，點擊操作[物件傳送工具欄按鈕](http://www.coppeliarobotics.com/helpFiles/en/positionDialog.htm) 如圖4.16，會出現工具欄按鈕對話框，如圖4.17，點選 Postion 中的 Apply to selection 使新貼上的物件能和為簡化的人物箱貼合，如圖4.18，這樣就無需再簡化無限多次，完成後如圖4.19。

![合併物件][複製簡化並貼上1]

[複製簡化並貼上1]: ./images/簡化/人物簡化/複製簡化並貼上1.png {#fig:駱駝 width=30%}

![使用ctrl在點擊工具欄按鈕][複製簡化並貼上2-1]

[複製簡化並貼上2-1]: ./images/簡化/人物簡化/複製簡化並貼上2-1.png {#fig:駱駝 width=30%}

![物件傳送工具欄按鈕][7-1]

[7-1]: ./images/排列樹狀圖並模擬/7-1.png {#fig:駱駝}

![工具欄按鈕對話框][複製簡化並貼上3]

[複製簡化並貼上3]: ./images/簡化/人物簡化/複製簡化並貼上3.png {#fig:駱駝 width=50%}

![貼完後][複製簡化並貼上4]

[複製簡化並貼上4]: ./images/簡化/人物簡化/複製簡化並貼上4.png {#fig:駱駝 width=30%}


軸、篩子簡化
---

在來先進行軸的簡化，複製軸到新的場景，選取軸並點選形狀編輯模式工具欄按鈕，如圖4.6，將軸全部框選，如圖4.20，再點選簡化的對話框 Operations on selected triangles 中的 Extract cylinder 如圖4.21，之後會出現 Primitive cylinder 的對話框並按下 OK 即會產生一個圓柱如圖4.22，將新圓柱物件命名為 Cylinder_dyn，並剪下貼回第一場景上即可。

![框選軸需簡化的部分][軸簡化3]

[軸簡化3]: ./images/簡化/軸簡化/軸簡化3.png {#fig:駱駝}

![簡化對話框 - 軸][軸簡化5]

[軸簡化5]: ./images/簡化/軸簡化/軸簡化5.png {#fig:駱駝}

![軸簡化後產生的新圓柱][軸簡化後的圓柱]

[軸簡化後的圓柱]: ./images/簡化/軸簡化/軸簡化後的圓柱.png {#fig:駱駝 width=50%}

接下來要進行篩子的簡化，複製篩子至新的場景，之後的簡化也和軸非常相似，選取篩子並點選形狀編輯模式工具欄按鈕，將篩子全
部框選進行簡化，如圖4.23，再點選簡化的對話框 Operations on selected triangles 中的 Extract cylinder ，之後會出現 Primitive cylinder 的對話框並按下 OK 即會產生一個圓柱如圖4.24，將新圓柱物件命名為 s1_dyn，並剪下貼回第一場景上即可。

![框選篩子需簡化部分][篩子簡化3]

[篩子簡化3]: ./images/簡化/篩子簡化/篩子簡化3.png {#fig:駱駝 width=35%}

![篩子簡化後產生的新物件][篩子簡化後產生的新物件]

[篩子簡化後產生的新物件]: ./images/簡化/篩子簡化/篩子簡化後產生的新物件.png {#fig:駱駝 width=35%}

其餘的篩子及軸的簡化，可以參考人物簡化的最後一段。

足球桌簡化
---


模擬步驟
---

將所有物件都簡化好後，開始進入模擬的步驟，為了在(場景層次結構)[http://www.coppeliarobotics.com/helpFiles/en/userInterface.htm] 中的物件更好找到，將所有的物件都命名能更快的找的所需要使用的物件。首先先加入平移軸[Prismatic joints](http://www.coppeliarobotics.com/helpFiles/en/jointDescription.htm) (使用[Add--&gt;Joint--&gt;Prismatic])及旋轉軸[Revolute joints](http://www.coppeliarobotics.com/helpFiles/en/jointDescription.htm) (使用[Add--&gt;Joint--&gt;Revolute])，並分別命名為 Prismatic_joint_1 及 Revolute_joint_1 ，之後將所有我需要用的物件都拉到 Table_dyn 下，如圖4.25及圖4.26。

![將所需物件拉入 Table_dyn 下-1][6]

[6]: ./images/排列樹狀圖並模擬/6.png {#fig:駱駝}

![將所需物件拉入 Table_dyn 下-2][6-1]

[6-1]: ./images/排列樹狀圖並模擬/6-1.png {#fig:駱駝 width=50%}

選取 Prismatic_joint_1 (平移軸)及 cylinder_L1_dyn (軸)並點選物件傳送工具欄按鈕如圖4.16，會出現 Object/Item Translation/Position的對話框，切換至 Postion 按下按鈕 Apply to selection ，平移軸及軸會相貼合，如圖4.27，再點選[物件旋轉工具欄按鈕](http://www.coppeliarobotics.com/helpFiles/en/orientationDialog.htm) 圖4.28，會出現 Object/Item Rotation/Orientation的對話框，切換至 Orientation 按下按鈕Apply to selection ，平移軸及軸方向會相同，如圖4.29，之後的旋轉軸也是一樣的方法，圖4.30可以看出平移軸、旋轉軸及軸位置及方向都相同。

![平移軸和軸相貼合][7-3]

[7-3]: ./images/排列樹狀圖並模擬/7-3.png {#fig:駱駝 width=50%}

![物件旋轉工具欄按鈕][8-1]

[8-1]: ./images/排列樹狀圖並模擬/8-1.png {#fig:駱駝}

![平移軸和軸方向相同][8-3]

[8-3]: ./images/排列樹狀圖並模擬/8-3.png {#fig:駱駝}

![平移軸、旋轉軸及軸位置及方向皆一致][10-3]

[10-3]: ./images/排列樹狀圖並模擬/10-3.png {#fig:駱駝}

再將拉入 Table_dyn下的物件依照圖4.31 去排序，在選取物件 h_L1、 people_L1_1 、 s_L1_1 及 s_L1_2 (使用[Edit--&gt;Grouping/Merging--&gt;Group selected shapes])將物件合併，命名為 h_L1 ，另一部分的 people_L1_1_dyn 、 s_L1_1_dyn 及 s_L1_2_dyn 也一樣使用相同方法進行合併，命名為 s_L1_2_dyn ，完成後如圖4.32。

![樹狀圖排列][11]

[11]: ./images/排列樹狀圖並模擬/11.png {#fig:駱駝}

![合併並排列好][14-1]

[14-1]: ./images/排列樹狀圖並模擬/14-1.png {#fig:駱駝}

之後點擊兩次 Table_dyn 前的圖案，會產生 Scene Object Properties 點選 common ，將 Visibility 下的 Camera visibility layers 中的勾勾關掉，如圖4.33，將 s_L1_2_dyn 及 cylinder_L1_dyn 也使用相同方式關閉圖層。 
 
 ![Scene Object Properties 對話框][15-2]

[15-2]: ./images/排列樹狀圖並模擬/15-2.png {#fig:駱駝 width=35%}

點擊兩次 Table_dyn 前的圖案，並點及對話框中的 Show dynamic properties dialog，會出現另一個 Rigid Body Dynamic Properties 對話框，將 Body is respondable 打勾，再將 Local respondable mask 從第3個勾開始不打勾到第8個，如圖4.34；再來點擊兩次 cylinder_L1_dyn  前的圖案，依照圖4.35 去進行勾選，其中打開 Body is dynamic 能使物體產生動態；再點擊兩次 s_L1_2_dyn 前的圖案，依照圖4.36 去進行勾選。

 ![對話框勾選 - Table_dyn][17-4]

[17-4]: ./images/排列樹狀圖並模擬/17-4.png {#fig:駱駝 width=35%}

 ![對話框勾選 - cylinder_L1_dyn][18-2]

[18-2]: ./images/排列樹狀圖並模擬/18-2.png {#fig:駱駝 width=35%}

 ![對話框勾選 - s_L1_2_dyn][19-2]

[19-2]: ./images/排列樹狀圖並模擬/19-2.png {#fig:駱駝 width=35%}

接下來要讓軸能轉動，所以點擊兩次 Prismatic_joint_1 前的圖案，在按下 Show dynamic properties dialog ，會產生 Joint Dynamic Properties 將 Motor properties 下的 Motor enabled 打勾，在 Target velocity 打入0.001，如圖4.37 所展示；再來點擊兩次 Revolute_joint_1 前的圖案，在按下 Show dynamic properties dialog ，會產生 Joint Dynamic Properties 將 Motor properties 下的 Motor enabled 打勾，在 Target velocity 打入1，如圖4.38，最後看圖4.39 可以看到模擬。

 ![對話框勾選 - Prismatic_joint_1][20-2]

[20-2]: ./images/排列樹狀圖並模擬/20-2.png {#fig:駱駝 width=35%}

 ![對話框勾選 - Revolute_joint_1][21-2]

[21-2]: ./images/排列樹狀圖並模擬/21-2.png {#fig:駱駝 width=35%}

 ![模擬圖][22]

[22]: ./images/排列樹狀圖並模擬/22.png {#fig:駱駝 width=50%}


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

6.球門:

工程圖連結網址請點這:https://cad.onshape.com/documents/7063242033d0934280d360d8/w/172d28e1bcc6647f37e823d3/e/87427ddbdbb5063db4e9e7e7

![球門三視圖][gole]

[gole]: ./images/球門三視圖.png

7.足球員
工程圖連結網站請點這:https://cad.onshape.com/documents/7063242033d0934280d360d8/w/172d28e1bcc6647f37e823d3/e/83f38694788c755ab69cb18c

![球員工程圖][boa]

[boa]: ./images/足球員工程圖.png

8.塞子
工程圖連結請點這:https://cad.onshape.com/documents/7063242033d0934280d360d8/w/172d28e1bcc6647f37e823d3/e/40911ab194ff8009ffdd6238

![塞子工程圖][bob]

[bob]: ./images/塞子工程圖.png

9.爆炸圖
連結請點這:https://cad.onshape.com/documents/7063242033d0934280d360d8/w/172d28e1bcc6647f37e823d3/e/bf399e06fdf1d159d2657944

![爆炸圖][boc]

[boc]: ./images/爆炸圖.png



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
