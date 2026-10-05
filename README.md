# Our Collection — BD Home Decor E-Commerce Store

হাতে তৈরি ফুল, মেটাল হ্যাঙ্গার ও প্রিমিয়াম হোম ডেকোর সামগ্রীর জন্য সম্পূর্ণ কাস্টমাইজড ই-কমার্স সিস্টেম।

---

## 🛠️ টেকনোলজি স্ট্যাক (Tech Stack)
- **Framework:** Next.js 14 (App Router, Standalone build)
- **Styling:** Tailwind CSS
- **Database:** Supabase (PostgreSQL)
- **Language:** TypeScript
- **Deployment:** Namecheap cPanel (Node.js App) / Vercel

---

## 🚀 লোকাল ডেভেলপমেন্ট (Local Setup)

1. প্যাকেজ ইনস্টল করুন:
   ```bash
   npm install
   ```

2. `.env.local` ফাইল কনফিগার করুন:
   ```env
   NEXT_PUBLIC_STORE_NAME="Our Collection"
   NEXT_PUBLIC_BASE_URL=http://localhost:3000
   NEXT_PUBLIC_SUPABASE_URL=your-supabase-url
   NEXT_PUBLIC_SUPABASE_ANON_KEY=your-anon-key
   SUPABASE_SERVICE_ROLE_KEY=your-service-role-key
   ```

3. ডেভেলপমেন্ট সার্ভার চালু করুন:
   ```bash
   npm run dev
   ```
   ব্রাউজারে খুলুন: `http://localhost:3000`

---

## 📦 প্রডাকশন বিল্ড (Production Build)
```bash
npm run build
```
এটি `.next/standalone` ফোল্ডারে অপ্টিমাইজড সার্ভার বান্ডেল তৈরি করবে।

---

## 🌐 Namecheap Hosting ডেপ্লয়মেন্ট গাইড
বিস্তারিত নির্দেশনার জন্য দেখুন: [NAMECHEAP_DEPLOYMENT.md](./NAMECHEAP_DEPLOYMENT.md)
