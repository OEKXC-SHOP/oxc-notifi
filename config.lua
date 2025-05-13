Config = {}

-- Genel Ayarlar
Config.DefaultDuration = 5000 -- Varsayılan bildirim süresi (ms)
Config.MaxNotifications = 5 -- Aynı anda gösterilebilecek maksimum bildirim sayısı
Config.Position = "top-right" -- Bildirimlerin konumu: "top-right", "top-left", "bottom-right", "bottom-left"
Config.DefaultSound = true -- Varsayılan olarak ses çalma
Config.SoundVolume = 0.2 -- Ses seviyesi (0.0 - 1.0)

-- Dil Ayarları
Config.Language = "tr" -- Varsayılan dil: "tr", "en", "es", "pt", "de"

-- Tema Ayarları
Config.DefaultTheme = "dark" -- Varsayılan tema: "dark", "light", "auto"
Config.GlassmorphismEffect = true -- Cam efekti
Config.HologramEffect = true -- Hologram efekti
Config.ProgressBar = true -- İlerleme çubuğu gösterimi

-- Bildirim Türleri
Config.NotificationTypes = {
    ["success"] = {
        icon = "fa-check-circle",
        color = "#2ed573",
        sound = "success.mp3"
    },
    ["error"] = {
        icon = "fa-times-circle",
        color = "#ff4757",
        sound = "error.mp3"
    },
    ["info"] = {
        icon = "fa-info-circle",
        color = "#36a2eb",
        sound = "info.mp3"
    },
    ["warning"] = {
        icon = "fa-exclamation-triangle",
        color = "#ff9f43",
        sound = "warning.mp3"
    },
    ["money"] = {
        icon = "fa-dollar-sign",
        color = "#2ecc71",
        sound = "money.mp3"
    },
    ["police"] = {
        icon = "fa-shield-alt",
        color = "#3498db",
        sound = "police.mp3"
    },
    ["admin"] = {
        icon = "fa-user-shield",
        color = "#9b59b6",
        sound = "admin.mp3"
    },
    ["phone"] = {
        icon = "fa-phone-alt",
        color = "#34ace0",
        sound = "phone.mp3"
    }
}

-- Dil Çevirileri
Config.Locales = {
    ["tr"] = {
        -- Bildirim türleri
        ["success_title"] = "BAŞARILI İŞLEM",
        ["error_title"] = "HATA OLUŞTU",
        ["info_title"] = "BİLGİ",
        ["warning_title"] = "UYARI",
        ["money_title"] = "PARA İŞLEMİ",
        ["police_title"] = "POLİS BİLDİRİMİ",
        ["admin_title"] = "ADMİN BİLDİRİMİ",
        ["phone_title"] = "TELEFON",
        
        -- Alt başlıklar
        ["system_subtitle"] = "Sistem Bildirimi",
        ["welcome_subtitle"] = "Hoş Geldiniz",
        ["settings_subtitle"] = "Ayarlar",
        
        -- Mesajlar
        ["success_message"] = "İşleminiz başarıyla tamamlandı!",
        ["error_message"] = "İşlem sırasında bir hata oluştu!",
        ["info_message"] = "Yeni bir güncelleme mevcut!",
        ["warning_message"] = "Bu işlem geri alınamaz!",
        ["money_message"] = "$500 hesabınıza yatırıldı!",
        ["police_message"] = "Yakınınızda bir suç işlendi!",
        ["admin_message"] = "Admin komutları kullanıldı!",
        ["phone_message"] = "Yeni bir mesajınız var!",
        ["welcome_message"] = "Bildirim sistemi başarıyla yüklendi!",
        ["config_message"] = "Config ayarları başarıyla yüklendi!",
        ["test_message"] = "Bu bir test bildirimidir!"
    },
    
    ["en"] = {
        -- Notification types
        ["success_title"] = "SUCCESS",
        ["error_title"] = "ERROR",
        ["info_title"] = "INFORMATION",
        ["warning_title"] = "WARNING",
        ["money_title"] = "MONEY TRANSACTION",
        ["police_title"] = "POLICE NOTIFICATION",
        ["admin_title"] = "ADMIN NOTIFICATION",
        ["phone_title"] = "PHONE",
        
        -- Subtitles
        ["system_subtitle"] = "System Notification",
        ["welcome_subtitle"] = "Welcome",
        ["settings_subtitle"] = "Settings",
        
        -- Messages
        ["success_message"] = "Your operation has been completed successfully!",
        ["error_message"] = "An error occurred during the operation!",
        ["info_message"] = "A new update is available!",
        ["warning_message"] = "This action cannot be undone!",
        ["money_message"] = "$500 has been deposited to your account!",
        ["police_message"] = "A crime has been committed nearby!",
        ["admin_message"] = "Admin commands have been used!",
        ["phone_message"] = "You have a new message!",
        ["welcome_message"] = "Notification system loaded successfully!",
        ["config_message"] = "Config settings loaded successfully!",
        ["test_message"] = "This is a test notification!"
    },
    
    ["es"] = {
        -- Tipos de notificación
        ["success_title"] = "ÉXITO",
        ["error_title"] = "ERROR",
        ["info_title"] = "INFORMACIÓN",
        ["warning_title"] = "ADVERTENCIA",
        ["money_title"] = "TRANSACCIÓN DE DINERO",
        ["police_title"] = "NOTIFICACIÓN POLICIAL",
        ["admin_title"] = "NOTIFICACIÓN DE ADMIN",
        ["phone_title"] = "TELÉFONO",
        
        -- Subtítulos
        ["system_subtitle"] = "Notificación del Sistema",
        ["welcome_subtitle"] = "Bienvenido",
        ["settings_subtitle"] = "Configuración",
        
        -- Mensajes
        ["success_message"] = "¡Su operación se ha completado con éxito!",
        ["error_message"] = "¡Se produjo un error durante la operación!",
        ["info_message"] = "¡Hay una nueva actualización disponible!",
        ["warning_message"] = "¡Esta acción no se puede deshacer!",
        ["money_message"] = "¡$500 han sido depositados en su cuenta!",
        ["police_message"] = "¡Se ha cometido un delito cerca!",
        ["admin_message"] = "¡Se han utilizado comandos de administrador!",
        ["phone_message"] = "¡Tienes un nuevo mensaje!",
        ["welcome_message"] = "¡Sistema de notificación cargado con éxito!",
        ["config_message"] = "¡Configuración cargada con éxito!",
        ["test_message"] = "¡Esta es una notificación de prueba!"
    },
    
    ["pt"] = {
        -- Tipos de notificação
        ["success_title"] = "SUCESSO",
        ["error_title"] = "ERRO",
        ["info_title"] = "INFORMAÇÃO",
        ["warning_title"] = "AVISO",
        ["money_title"] = "TRANSAÇÃO DE DINHEIRO",
        ["police_title"] = "NOTIFICAÇÃO POLICIAL",
        ["admin_title"] = "NOTIFICAÇÃO DE ADMIN",
        ["phone_title"] = "TELEFONE",
        
        -- Legendas
        ["system_subtitle"] = "Notificação do Sistema",
        ["welcome_subtitle"] = "Bem-vindo",
        ["settings_subtitle"] = "Configurações",
        
        -- Mensagens
        ["success_message"] = "Sua operação foi concluída com sucesso!",
        ["error_message"] = "Ocorreu um erro durante a operação!",
        ["info_message"] = "Uma nova atualização está disponível!",
        ["warning_message"] = "Esta ação não pode ser desfeita!",
        ["money_message"] = "$500 foram depositados em sua conta!",
        ["police_message"] = "Um crime foi cometido nas proximidades!",
        ["admin_message"] = "Comandos de administrador foram usados!",
        ["phone_message"] = "Você tem uma nova mensagem!",
        ["welcome_message"] = "Sistema de notificação carregado com sucesso!",
        ["config_message"] = "Configurações carregadas com sucesso!",
        ["test_message"] = "Esta é uma notificação de teste!"
    },
    
    ["de"] = {
        -- Benachrichtigungstypen
        ["success_title"] = "ERFOLG",
        ["error_title"] = "FEHLER",
        ["info_title"] = "INFORMATION",
        ["warning_title"] = "WARNUNG",
        ["money_title"] = "GELDTRANSAKTION",
        ["police_title"] = "POLIZEIBENACHRICHTIGUNG",
        ["admin_title"] = "ADMIN-BENACHRICHTIGUNG",
        ["phone_title"] = "TELEFON",
        
        -- Untertitel
        ["system_subtitle"] = "Systembenachrichtigung",
        ["welcome_subtitle"] = "Willkommen",
        ["settings_subtitle"] = "Einstellungen",
        
        -- Nachrichten
        ["success_message"] = "Ihr Vorgang wurde erfolgreich abgeschlossen!",
        ["error_message"] = "Während des Vorgangs ist ein Fehler aufgetreten!",
        ["info_message"] = "Ein neues Update ist verfügbar!",
        ["warning_message"] = "Diese Aktion kann nicht rückgängig gemacht werden!",
        ["money_message"] = "$500 wurden auf Ihr Konto eingezahlt!",
        ["police_message"] = "In der Nähe wurde ein Verbrechen begangen!",
        ["admin_message"] = "Admin-Befehle wurden verwendet!",
        ["phone_message"] = "Sie haben eine neue Nachricht!",
        ["welcome_message"] = "Benachrichtigungssystem erfolgreich geladen!",
        ["config_message"] = "Konfigurationseinstellungen erfolgreich geladen!",
        ["test_message"] = "Dies ist eine Testbenachrichtigung!"
    }
}