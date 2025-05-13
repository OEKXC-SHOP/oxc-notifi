document.addEventListener('DOMContentLoaded', function() {
    const notificationsContainer = document.getElementById('notifications-container');
    let notificationCount = 0;
    
    // Config değerleri
    const config = {
        defaultDuration: 5000,
        maxNotifications: 5,
        position: "top-right",
        defaultSound: true,
        soundVolume: 0.2,
        language: "tr",
        defaultTheme: "dark",
        glassmorphismEffect: true,
        hologramEffect: true,
        progressBar: true,
        notificationTypes: {
            "success": {
                icon: "fa-check-circle",
                color: "#2ed573",
                sound: "success.mp3"
            },
            "error": {
                icon: "fa-times-circle",
                color: "#ff4757",
                sound: "error.mp3"
            },
            "info": {
                icon: "fa-info-circle",
                color: "#36a2eb",
                sound: "info.mp3"
            },
            "warning": {
                icon: "fa-exclamation-triangle",
                color: "#ff9f43",
                sound: "warning.mp3"
            },
            "money": {
                icon: "fa-dollar-sign",
                color: "#2ecc71",
                sound: "money.mp3"
            },
            "police": {
                icon: "fa-shield-alt",
                color: "#3498db",
                sound: "police.mp3"
            },
            "admin": {
                icon: "fa-user-shield",
                color: "#9b59b6",
                sound: "admin.mp3"
            },
            "phone": {
                icon: "fa-phone-alt",
                color: "#34ace0",
                sound: "phone.mp3"
            }
        },
        locales: {
            "tr": {
                "success_title": "BAŞARILI İŞLEM",
                "error_title": "HATA OLUŞTU",
                "info_title": "BİLGİ",
                "warning_title": "UYARI",
                "money_title": "PARA İŞLEMİ",
                "police_title": "POLİS BİLDİRİMİ",
                "admin_title": "ADMİN BİLDİRİMİ",
                "phone_title": "TELEFON",
                "system_subtitle": "Sistem Bildirimi",
                "welcome_subtitle": "Hoş Geldiniz",
                "settings_subtitle": "Ayarlar",
                "success_message": "İşleminiz başarıyla tamamlandı!",
                "error_message": "İşlem sırasında bir hata oluştu!",
                "info_message": "Yeni bir güncelleme mevcut!",
                "warning_message": "Bu işlem geri alınamaz!",
                "money_message": "$500 hesabınıza yatırıldı!",
                "police_message": "Yakınınızda bir suç işlendi!",
                "admin_message": "Admin komutları kullanıldı!",
                "phone_message": "Yeni bir mesajınız var!",
                "welcome_message": "Bildirim sistemi başarıyla yüklendi!",
                "config_message": "Config ayarları başarıyla yüklendi!",
                "test_message": "Bu bir test bildirimidir!"
            }
        }
    };
    
    // Tema kontrolü
    function getTheme(theme) {
        if (theme === 'auto') {
            const hour = new Date().getHours();
            return (hour >= 6 && hour < 20) ? 'light' : 'dark';
        }
        return theme || config.defaultTheme;
    }
    
    // Bildirim konumunu ayarla
    function setNotificationPosition(position) {
        const container = document.getElementById('notifications-container');
        
        // Önce tüm pozisyon sınıflarını temizle
        container.classList.remove('top-right', 'top-left', 'bottom-right', 'bottom-left', 'top-center');
        
        // Yeni pozisyon sınıfını ekle
        container.classList.add(position);
        
        // Pozisyona göre stil ayarla
        switch(position) {
            case 'top-left':
                container.style.top = '20px';
                container.style.left = '20px';
                container.style.right = 'auto';
                container.style.bottom = 'auto';
                container.style.transform = 'none';
                break;
            case 'bottom-right':
                container.style.top = 'auto';
                container.style.left = 'auto';
                container.style.right = '20px';
                container.style.bottom = '20px';
                container.style.transform = 'none';
                break;
            case 'bottom-left':
                container.style.top = 'auto';
                container.style.left = '20px';
                container.style.right = 'auto';
                container.style.bottom = '20px';
                container.style.transform = 'none';
                break;
            case 'top-center':
                container.style.top = '20px';
                container.style.left = '50%';
                container.style.right = 'auto';
                container.style.bottom = 'auto';
                container.style.transform = 'translateX(-50%)';
                break;
            default: // top-right
                container.style.top = '20px';
                container.style.left = 'auto';
                container.style.right = '20px';
                container.style.bottom = 'auto';
                container.style.transform = 'none';
                break;
        }
    }
    
    // Bildirim oluşturma
    function createNotification(data) {
        try {
            // Config değerlerini güncelle
            if (data.maxNotifications) {
                config.maxNotifications = data.maxNotifications;
            }
            
            // Bildirim konumunu ayarla
            if (data.position) {
                setNotificationPosition(data.position);
            }
            
            // Mevcut bildirim sayısını kontrol et
            if (notificationCount >= config.maxNotifications) {
                const oldestNotification = notificationsContainer.lastChild;
                if (oldestNotification) {
                    oldestNotification.remove();
                    notificationCount--;
                }
            }
            
            const notification = document.createElement('div');
            const theme = getTheme(data.theme);
            
            notification.className = `notification ${data.type}`;
            if (theme === 'light') {
                notification.classList.add('light');
            }
            notification.style.setProperty('--duration', data.duration || config.defaultDuration);
            
            // Cam efekti kontrolü
            if (data.glassmorphism === false || !config.glassmorphismEffect) {
                notification.classList.add('no-glass');
            }
            
            // Hologram efekti
            if (data.hologram !== false && config.hologramEffect) {
                const hologramEffect = document.createElement('div');
                hologramEffect.className = 'hologram-effect';
                notification.appendChild(hologramEffect);
            }
            
            // Accent çizgisi
            const accent = document.createElement('div');
            accent.className = 'notification-accent';
            notification.appendChild(accent);
            
            // İkon container
            const iconContainer = document.createElement('div');
            iconContainer.className = 'notification-icon-container';
            
            // Glow efekti
            const glow = document.createElement('div');
            glow.className = 'notification-glow';
            iconContainer.appendChild(glow);
            
            // İkon
            const iconElement = document.createElement('div');
            iconElement.className = 'notification-icon';
            
            const icon = document.createElement('i');
            icon.className = `fas ${data.icon || config.notificationTypes[data.type]?.icon || 'fa-bell'}`;
            iconElement.appendChild(icon);
            
            iconContainer.appendChild(iconElement);
            notification.appendChild(iconContainer);
            
            // İçerik
            const content = document.createElement('div');
            content.className = 'notification-content';
            
            // Başlık
            const header = document.createElement('div');
            header.className = 'notification-header';
            
            if (data.title) {
                const title = document.createElement('div');
                title.className = 'notification-title';
                title.textContent = data.title;
                header.appendChild(title);
            }
            
            if (data.subtitle) {
                const subtitle = document.createElement('div');
                subtitle.className = 'notification-subtitle';
                subtitle.textContent = data.subtitle;
                header.appendChild(subtitle);
            }
            
            content.appendChild(header);
            
            // Mesaj
            const message = document.createElement('div');
            message.className = 'notification-message';
            message.textContent = data.message;
            content.appendChild(message);
            
            notification.appendChild(content);
            
            // İlerleme çubuğu
            if (data.progressBar !== false && config.progressBar) {
                const progress = document.createElement('div');
                progress.className = 'notification-progress';
                notification.appendChild(progress);
            }
            
            // Bildirimi en üste ekle
            if (notificationsContainer.firstChild) {
                notificationsContainer.insertBefore(notification, notificationsContainer.firstChild);
            } else {
                notificationsContainer.appendChild(notification);
            }
            notificationCount++;
            
            // Ses efekti
            if (data.sound !== false && config.defaultSound) {
                try {
                    const soundFile = data.soundFile || config.notificationTypes[data.type]?.sound || `${data.type}.mp3`;
                    const audio = new Audio(`sounds/${soundFile}`);
                    audio.volume = data.volume || config.soundVolume;
                    audio.play().catch(e => {
                        console.log('Ses çalınamadı:', e);
                        // Hata durumunda alternatif ses çalma yöntemi
                        const backupAudio = document.createElement('audio');
                        backupAudio.src = `sounds/${soundFile}`;
                        backupAudio.volume = data.volume || config.soundVolume;
                        document.body.appendChild(backupAudio);
                        backupAudio.play().then(() => {
                            setTimeout(() => {
                                document.body.removeChild(backupAudio);
                            }, 3000);
                        }).catch(() => {
                            document.body.removeChild(backupAudio);
                        });
                    });
                } catch (error) {
                    console.error('Ses dosyası yüklenemedi:', error);
                }
            }
            
            // Süre sonunda kaldır
            setTimeout(() => {
                notification.addEventListener('animationend', (e) => {
                    if (e.animationName === 'fadeOut') {
                        notification.remove();
                        notificationCount--;
                    }
                });
            }, data.duration || config.defaultDuration);
            
            // Tıklama ile kapatma
            notification.addEventListener('click', function() {
                this.style.animation = 'fadeOut 0.5s forwards';
                setTimeout(() => {
                    this.remove();
                    notificationCount--;
                }, 500);
            });
        } catch (error) {
            console.error('Bildirim oluşturulurken hata oluştu:', error);
        }
    }
    
    // NUI mesajlarını dinle
    window.addEventListener('message', function(event) {
        try {
            const item = event.data;
            
            if (item.action === 'notify') {
                createNotification(item.data);
            } else if (item.action === 'clearAll') {
                // Tüm bildirimleri temizle
                while (notificationsContainer.firstChild) {
                    notificationsContainer.removeChild(notificationsContainer.firstChild);
                }
                notificationCount = 0;
            }
        } catch (error) {
            console.error('Mesaj işlenirken hata oluştu:', error);
        }
    });
    
    // Varsayılan konum ayarla
    setNotificationPosition(config.position);
    
    // Oyun içi hata yakalama
    window.onerror = function(message, source, lineno, colno, error) {
        console.error('OXC-Notify Hata:', message, 'Kaynak:', source, 'Satır:', lineno);
        return true;
    };
}); 