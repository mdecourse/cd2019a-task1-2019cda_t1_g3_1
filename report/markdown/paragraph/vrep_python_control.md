系統功能展示
===

雙人鍵盤控制對打
---

程式利用python的keyboard mudule來配和按鍵控制

所使用的是keyboard.is_pressed('熱鍵')，如果按下熱鍵，則返回True

並配合Remote API functions (Python)執行程式



![玩家對打][player]

[player]: ./images/玩家對打.png {#fig:駱駝}

雙電腦對打
---


一開始發現問題如果球再球員擊出後，跑到桿子後方，會出現Bug球員將無法收回

經過修改後再擊出球後能往旁邊移動收回桿子，進行下段程式。

如果球進入擊球區桿子在收回的情況下，球與球員進入x軸-0.01~0.01範圍內

則球員會將球擊出

未進入x軸-0.01~0.01範圍內時則桿子保持收回

未進入擊球範圍時桿子繼續保持收回

![電腦對打][com]

[com]: ./images/電腦對打.png {#fig:駱駝}

單人鍵盤控制與電腦對打
---

由電腦對打和玩家對打程式合併加以修改

完整程式碼 如圖5.3

![玩家電腦][com2]

[com2]: ./images/玩家電腦.png {#fig:駱駝}


影像辨識
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

關於opencv-canny

這個函數有五大步驟
分別是


影像辨識-canny
---

canny函數有四大步驟
分別為
1.高斯濾波(Gaussian filter)

矩陣中的值代表對應像素值的加權(越往旁邊加權越小越中間越大)

而分數分母為加權值的總合

![高斯濾波][Gaussianfilter]

[Gaussianfilter]: ./images/Gaussianfilter.png {#fig:駱駝}

2.尋找影像的強度斜率


![尋找Gx與Gy][GxGy]

[GxGy]: ./images/GxGy.png {#fig:駱駝}

![找到強度斜率與方向][Gx-Gy]

[Gx-Gy]: ./images/Gx-Gy.png {#fig:駱駝}

3.刪除不是邊緣的像素

4.從定義的數值決定邊線是刪除或留下(上限和下限)(建議2:1~3:1之間)

a.如果高於上限留下

b.介於上限與下限之間時至有當它連接a.時才留下

c.低於下限時則刪除它


影像辨識電腦對打
---


利用上一節所得形心座標判斷各球員與球的相對運動
，再利用判斷的結果控制球員該往哪裡移動，或是否該踢球(整體架構如下圖)。

![守門員程式架構][Diagram]

[Diagram]: ./images/Diagram.png {#fig:駱駝}

