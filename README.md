# OXC-Notify

Modern ve özelleştirilebilir bildirim sistemi.

## Özellikler

- 🎨 Modern tasarım
- 🌓 Açık/Koyu tema desteği
- 🎵 Özelleştirilebilir ses efektleri
- 🌍 Çoklu dil desteği
- 📱 Responsive tasarım
- 🎭 Glassmorphism efekti
- 🌈 Hologram efekti
- ⏱️ İlerleme çubuğu

## Kurulum

1. `oxc-notify` klasörünü `resources` klasörüne kopyalayın
2. `server.cfg` dosyasına `ensure oxc-notify` ekleyin
3. Sunucuyu yeniden başlatın

## Kullanım

```lua
-- Basit bildirim
exports['oxc-notify']:SendNotification({
    message = "Merhaba Dünya!",
    type = "success",
    duration = 5000
})

-- Detaylı bildirim
exports['oxc-notify']:SendNotification({
    title = "Başlık",
    subtitle = "Alt Başlık",
    message = "Bildirim mesajı",
    type = "info",
    duration = 5000,
    sound = true,
    position = "top-right",
    theme = "dark"
})

-- Bildirim Türleri
-- success, error, info, warning, money, police, admin, phone

-- Konumlar
-- top-right, top-left, top-center, bottom-right, bottom-left
```

## Ayarlar

`config.lua` dosyasından aşağıdaki ayarları özelleştirebilirsiniz:

- Varsayılan süre
- Maksimum bildirim sayısı
- Bildirim konumu
- Ses ayarları
- Dil ayarları
- Tema ayarları
- Bildirim türleri

## Lisans

Bu proje MIT lisansı altında lisanslanmıştır.