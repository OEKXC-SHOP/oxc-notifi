local QBCore = exports['qb-core']:GetCoreObject()

-- Config kontrolü
Citizen.CreateThread(function()
    Wait(1000)
    if not Config or not Config.NotificationTypes then
        print("^1[HATA]^7 Config dosyası bulunamadı veya değiştirildi.")
        return
    end
end)

-- Dil fonksiyonu
function GetTranslation(key)
    local lang = Config.Language
    if Config.Locales[lang] and Config.Locales[lang][key] then
        return Config.Locales[lang][key]
    end
    
    -- Varsayılan olarak İngilizce'ye dön
    if Config.Locales["en"] and Config.Locales["en"][key] then
        return Config.Locales["en"][key]
    end
    
    -- Çeviri bulunamazsa anahtarı döndür
    return key
end

-- Bildirim türleri
local NotificationTypes = {
    ['success'] = 'success',
    ['error'] = 'error',
    ['info'] = 'info',
    ['warning'] = 'warning',
    ['money'] = 'money',
    ['police'] = 'police',
    ['admin'] = 'admin',
    ['phone'] = 'phone'
}

-- Bildirim gönderme fonksiyonu
function SendNotification(data)
    if not data or not data.message then return end
    
    -- Config değerlerini kullan veya varsayılanları ayarla
    data.type = data.type or "info"
    data.title = data.title or ''
    data.subtitle = data.subtitle or ''
    data.duration = data.duration or Config.DefaultDuration
    data.position = data.position or Config.Position
    data.sound = data.sound ~= nil and data.sound or Config.DefaultSound
    data.language = data.language or Config.Language
    
    -- Bildirim türü ayarlarını al
    local typeConfig = Config.NotificationTypes[data.type]
    if typeConfig then
        data.icon = data.icon or typeConfig.icon
        data.color = data.color or typeConfig.color
        data.soundFile = data.soundFile or typeConfig.sound
    end
    
    -- Tema ve efekt ayarları
    data.theme = data.theme or Config.DefaultTheme
    data.glassmorphism = data.glassmorphism ~= nil and data.glassmorphism or Config.GlassmorphismEffect
    data.hologram = data.hologram ~= nil and data.hologram or Config.HologramEffect
    data.progressBar = data.progressBar ~= nil and data.progressBar or Config.ProgressBar
    
    -- Ses seviyesi
    data.volume = data.volume or Config.SoundVolume
    
    -- Maksimum bildirim sayısı
    data.maxNotifications = Config.MaxNotifications
    
    SendNUIMessage({
        action = 'notify',
        data = data
    })
end

-- QBCore notify fonksiyonunu override et
QBCore.Functions.Notify = function(text, textType, length)
    local type = "info"
    if textType == 'success' then type = "success" end
    if textType == 'error' then type = "error" end
    if textType == 'warning' then type = "warning" end
    
    SendNotification({
        message = text,
        type = type,
        duration = length or Config.DefaultDuration
    })
end

-- Export fonksiyonu
exports('SendNotification', SendNotification)

-- Dil değiştirme komutu
RegisterCommand('notifylang', function(source, args)
    if args[1] and Config.Locales[args[1]] then
        Config.Language = args[1]
        print('^2[OXC-Notify]^7 Dil değiştirildi: ' .. args[1])
        
        SendNotification({
            title = GetTranslation("success_title"),
            subtitle = GetTranslation("settings_subtitle"),
            message = "Dil başarıyla değiştirildi: " .. args[1],
            type = 'success',
            duration = 5000,
            sound = true
        })
    else
        SendNotification({
            title = GetTranslation("error_title"),
            subtitle = GetTranslation("settings_subtitle"),
            message = "Geçersiz dil kodu. Kullanılabilir diller: tr, en, es, pt, de",
            type = 'error',
            duration = 5000,
            sound = true
        })
    end
end, false)

-- Test komutları
RegisterCommand('testnotify', function()
    SendNotification({
        title = GetTranslation("info_title"),
        subtitle = GetTranslation("system_subtitle"),
        message = GetTranslation("test_message"),
        type = 'info',
        duration = 5000,
        sound = true
    })
end)

RegisterCommand('testallnotify', function()
    local types = {'success', 'error', 'info', 'warning', 'money', 'police', 'admin', 'phone'}
    local titles = {
        GetTranslation("success_title"), 
        GetTranslation("error_title"), 
        GetTranslation("info_title"), 
        GetTranslation("warning_title"),
        GetTranslation("money_title"), 
        GetTranslation("police_title"), 
        GetTranslation("admin_title"), 
        GetTranslation("phone_title")
    }
    local messages = {
        GetTranslation("success_message"),
        GetTranslation("error_message"),
        GetTranslation("info_message"),
        GetTranslation("warning_message"),
        GetTranslation("money_message"),
        GetTranslation("police_message"),
        GetTranslation("admin_message"),
        GetTranslation("phone_message")
    }
    local delay = 0
    
    for i, type in ipairs(types) do
        Citizen.SetTimeout(delay, function()
            SendNotification({
                title = titles[i],
                subtitle = GetTranslation("system_subtitle"),
                message = messages[i],
                type = type,
                duration = 5000,
                sound = true
            })
        end)
        delay = delay + 1500
    end
end)

-- Config değişikliklerini test etmek için komut
RegisterCommand('confignotify', function()
    print('Mevcut Config Ayarları:')
    print('Varsayılan Süre: ' .. Config.DefaultDuration)
    print('Maksimum Bildirim: ' .. Config.MaxNotifications)
    print('Konum: ' .. Config.Position)
    print('Tema: ' .. Config.DefaultTheme)
    print('Dil: ' .. Config.Language)
    
    SendNotification({
        title = GetTranslation("success_title"),
        subtitle = GetTranslation("settings_subtitle"),
        message = GetTranslation("config_message"),
        type = 'success',
        duration = 5000,
        sound = true
    })
end)

-- Oyun başladığında bildirim
AddEventHandler('playerSpawned', function()
    Citizen.Wait(3000) -- Oyuncu tam olarak yüklenene kadar bekle
    SendNotification({
        title = "OXC-NOTIFY",
        subtitle = GetTranslation("welcome_subtitle"),
        message = GetTranslation("welcome_message"),
        type = 'success',
        duration = 5000,
        sound = true
    })
end)

-- Kaynak başladığında
AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then return end
    
    print('^2[OXC-Notify]^7 Bildirim sistemi başarıyla başlatıldı!')
    print('^2[OXC-Notify]^7 Varsayılan dil: ' .. Config.Language)
end) 