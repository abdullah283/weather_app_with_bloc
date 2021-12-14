bu uygulamada bloc provider ile katmanlı mimari kullanıldı.
api kaynağı ile internetten hava durumu verileri dio kütüphanesi kullanılarak getiriliyor.
getirilen veriler bloc yapısinda istenilen event durumuna göre işleniyor.
işlendikten sonra bloc yapısından state olarak çıkıyor.
çıkan state deki veriler widget yardımıyla UI da gösteriliyor.
uygulamada yeni bir şehir girildiğinde hava durumuna göre bloc buildir yapısı ile güncelleniyor.
aynı zamanda ekranımız aşığıya doğru çekildiğinde refresh komutu çalışıyor ve güncelleme sorunsuz yapılıyor.
