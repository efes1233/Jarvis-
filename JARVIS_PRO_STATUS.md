# JARVIS PRO – Durum Raporu (B öncelikleri)

**Sahip:** Efe Ataş · **Dosya:** jarvis.zip · **Tarih:** 2026-11-12

## Bu turda eklenenler

### 1. Görsel analiz (E.D.I.T.H.)
- `POST /api/vision/analyze` + `server/src/vision.ts` (mevcut routellm / VISION_MODEL yolu)
- `VisionPanel`: foto seç/çek → analiz
- **Gerekli:** `VISION_MODEL` veya vision destekli model + sağlayıcı API anahtarı (`server/.env`)
- Anahtar yoksa 502 + anlaşılır hata; sınırsız değil

### 2. JARVIS ORBIT
- Globe: Dünya / Ay / Mars / Jüpiter gövde stilleri + dönüş hızı
- 🌐 butonu ile döngüsel seçim (localStorage)
- Temsili simülasyon; gerçek uydu telemetrisi yok

### 3. Sinema
- Favoriler, izleme listesi, geçmiş (localStorage, max 50)
- Sekmeler + film adı ekleme

### 4. Mobil / performans
- H/L grafik kalitesi (dpr ve dönüş hızı)
- localStorage `jarvis.gfx`

### ORBIT görsel FX (ek)
- Atmosfer parıltısı, terminator, tarama yayı, yörünge halkası, nabız işaretler, parçacıklar
- LITE modda sadeleşir (iPhone 11)
- Temsili sci-fi; gerçek uydu verisi değil

## Korunan
4 persona, AI Council (sırayla), ses, kamera, MediaPipe, VideoPanel, Dashboard, Render, PWA

## Test notu
- Kod entegrasyonu tamam
- Canlı browser + gerçek API anahtarı bu sandbox’ta koşturulmadı
- Vision: anahtar yapılandırılmadan “çalışıyor” denmez

## Kurulum
```bash
cd jarvis-main && npm run setup
# server/.env örneği:
# VISION_MODEL=gemini-2.0-flash
# GEMINI_API_KEY=...   # veya mevcut RouteLLM / OpenAI uyumlu anahtar
npm start
```
