# 🚀 Namecheap cPanel এ Next.js (Our Collection) আপলোড ও সেটআপ গাইড

Namecheap Shared Hosting (cPanel) এ Next.js ওয়েবসাইট সুন্দরভাবে চালানোর জন্য নিচে ২টি সহজ পদ্ধতি দেওয়া হলো:

---

## 📌 পদ্ধতি ১: Standalone মোড (সবচেয়ে দ্রুত ও হালকা — Recommended ⭐)

আমরা প্রোজেক্টটিতে `output: 'standalone'` কনফিগার করেছি। এর ফলে মাত্র অল্প কয়েকটি ফাইল আপলোড করলেই প্রজেক্ট চলবে এবং cPanel এর স্টোরেজ বা ফাইল লিমিট (inode) ক্রস করবে না।

### ধাপ ১: আপনার কম্পিউটারে প্রডাকশন বিল্ড তৈরি করুন
প্রোজেক্টের রুট ফোল্ডারে টার্মিনালে রান করুন:
```bash
npm run build
```
এটি `.next/standalone` ফোল্ডার তৈরি করবে।

### ধাপ ২: ফাইলগুলো সাজানো
`.next/standalone` ফোল্ডারের ভেতরে প্রয়োজন হবে:
1. `public` ফোল্ডারটি কপি করে `.next/standalone/` এর ভেতরে পেস্ট করুন (বা সেখানে রাখুন)।
2. `.next/static` ফোল্ডারটি কপি করে `.next/standalone/.next/static` ফোল্ডারে পেস্ট করুন।

### ধাপ ৩: জিপ (ZIP) তৈরি করে Namecheap এ আপলোড
1. `.next/standalone` ফোল্ডারের ভেতরের সমস্ত ফাইল ও ফোল্ডার সিলেক্ট করে একটি `archive.zip` তৈরি করুন।
2. Namecheap cPanel এ লগইন করুন।
3. **File Manager** এ যান।
4. আপনার ডোমেইনের ফোল্ডারে (যেমন `public_html` বা একটি সাব-ফোল্ডারে, যেমন `ourcollection`) জিপ ফাইলটি আপলোড করে **Extract** (আনজিপ) করুন।
5. একই ফোল্ডারে আপনার `.env.local` বা `.env` ফাইলটি আপলোড করুন।

### ধাপ ৪: Namecheap cPanel এ Node.js App সেটআপ
1. cPanel সার্চ বারে লিখুন **"Setup Node.js App"** এবং ক্লিক করুন।
2. **Create Application** বাটনে ক্লিক করুন:
   - **Node.js version:** `18.x` বা `20.x` সিলেক্ট করুন।
   - **Application mode:** `Production`
   - **Application root:** আপনি যেখানে ফাইল আনজিপ করেছেন সেই ডিরেক্টরি পাথ লিখুন (যেমন: `ourcollection` বা `public_html`)।
   - **Application URL:** আপনার ডোমেনটি সিলেক্ট করুন।
   - **Application startup file:** `server.js` লিখুন।
3. **Environment variables** সেকশনে আপনার দরকারি এনভায়রনমেন্ট ভেরিয়েবল যোগ করুন:
   - `PORT`: (cPanel অটোম্যাটিক হ্যান্ডেল করে)
   - `NEXT_PUBLIC_STORE_NAME`: `Our Collection`
   - `NEXT_PUBLIC_BASE_URL`: `https://yourdomain.com`
   - `NEXT_PUBLIC_SUPABASE_URL`: আপনার সুপাবেস URL
   - `NEXT_PUBLIC_SUPABASE_ANON_KEY`: আপনার সুপাবেস এনন কি
   - `SUPABASE_SERVICE_ROLE_KEY`: আপনার সুপাবেস সার্ভিস রোল কি
4. **Create** এ ক্লিক করুন।
5. স্ক্রিনের উপরে **Start / Restart** বাটনে ক্লিক করুন।

---

## 📌 পদ্ধতি ২: সম্পূর্ণ প্রোজেক্ট আপলোড করে cPanel এ বিল্ড দেওয়া

যদি আপনি cPanel এর টার্মিনাল বা SSH ব্যবহার করে সার্ভারে বিল্ড করতে চান:

1. `node_modules` এবং `.next` বাদ দিয়ে প্রোজেক্টের বাকি সব ফাইল জিপ করে Namecheap cPanel এ আপলোড করুন।
2. cPanel **"Setup Node.js App"** এ গিয়ে অ্যাপ তৈরি করুন:
   - **Application startup file:** `server.js`
3. cPanel এর **Terminal** ওপেন করুন অথবা Node.js অ্যাপ পেজ থেকে ভার্চুয়াল এনভায়রনমেন্ট কমান্ড কপি করে টার্মিনালে পেস্ট করুন:
   ```bash
   npm install
   npm run build
   ```
4. cPanel থেকে Node.js অ্যাপটি **Restart** করুন।

---

## ⚙️ দরকারি টিপস
- সাইটের ইমেজ এবং অ্যাসেট দ্রুত লোড হওয়ার জন্য `.env.local` এ সঠিক `NEXT_PUBLIC_BASE_URL` সেট রাখুন।
- ডোমেইনে SSL সার্টিফিকেট (HTTPS) সক্রিয় থাকা নিশ্চিত করুন (Namecheap cPanel এ **Namecheap SSL** বা **Let's Encrypt / AutoSSL** থেকে খুব সহজেই ফ্রিতে একটিভ করা যায়)।
