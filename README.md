# Pazarama iOS Bootcamp - Hafta 3 - Ödev

# ScreenShots
## Incomplete task : Storing and showing Favorites with using CoreData
<img width="533" alt="1" src="https://user-images.githubusercontent.com/55625400/194955971-087212fa-d9a4-45cf-ae36-311f068f2f4e.png">
<img width="533" alt="2" src="https://user-images.githubusercontent.com/55625400/194955979-a5f3c871-1563-4435-9863-057f36967b96.png">
<img width="533" alt="3" src="https://user-images.githubusercontent.com/55625400/194956010-eeb911c1-36e5-4788-be37-9001e1084646.png">
<img width="533" alt="4" src="https://user-images.githubusercontent.com/55625400/194956027-7601dbc4-a6dd-434d-a942-7c01110c5b79.png">
<img width="533" alt="5" src="https://user-images.githubusercontent.com/55625400/194955995-641b9703-52ef-4701-b9bf-0433759bffdc.png">



## iTunes Client App

Bu haftanın ödev konusu olarak, geliştirdiğimiz iTunes Client App uygulamasını tamamlayacağız. iTunes Search API altında yer alan movie, podcast, music, software, ebook medya tipleri için UITabBarController’a yeni tablar ekleyeceğiz. Ders süresince podcast için bir tab bar eklemiştik. Aynı süreçleri takip ederek diğer tabların eklemesini gerçekleştirebilirsiniz. Her medya tipi için ayrı List/Detail ViewController’lar oluşturabileceğiniz gibi, podcast için oluşturduğumuz ViewController yapılarını daha generic bir hale getirip kullanmanız tavsiye olunur. Tablar değişse de her tab içinde SearchController bulunmalı ve arama sonuçları listelenmelidir. Son olarak bir favoriler tab’i eklenecek ve favorilere eklenen medyalar bu ekranda gösterilercek. Favorilerin kaydı için CoreData kullanılacaktır. Farklı medya tiplerini farklı segmentler altında gösterebilirsiniz. Favorilere eklemek için NavigationBar’a BarButtonItem ekleyebilirsiniz(farklı yöntemler kabul edilecektir.).


## Değerlendirme Kriterleri

1. Uygulamanın sorunsuz bir şekilde(crash free) çalışması.
2. Diğer medya tipleri için tabların eklenmiş olması.
3. UI’ın programmatic(NSLayoutConstraints) olarak oluşturulması.
4. SearchController ile mevcut tabda filtreleme yapılabilmesi.
5. Medyanın favoriler eklenebilmesi ve favoriler ekranında düzgün bir şekilde listelenmesi.


## Faydalı Linkler

- iTunes Search API: https://developer.apple.com/library/archive/documentation/AudioVideo/ Conceptual/iTuneSearchAPI/Searching.html#//apple_ref/doc/uid/TP40017632-CH5-SW1
  
