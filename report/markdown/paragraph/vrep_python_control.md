系統功能展示
===

雙人鍵盤控制對打
---



單人鍵盤控制與電腦對打
---



雙電腦對打
---



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

