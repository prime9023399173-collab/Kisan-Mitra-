 <div align="center">

# 🌾 Kisan Mitra · किसान मित्र

### Agricultural Trading & Mandi Information Network

*Real-time APMC mandi prices, smart lot listing, verified buyers, and a voice helpline — built for the farmer, the feature phone, and the trader.*

<br />

**React** · **Vite** · **Tailwind CSS** · **PWA Ready** · **Capacitor (Android APK)**

**हिन्दी** · **English** · **मराठी** &nbsp;|&nbsp; Node.js ≥ 18

[**Features**](#-key-modules) · [**Design System**](#-design-system) · [**Data Model**](#-shared-data-model) · [**Getting Started**](#-getting-started)

</div>

---

## 🌱 About

**Kisan Mitra** ("Farmer's Friend") connects farmers directly to markets and buyers. It brings together mandi price intelligence, produce lot management, buyer sourcing, and a telecom-style helpline into one platform, with an experience tuned for every user:

| 👩‍🌾 Farmers | 📞 Feature-phone users | 💼 Traders & Buyers |
|---|---|---|
| Touch-friendly dashboard, 3-step lot creation, one-click offer handling | Voice helpline (IVRS) simulator with keypad navigation | Data-dense desk to post demand, view batches, and send offers |

Everything is built with **React**, **Tailwind CSS**, and **Lucide Icons**, and strictly follows one custom design system and one shared data model.

---

## 🧭 Table of Contents

- [Key Modules](#-key-modules)
- [Design System](#-design-system)
- [Shared Data Model](#-shared-data-model)
- [Getting Started](#-getting-started)
- [Mobile & PWA](#-mobile--pwa)
- [Production Notes](#-production-notes)

---

## 🚀 Key Modules

### 1. 🌾 Farmer Dashboard

| Feature | What it does |
|---|---|
| **Crop Icon Cards** | Large, touch-friendly cards for Wheat, Soybean, Mustard, Chana, Onion, Cotton, and Paddy |
| **3-Mandi Price Comparison** | Real-time rates across 3 regional APMC mandis, with trend arrows |
| **Sell Now / Wait Advisory** | Rule-based: if the 3-day price rise is **> 5%**, it recommends **Wait**; otherwise **Sell Now** |
| **Create Lot (3 steps)** | Icon-based, minimal typing: `Crop → Quantity Chips → Quality Grade (A/B/C)` |
| **Incoming Offers** | Bids from verified buyers with one-click **Accept / Reject** |
| **Lot Lifecycle Stepper** | `Listed → Matched → Picked Up → Paid` |
| **Grievance Desk** | Report discrepancies on any transaction |

### 2. 📱 Mobile Application & PWA

- **Dual-Experience Switcher** — toggle between the Desktop Web Portal and a Mobile Phone Shell.
- **5-Tab Native Bottom Navigation:**

| Tab | Purpose |
|---|---|
| 🌾 **Kisan** (Home) | Crop cards, 3-mandi rates, Sell/Wait advisory |
| 📊 **Mandi** | Commodity ticker and 7-day sparklines |
| ➕ **Becho** (Quick Sell) | 3-step bottom sheet to list produce |
| 📞 **IVRS** | Simulated telecom helpline call |
| 💼 **Vyapari** | Buyer sourcing desk and batches |

- **PWA & Native Ready** — ships with `manifest.json` and `capacitor.config.json` for home-screen install or building Android APKs via Capacitor.

### 3. 📞 Standalone IVRS Simulator

A telecom voice helpline simulator designed for **feature-phone farmers**.

- Interactive **DTMF dialpad** (`0–9`, `*`, `#`)
- **Speech-bubble transcript** of the call
- **3-mandi comparison** readout
- **Price alerts**
- **Automated lot generation** from the call
- Production integration notice for **Twilio / Exotel**

### 4. 💼 Mandi / Buyer Dashboard

A data-dense table UI built for commercial traders.

- **Post Procurement Demand** form
- **Live price ticker** driven by 7-day APMC price history
- **Aggregated regional lot batches** with an estimated **~18% freight savings** calculation
- Browse matching lots and **dispatch digital offers**

### 5. 🌐 Multi-Language Support

Instant, real-time language switching:

> **हिन्दी** (Hindi) · **English** (EN) · **मराठी** (Marathi)

---

## 🎨 Design System

A calm, earthy, and accessible look: **no dark mode, no glassmorphism, no neon, no gradients.**

### Colors

| Swatch | Role | Hex |
|:---:|---|---|
| 🟩 | **Primary Green** (also Success) | `#4A7C59` |
| 🟫 | **Secondary Earth Brown** | `#8B6F47` |
| ⬜ | **Warm Off-White** (background) | `#F5F1E8` |
| ⬛ | **Dark Text** | `#2D2D2D` |
| 🟧 | **Alert / Warning** | `#D97706` |
| 🟥 | **Error** | `#C0392B` |

### Typography

| Use | Font |
|---|---|
| Headings | **Poppins**, sans-serif |
| UI Text | **Inter**, sans-serif |

### Components & Layout

| Element | Rule |
|---|---|
| Border radius | `12px` (`rounded-xl`) |
| Cards | White background, soft shadow (`shadow-md`), `16px` padding (`p-4`) |
| Buttons | Solid green, white text, `rounded-xl`, **no gradients** |
| Icons | `lucide-react`, strictly **24px** |
| Spacing | Tailwind default scale, section padding `p-6`, card gap `gap-4` |

### 🚫 Negative Constraints

`Zero dark mode` · `Zero glassmorphism` · `Zero neon colors` · `Zero gradients`

---

## 📊 Shared Data Model

All data lives in **`src/data.js`** and strictly follows this model:

| Entity | Fields |
|---|---|
| 🏛️ **Mandi** | `id`, `name`, `location`, `crop`, `price`, `priceHistory[7 days]`, `lastUpdated` |
| 👨‍🌾 **Farmer** | `id`, `name`, `village`, `phone` |
| 📦 **Lot** | `id`, `farmerId`, `crop`, `quantity`, `grade` (A/B/C), `status` (listed / matched / pickedup / paid) |
| 🧑‍💼 **Buyer** | `id`, `name`, `type`, `verified`, `rating`, `demand { crop, quantity }` |
| 💰 **Offer** | `id`, `lotId`, `buyerId`, `price`, `status` (pending / accepted / rejected) |
| 🧾 **Transaction** | `id`, `offerId`, `paymentStatus`, `logisticsStatus` |
| 📝 **Grievance** | `id`, `transactionId`, `message`, `status` |
| 🔔 **PriceAlert** | `id`, `crop`, `mandiId`, `changePercent`, `direction`, `timestamp` |

### How the entities connect

```text
Farmer ──► Lot ──► Offer ◄── Buyer
                     │
                     ▼
               Transaction ──► Grievance

Mandi ──► PriceAlert
```

---

## 🛠️ Getting Started

### Prerequisites

- **Node.js** v18 or higher
- **npm**

### Installation & Run

```bash
# 1. Clone the repository
git clone <repository-url>
cd kisan-mitra

# 2. Install dependencies
npm install

# 3. Start the Vite development server
npm run dev
```

Then open **http://localhost:5173** in your browser.

### Build for Production

```bash
npm run build
```

### 📲 Test on Your Phone

1. Connect your phone to the **same Wi-Fi** as your computer.
2. Open `http://<your-local-ip>:5173` on the phone.

> 💡 If the page doesn't load, start Vite with `npm run dev -- --host` so it listens on your local network.

---

## 📱 Mobile & PWA

The project is ready for both install paths:

| Path | How |
|---|---|
| **PWA** | Uses `manifest.json`, so you can "Add to Home Screen" from the browser |
| **Android APK** | Uses `capacitor.config.json`; build the web app, then sync it with Capacitor and open it in Android Studio |

```bash
npm run build
npx cap add android     # first time only
npx cap sync android
npx cap open android
```

---

## 🔌 Production Notes

- The **IVRS Simulator** is a front-end demo. For real telephony, integrate with **Twilio** or **Exotel**.
- Mandi prices, buyers, and lots come from the shared mock data in `src/data.js`. Swap it for live APMC and backend APIs when going to production.

---

<div align="center">

### 🌾 Built with care for the people who feed us.

**किसान मित्र** · *Kisan Mitra*

</div>
