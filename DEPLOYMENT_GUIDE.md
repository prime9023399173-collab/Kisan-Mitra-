# Kisan Mitra Ecosystem – Full Deployment & Hosting Guide

Complete agricultural marketplace with:
- **Backend**: Hono + TypeScript + PostgreSQL / PGlite + Drizzle ORM
- **Frontend**: React 19 + Tailwind CSS + PWA + Desktop & Mobile container
- **AI Chatbot**: OpenRouter / LLM integration with automatic **Mandi Arrival Slot Scheduling & Token Generation**
- **Bilingual IVRS**: Speech Synthesis audio readout in Hindi & English, price comparisons, buyer selection, and batch scheduling
- **Multi-Device Synchronization**: Real-time state syncing across web, mobile, and IVR helpline

---

## 🚀 1. Localhost Running Status

Both servers are currently **running live** on your system:

| Service | Localhost URL | Purpose |
|---|---|---|
| **Frontend Application** | **[http://localhost:5173](http://localhost:5173)** | Web Portal, Mobile App PWA, AI Chatbot, IVRS |
| **Backend API** | **[http://localhost:8787](http://localhost:8787)** | REST API, PGlite Database, Sync, Chatbot & Slots |
| **API Healthcheck** | **[http://localhost:8787/healthz](http://localhost:8787/healthz)** | Server health status (`{"ok": true}`) |

### To Start Manually Anytime:
Simply double click `start-all.bat` in `C:\Users\admin\.gemini\antigravity\scratch\kisan-mitra\start-all.bat`, or run:
```bash
# Terminal 1 (Backend):
cd C:\Users\admin\.gemini\antigravity\scratch\kisan-mitra\backend
node dist/server.js

# Terminal 2 (Frontend):
cd C:\Users\admin\.gemini\antigravity\scratch\kisan-mitra\frontend
npx vite --host 0.0.0.0 --port 5173
```

---

## 🤖 2. AI Chatbot & Slot Scheduling

### How it Works:
1. Click the **Kisan Mitra AI** button at the bottom-right of the screen.
2. The bot is activated with your free OpenRouter API key (`sk-or-v1-9add...6e0`).
3. You can click the **Key icon** in the chat header anytime to switch keys or test providers.
4. **Voice Input**: Click the microphone icon to speak your query in Hindi or English.
5. **Slot Booking Feature**:
   - Ask: *"नीमच मंडी में 50 क्विंटल सोयाबीन का स्लॉट बुक करें"* or *"Schedule slot for Neemuch Mandi on Monday at 10 AM"*
   - The bot automatically generates a verified **Mandi Entry Pass Token** (e.g. `KM-NEE-2026-6561`).
   - The token appears in the chat and is saved to **Scheduled Mandi Arrival Slots** in the Farmer Dashboard!

---

## 📞 3. Bilingual IVRS (Interactive Voice Recognition System)

### How it Works:
1. In the top navigation, switch role to **IVRS Helpline** (or open the IVRS view).
2. Click **Start IVR Voice Call** (`1800-KISAN-MITRA`).
3. **Speech Engine**: The system speaks the prompts aloud using Speech Synthesis!
   - **Step 1 (Language)**: Press `1` for Hindi, `2` for English.
   - **Step 2 (Crop)**: Press `1` for Wheat, `2` for Soybean, `3` for Mustard, `4` for Chana.
   - **Step 3 (Quantity)**: Enter quantity (e.g. 50 Quintals) and press `#`.
   - **Step 4 (Price Comparison Readout)**: The IVR speaks today's live rates across 3 mandis and announces top buyer bids.
   - **Step 5 (Choice)**:
     - Press `1`: Sell directly to top buyer (Malwa Oil Mills / AgroHarvest) with Escrow protection.
     - Press `2`: Book a physical Mandi Arrival Gate Entry Token.
     - Press `3`: Open batch for competitive auction.
   - **Step 6 (Confirmation)**: Token is generated, read aloud, and an SMS confirmation ticket is issued.

---

## 🔥 4. Deploying Frontend to Firebase Hosting

Firebase Hosting is free, fast, and provides free SSL (`https://your-project.web.app`).

### Prerequisites:
Install Firebase CLI (if not already installed):
```bash
npm install -g firebase-tools
```

### Step-by-Step Deployment:
1. **Login to Firebase**:
   ```bash
   firebase login
   ```
2. **Go to the frontend directory**:
   ```bash
   cd C:\Users\admin\.gemini\antigravity\scratch\kisan-mitra\frontend
   ```
3. **Build the production bundle**:
   ```bash
   npm run build
   ```
   *(Creates optimized assets in `dist/`)*
4. **Initialize Firebase** (if setting up a new project):
   ```bash
   firebase init hosting
   ```
   - Select **Use an existing project** (or create a new one in the Firebase console).
   - What do you want to use as your public directory? Type: `dist`
   - Configure as a single-page app (rewrite all urls to /index.html)? Type: `y`
   - Set up automatic builds and deploys with GitHub? Type: `n`
   - Overwrite dist/index.html? Type: `n`
5. **Deploy**:
   ```bash
   firebase deploy --only hosting
   ```
6. **Your Live Link**:
   Firebase will give you a live URL like:
   `https://<your-project-id>.web.app` or `https://<your-project-id>.firebaseapp.com`

---

## ☁️ 5. Hosting the Backend (Any Cloud Platform)

### Option A: Render (Free Tier)
1. Push the code or the `backend` folder to a GitHub repository.
2. In [render.com](https://render.com), click **New +** → **Blueprint** and connect your repo.
3. Render reads `backend/render.yaml` automatically:
   - Sets up a free Web Service + free PostgreSQL database
   - Runs `npm install && npm run build` and `npm start`
4. Copy your backend URL (e.g. `https://kisan-mitra-api.onrender.com`).
5. Update your frontend API base URL or proxy to point to this backend.

### Option B: Railway / Fly.io / VPS
1. The included `backend/Dockerfile` builds a production container in seconds.
2. Set environment variables:
   - `PORT=8787`
   - `NODE_ENV=production`
   - `DATABASE_URL=postgres://user:pass@host:5432/db` (from Supabase, Neon, or Railway)
   - `JWT_SECRET=supersecretjwtkeywith32charactersormore!`
   - `CORS_ORIGINS=*`
3. Run `npm run migrate && npm start`.
