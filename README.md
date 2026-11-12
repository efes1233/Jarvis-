# JARVIS PRO

Kişisel yapay zekâ asistanı — Efe Ataş

## Özellikler (gerçekten entegre)

- **Dört AI kişiliği**: JARVIS · FRIDAY · E.V. · E.D.I.T.H.  
  Arayüzden seçilir, renk teması değişir, istek sunucuya `persona` olarak gider, system prompt overlay uygulanır.
- **AI Council**: Aynı soruya dört persona sırayla yanıt verir (paralel değil; açıkça belirtilir).
- **SinemaPaneli**: Mixkit fragmanları, sesli film arama, JustWatch / yasal site linkleri.
- Sesli komut + TTS, el takibi (MediaPipe), 3D Dünya (Globe), VideoPanel, Dashboard, kamera, PWA, Render.

## Kurulum

```bash
unzip jarvis.zip
cd jarvis-main
npm run setup          # server + web bağımlılıkları, .env örneği
# server/.env içine isteğe bağlı:
#   OPENAI_API_KEY=...
#   GEMINI_API_KEY=...
#   GROQ_API_KEY=...
#   ACCESS_TOKEN=...   (isteğe bağlı koruma)
npm start
```

Geliştirme: `npm run dev`

## Render

Mevcut `render.yaml` kullanılır. Build: `npm run build` (veya projeye özel script).  
API anahtarları Render Environment Variables üzerinden verilir; ZIP içine yazılmaz.

## Persona kullanımı

Üstteki çubuktan seçin veya 🏛 ile AI Council başlatın.  
Seçim `localStorage`’da saklanır.

## Sinema

🎬 butonu → küçük ekran + fragmanlar.  
Sesli: “film aç …” / “sinema”.  
Siteler yeni sekmede açılır (reklam engelleyici önerilir). Korsan indirme yok.

## Bilinen sınırlar

- Gerçek zamanlı ücretsiz sınırsız OCR / nesne tanıma yok.
- Yüksek kaliteli bağımsız Mars/Jüpiter 3D sahneleri ve tam 3D laboratuvar bu pakette yok.
- AI Council paralel değil, sırayla.
- API limitleri ücretsiz servislerin kendi limitleridir.

Ayrıntı: `JARVIS_PRO_STATUS.md` ve `assets/ASSET_MANIFEST.md`.
