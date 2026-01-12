# Products and Partnership Management

ระบบจัดการโปรเจคและพาร์ทเนอร์ที่แสดงข้อมูลผ่าน Dashboard แบบ Interactive

## คุณสมบัติ

- Dashboard สำหรับติดตามสถานะโปรเจค
- แสดงแผนที่ตำแหน่งพาร์ทเนอร์ด้วย Leaflet
- กราฟและ Analytics ด้วย Chart.js
- จัดการทีมงานและ Resource Allocation
- ติดตาม KPIs และสถานะต่างๆ

## เทคโนโลยีที่ใช้

- HTML5, CSS3, JavaScript (Vanilla)
- [Leaflet](https://leafletjs.com/) - Interactive maps
- [Chart.js](https://www.chartjs.org/) - Charts and graphs
- JSON - Data storage

## โครงสร้างโปรเจค

```
.
├── index.html          # หน้าหลัก
├── data/              # ข้อมูล JSON
│   ├── categories.json
│   ├── members.json
│   ├── partners.json
│   ├── projects.json
│   └── roles.json
├── vercel.json        # Vercel configuration
├── .gitignore
└── README.md
```

## วิธี Deploy บน Vercel

### วิธีที่ 1: Deploy ผ่าน Vercel Dashboard (แนะนำสำหรับมือใหม่)

1. สร้างบัญชี Vercel ที่ [vercel.com](https://vercel.com)
2. เชื่อมต่อกับ GitHub account ของคุณ
3. Push code นี้ขึ้น GitHub repository
4. ใน Vercel Dashboard คลิก "Add New Project"
5. เลือก repository ที่ต้องการ
6. Vercel จะ detect ว่าเป็น static site อัตโนมัติ
7. คลิก "Deploy"
8. รอสักครู่ แล้วจะได้ URL เช่น `https://your-project.vercel.app`

### วิธีที่ 2: Deploy ผ่าน Vercel CLI

1. ติดตั้ง Vercel CLI:
```bash
npm install -g vercel
```

2. ใน folder โปรเจค รัน:
```bash
vercel
```

3. ทำตามขั้นตอนที่ CLI แนะนำ:
   - Login เข้า Vercel account
   - ตอบคำถามเกี่ยวกับโปรเจค
   - Vercel จะ deploy ให้อัตโนมัติ

4. สำหรับ production deployment:
```bash
vercel --prod
```

### วิธีที่ 3: Deploy จาก GitHub Actions (CI/CD)

โปรเจคจะ auto-deploy ทุกครั้งที่ push ไปยัง GitHub หลังจากเชื่อมต่อกับ Vercel

## การพัฒนาแบบ Local

เปิดไฟล์ [index.html](index.html) ใน browser หรือใช้ local server:

```bash
# ใช้ Python
python -m http.server 8000

# ใช้ Node.js
npx serve

# ใช้ PHP
php -S localhost:8000
```

จากนั้นเปิด browser ไปที่ `http://localhost:8000`

## การแก้ไขข้อมูล

แก้ไขไฟล์ JSON ใน folder [data/](data/):
- [partners.json](data/partners.json) - ข้อมูลพาร์ทเนอร์
- [projects.json](data/projects.json) - ข้อมูลโปรเจค
- [members.json](data/members.json) - ข้อมูลสมาชิกทีม
- [roles.json](data/roles.json) - บทบาทต่างๆ
- [categories.json](data/categories.json) - หมวดหมู่

## Environment Variables (ถ้ามี)

ถ้าต้องการเพิ่ม environment variables ใน Vercel:
1. ไปที่ Project Settings > Environment Variables
2. เพิ่มตัวแปรที่ต้องการ
3. Deploy ใหม่

## การแก้ปัญหา

### ปัญหา: ไม่โหลดข้อมูล JSON
- ตรวจสอบ path ของไฟล์ JSON ใน code
- ตรวจสอบ CORS policy ถ้ารันแบบ local
- ใช้ local server แทนการเปิดไฟล์โดยตรง

### ปัญหา: Vercel deployment ล้มเหลว
- ตรวจสอบว่ามีไฟล์ `index.html` อยู่ใน root directory
- ตรวจสอบ syntax ใน `vercel.json`
- ดู build logs ใน Vercel dashboard

## ลิงก์ที่เป็นประโยชน์

- [Vercel Documentation](https://vercel.com/docs)
- [Leaflet Documentation](https://leafletjs.com/reference.html)
- [Chart.js Documentation](https://www.chartjs.org/docs/)

## License

ใช้งานได้อย่างอิสระภายในองค์กร
