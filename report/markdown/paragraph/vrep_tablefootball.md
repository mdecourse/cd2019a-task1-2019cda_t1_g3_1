手足球系統模擬
===

人物簡化
---

首先在 onshape 將想要使用的零件圖或組合圖按照圖 4.1 及圖 4.2 匯出成 .stl 檔，再從 v-rep 中開啟 .stl 檔(使用[ File --> Import --> Mash... ])，會出現如圖 4.3 的對話框，依據個人所需去做點選，在按 OK 即可在視窗中導入模型。可以從圖 4.4 中看出，導入的模型是未分離的模型(如若是零件圖則不須此步驟)，所以我們使用[ Edit --> Grouping/Merging --> Divide selected shapes ]來將模型中的物件全都爆開，如圖 4.5。

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

接下來說明人物簡化步驟，先來進行人物頭部的簡化，先選擇人物將其複製(使用[ Edit --> Copy selected Objects ])到一個新建的場景(使用[ File --> New scene ])，再將人物貼上(使用[ Edit --> Paste buffer ])。再點選[頁面選擇器工具欄按鈕](http://www.coppeliarobotics.com/helpFiles/en/pagesAndViews.htm) ，如圖4.5，使得在簡化的過程中更容易點選，接著選取人物再點選[形狀編輯模式工具欄按鈕](http://www.coppeliarobotics.com/helpFiles/en/shapeEditModes.htm) 來進行簡化，如圖4.6，在此我框選人物的頭部如圖4.7，再點選簡化的對話框 Operations on selected triangles 中的 Extract cuboid 如圖4.8，之後會出現 Primitive cuboid 的對話框並按下 OK 即會產生一個立方體如圖4.9，頭部的簡化就完成了，再將簡化對話框關閉，此時會出現 Shape edit mode 對話框詢問是否應用這些變化嗎？(點擊否會保
留提取的對象)，所以在這選擇 No 將新加入的物件保留。 

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

人物的簡化就到這，接著要將兩個新增的物件合併成一個全新的物件，先將兩個物件選取(使用[ Edit --> Grouping/Merging --> Group selected shapes ])，如圖4.12，新物件的名稱為 people_dyn ，之後在剪下貼回第一個場景，如圖4.13。

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

[影片簡易版](https://youtu.be/YmQlG03cHHk)

Toggle shape edit mode(左六)僅對於"一個"物體作簡化形成多個三角形

先開啟另一個New scene，將球桌複製過來做簡化。

球桌長板子有兩種方式，按Toggle shape edit mode後，

1.為選取所想要的平面(可不須全選)，選取四角後按Extract cuboid後(系統會將所選所有三角形自動計算出最大尺寸)。

![選取三角形後按Extract cuboid][table01]

[table01]: ./images/table/01vrep_bCCda9LjkF.png {#fig:駱駝 }

![OK][table02]

[table02]: ./images/table/02vrep_ppSOMPNriG.png {#fig:駱駝 }

![關閉Shape Edition後按 NO][table03]

[table03]: ./images/table/03vrep_RmP1pLfqp9.png {#fig:駱駝 }


Scene objects properties(左二)>Shape>View/modify geometry>Keep proportions取消勾選，在Bounding box size長厚度後，在Object/item shift(上七)座移動，與球桌對齊。

![View/modify geometry][table04]

[table04]: ./images/table/04vrep_6CBLXrMxxk.png {#fig:駱駝 width=50%}

![取消勾選並調整板厚][table05]

[table05]: ./images/table/05.png {#fig:駱駝 width=50%}

![X方向調整][table06]

[table06]: ./images/table/06vrep_Mhr4H2vVfE.png {#fig:駱駝 width=50%}

![調整位置][table07]

[table07]: ./images/table/07OsZIho157g.png {#fig:駱駝 width=50%}



2.為選取所想要的平面(可不須全選)，選取四角後"再選取平面上方三角形(厚度)"Extract cuboid後(系統會將所選所有三角形自動計算出最大尺寸)，就完成了。

![多選取板厚的三角形][球桌08]

[球桌08]: ./images/table/08vrep_V9xQmjrfqx.png {#fig:駱駝 width=50%}

選取完後一樣按Extract cuboid>OK>關閉Shape Edition>NO

![兩種方式厚度比較][球桌09]

[球桌09]: ./images/table/09vrep_NK3aZ9CqGA.png {#fig:駱駝 width=50%}

其他地方的板子操作也是如此，之後會發現板子相互干涉，但對模擬或是簡化不會有影響。

![簡化後的板子相互干涉][球桌10]

[球桌10]: ./images/table/10vrep_45niDCVb7M.png {#fig:駱駝 width=50%}

**

Extract shape 為類似像皮膚一樣的一層

Extract cuboid 為長平板

Extract cylinder 為長圓柱

Extract sphere 為長球


模擬步驟
---

將所有物件都簡化好後，開始進入模擬的步驟，為了在[場景層次結構](http://www.coppeliarobotics.com/helpFiles/en/userInterface.htm) 中的物件更好找到，將所有的物件都命名能更快的找的所需要使用的物件。首先先加入平移軸[Prismatic joints](http://www.coppeliarobotics.com/helpFiles/en/jointDescription.htm) (使用[Add-->Joint-->Prismatic])及旋轉軸[Revolute joints](http://www.coppeliarobotics.com/helpFiles/en/jointDescription.htm) (使用[Add-->Joint-->Revolute])，並分別命名為 Prismatic_joint_1 及 Revolute_joint_1 ，之後將所有我需要用的物件都拉到 Table_dyn 下，如圖4.35及圖4.36。

![將所需物件拉入 Table_dyn 下-1][6]

[6]: ./images/排列樹狀圖並模擬/6.png {#fig:駱駝}

![將所需物件拉入 Table_dyn 下-2][6-1]

[6-1]: ./images/排列樹狀圖並模擬/6-1.png {#fig:駱駝 width=50%}

選取 Prismatic_joint_1 (平移軸)及 cylinder_L1_dyn (軸)並點選物件傳送工具欄按鈕如圖4.16，會出現 Object/Item Translation/Position的對話框，切換至 Postion 按下按鈕 Apply to selection ，平移軸及軸會相貼合，如圖4.37，再點選[物件旋轉工具欄按鈕](http://www.coppeliarobotics.com/helpFiles/en/orientationDialog.htm) 圖4.38，會出現 Object/Item Rotation/Orientation的對話框，切換至 Orientation 按下按鈕Apply to selection ，平移軸及軸方向會相同，如圖4.39，之後的旋轉軸也是一樣的方法，圖4.40可以看出平移軸、旋轉軸及軸位置及方向都相同。

![平移軸和軸相貼合][7-3]

[7-3]: ./images/排列樹狀圖並模擬/7-3.png {#fig:駱駝 width=50%}

![物件旋轉工具欄按鈕][8-1]

[8-1]: ./images/排列樹狀圖並模擬/8-1.png {#fig:駱駝}

![平移軸和軸方向相同][8-3]

[8-3]: ./images/排列樹狀圖並模擬/8-3.png {#fig:駱駝}

![平移軸、旋轉軸及軸位置及方向皆一致][10-3]

[10-3]: ./images/排列樹狀圖並模擬/10-3.png {#fig:駱駝}

再將拉入 Table-dyn下的物件依照圖4.41 去排序，在選取物件 h-L1、 people-L1-1 、 s-L1-1 及 s-L1-2 (使用[Edit-->Grouping/Merging-->Group selected shapes])將物件合併，命名為 h-L1 ，另一部分的 people-L1-1-dyn 、 s-L1-1-dyn 及 s-L1-2-dyn 也一樣使用相同方法進行合併，命名為 s-L1-2_dyn ，完成後如圖4.42。

![樹狀圖排列][11]

[11]: ./images/排列樹狀圖並模擬/11.png {#fig:駱駝}

![合併並排列好][14-1]

[14-1]: ./images/排列樹狀圖並模擬/14-1.png {#fig:駱駝}

之後點擊兩次 Table-dyn 前的圖案，會產生 Scene Object Properties 點選 common ，將 Visibility 下的 Camera visibility layers 中的勾勾關掉，如圖4.43，將 s-L1-2-dyn 及 cylinder-L1-dyn 也使用相同方式關閉圖層。 
 
 ![Scene Object Properties 對話框][15-2]

[15-2]: ./images/排列樹狀圖並模擬/15-2.png {#fig:駱駝 width=35%}

點擊兩次 Table-dyn 前的圖案，並點及對話框中的 Show dynamic properties dialog，會出現另一個 Rigid Body Dynamic Properties 對話框，將 Body is respondable 打勾，再將 Local respondable mask 從第3個勾開始不打勾到第8個，如圖4.44；再來點擊兩次 cylinder-L1-dyn  前的圖案，依照圖4.45 去進行勾選，其中打開 Body is dynamic 能使物體產生動態；再點擊兩次 s-L1-2-dyn 前的圖案，依照圖4.46 去進行勾選。

 ![對話框勾選 - Table_dyn][17-4]

[17-4]: ./images/排列樹狀圖並模擬/17-4.png {#fig:駱駝 width=35%}

 ![對話框勾選 - cylinder-L1-dyn][18-2]

[18-2]: ./images/排列樹狀圖並模擬/18-2.png {#fig:駱駝 width=35%}

 ![對話框勾選 - s-L1-2-dyn][19-2]

[19-2]: ./images/排列樹狀圖並模擬/19-2.png {#fig:駱駝 width=35%}

接下來要讓軸能轉動，所以點擊兩次 Prismatic-joint-1 前的圖案，在按下 Show dynamic properties dialog ，會產生 Joint Dynamic Properties 將 Motor properties 下的 Motor enabled 打勾，在 Target velocity 打入0.001，如圖4.47 所展示；再來點擊兩次 Revolute-joint-1 前的圖案，在按下 Show dynamic properties dialog ，會產生 Joint Dynamic Properties 將 Motor properties 下的 Motor enabled 打勾，在 Target velocity 打入1，如圖4.48，最後看圖4.49 可以看到模擬。

![對話框勾選 - Prismatic-joint-1][20-2]

[20-2]: ./images/排列樹狀圖並模擬/20-2.png {#fig:駱駝 width=35%}

![對話框勾選 - Revolute-joint-1][21-2]

[21-2]: ./images/排列樹狀圖並模擬/21-2.png {#fig:駱駝 width=35%}

 ![模擬圖][22]

[22]: ./images/排列樹狀圖並模擬/22.png {#fig:駱駝 width=50%}




