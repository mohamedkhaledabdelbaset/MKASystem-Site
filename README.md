# MKA System — Marketing & Subscription Website

Professional single-page store to sell MKA System **subscriptions**.

## Pricing model (subscription)
One single full edition — duration is what changes. Base currency is **EGP**:

| Plan    | Price (EGP) |
|---------|-------------|
| Monthly | 300         |
| 3 Months| 800         |
| 6 Months| 1,600       |
| Yearly  | 3,000       |

Other currencies (USD/SAR/AED) are auto-converted from EGP via `RATES` at the top of the `<script>` in `index.html`.
Edit `PLANS` array to change prices/durations — no other file needs touching.

## Download
The full installer is served from `website/downloads/MKASystem.exe` (built from the repo's PyInstaller spec).
To refresh it after code changes: build (`python -m PyInstaller MKASystem.spec --noconfirm --clean`) then
`Copy-Item dist\MKA-POS.exe website\downloads\MKASystem.exe -Force`.

## What's inside
- `index.html` — hero, features, modules preview, subscription plans + EXE download, FAQ, contact, checkout modal with instant key
- Bilingual **EN/AR** (RTL) with persistence, multi-currency pricing
- Bilingual **EN/AR** (RTL) with persistence, multi-currency pricing

## Publish on GitHub Pages (free)
1. Push this repo (`git push origin main`).
2. **Settings → Pages → Source: GitHub Actions**.
3. Workflow `.github/workflows/deploy-website.yml` deploys `website/` on every push touching it.
4. Site URL: `https://mohamedkhaledabdelbaset.github.io/MKASystem/`
   (GitHub Pages supports large static files up to 100 MB — the 54 MB EXE is fine.)

## Payments (TODO before going live)
Checkout currently generates a demo key instantly. To charge real money:
1. **Stripe Payment Links** — one link per plan (m1/m3/m6/y1), no backend needed.
2. In `index.html` → `payBtn.onclick`: redirect to the Stripe link for the selected plan; on return (`?paid=1`) show the key.
3. Alternative: PayPal buttons, or manual transfer + WhatsApp while you set up.

> Real signed activation keys should be issued by your keygen (mka_core key system) — for now issue keys manually from WhatsApp/email after payment, or add a tiny serverless function (Cloudflare Worker) that verifies the payment webhook then returns a signed key.

