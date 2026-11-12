# Jarvis'i ücretsiz buluta kur (Render) ve iPhone'dan kullan

Bilgisayar yalnızca **bir kez, yaklaşık 20 dakika** gerekir (arkadaş, okul, kütüphane). Sonrasında her şey iPhone'dan.

## Önce bilmen gerekenler
- Ücretsiz sunucu 15 dakika kullanılmazsa uyur. İlk açılış yaklaşık 1 dakika sürer.
- Ücretsiz sunucuda dosyalar kalıcı değil: konuşma geçmişi, kitap notları ve Ayarlar'da yaptığın değişiklikler sunucu yeniden başlayınca sıfırlanır. `render.yaml` içindeki değerler her zaman geri gelir.
- Adresin internette herkese açık. Koruma `ACCESS_TOKEN` (erişim anahtarı). Anahtarı kimseyle paylaşma.
- Kartsız mı çalışıyor, Render kart isteyebilir mi: bunu doğrulayamadım. Kart isterse dur ve bu yoldan vazgeç.
- Gemini ücretsiz katmanında gönderdiklerin Google tarafından ürün geliştirme için kullanılabilir (AEA, İsviçre, Birleşik Krallık dışında).

## Bölüm 1: Gemini anahtarı (telefondan da olur)
1. aistudio.google.com/apikey → Google hesabınla gir → **Create API key**.
2. Anahtarı bir yere kopyala (notlar uygulaması). Başkasına verme.

## Bölüm 2: Bilgisayarda, bir kez
1. **github.com** → hesap aç → sağ üstte **+ → New repository**. Ad: `jarvis`. **Private** seç → Create.
2. `jarvis-render.zip` dosyasını bilgisayara indir ve **klasöre çıkar** (içinde `jarvis-main` klasörü çıkar).
3. GitHub'da repoda **uploading an existing file** bağlantısına tıkla. GitHub tek seferde en fazla 100 dosya alır, bu yüzden **iki turda** yüklüyoruz:
   - **1. tur:** `jarvis-main` içinden `server` ve `scripts` klasörlerini, ayrıca `package.json`, `render.yaml`, `README.md` dosyalarını sürükleyip bırak (klasörlerin kendisini bırak, içini değil). **Commit changes**'e bas.
   - **2. tur:** Repoda **Add file → Upload files** de, bu sefer yalnızca `web` klasörünü sürükle bırak. **Commit changes**'e bas.
4. Repo ana sayfasında `server`, `web`, `scripts`, `render.yaml` ve `package.json` görünüyor mu? Görünüyorsa tamam. (Gizli `.gitignore` dosyası yüklenmese de sorun olmaz.)
5. `web` klasörünün içinde `src` ve `package.json` var mı bak. Yoksa klasör yanlış yüklenmiş demektir, silip tekrar yükle.
6. **render.com** → GitHub hesabınla kayıt ol → **New → Blueprint** → GitHub'ı bağla → `jarvis` reposunu seç.
7. Render `LLM_API_KEY` sorar: Gemini anahtarını yapıştır → **Apply**.
8. Kurulum 5-10 dakika sürer ("Live" yazınca bitti). Hata verirse **Logs** ekranındaki son satırları bana yapıştır.
9. Servis sayfasında üstte adresi gör (`https://jarvis-xxxx.onrender.com`). **Environment** bölümünde `ACCESS_TOKEN` değerine bak ve kopyala.

## Bölüm 3: iPhone 11'de
1. **Safari**'de aç: `https://jarvis-xxxx.onrender.com/?token=ACCESS_TOKEN_DEĞERİ`
2. İlk açılış 1 dakika sürebilir, bekle.
3. Paylaş → **Ana Ekrana Ekle**.
4. Ana ekrandaki simgeden aç. Anahtar sorarsa yapıştır. Mikrofon/kamera iznine **İzin ver**.
5. Ekrana bir kez dokun (iOS ses için).

## Sorun giderme
- **Sayfa açılmıyor / yüklenip duruyor:** Sunucu uyuyor, 1 dakika bekle.
- **"yetkisiz" yazıyor:** Adresin sonundaki `?token=` değeri yanlış ya da eski. Render → Environment'tan yeniden kopyala.
- **Haberler gelmiyor:** Bazı siteler bulut IP'lerini engelleyebilir. Brifing boş gelirse bana söyle.
- **Gemini 429 / limit hatası:** Ücretsiz katman limiti doldu, birkaç dakika bekle.
- **Anahtarı değiştirmek:** Render → servis → Environment → `LLM_API_KEY` → Save (sunucu yeniden başlar).
