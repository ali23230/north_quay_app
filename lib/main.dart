import 'package:flutter/material.dart';

void main() {
  runApp(const NorthQuayApp());
}

class NorthQuayApp extends StatelessWidget {
  const NorthQuayApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'متابعة الرصيف الشمالي',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        fontFamily: 'Roboto',
      ),
      home: const MainDashboard(),
    );
  }
}

// لوحة التحكم الرئيسية الخاصة بك (المكلف بملف المشروع / Super Admin)
class MainDashboard extends StatefulWidget {
  const MainDashboard({Key? key}) : super(key: key);

  @override
  State<MainDashboard> createState() => _MainDashboardState();
}

class _MainDashboardState extends State<MainDashboard> {
  // الدور الحالي للاختبار أو الإدارة العليا
  String userRole = "المكلف بملف المشروع (Super Admin)";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('متابعة مشروع الرصيف الشمالي'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_active),
            onPressed: () {
              // تنبيهات الأوامر والتقارير الجديدة
            },
          ),
        ],
      ),
      drawer: NavigationDrawer(userRole: userRole),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // بطاقة الترحيب والصلاحيات
            Card(
              color: Colors.blue.shade900,
              child: ListTile(
                title: const Text(
                  'مرحباً بك يا مهندس (المكلف بملف المشروع)',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  'صلاحية التحكم الكامل: $userRole',
                  style: const TextStyle(color: Colors.white70),
                ),
                trailing: const Icon(Icons.verified_user, color: Colors.amber),
              ),
            ),
            const SizedBox(height: 20),

            // قسم التوجيهات والأوامر لـ DTP
            const Text(
              'أحدث توجيهات مدير الأشغال العمومية (DTP)',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Card(
              elevation: 3,
              color: Colors.amber.shade50,
              child: const ListTile(
                leading: Icon(Icons.assignment_late, color: Colors.deepOrange),
                title: Text('توجيه رسمي: مراجعة جداول صب الخوازيق والخرسانة'),
                subtitle: Text('جهة الإصدار: مديرية الأشغال العمومية (DTP)'),
              ),
            ),
            const SizedBox(height: 20),

            // مؤشرات الإنجاز العامة
            const Text(
              'مؤشرات الإنجاز للرصيف الشمالي',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: StatCard(
                    title: 'الخوازيق المنجزة',
                    value: '48 / 120',
                    color: Colors.teal,
                    icon: Icons.foundation,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: StatCard(
                    title: 'الخرسانة المصبوبة',
                    value: '1,450 m³',
                    color: Colors.blue,
                    icon: Icons.view_in_ar,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // أقسام النظام الميداني والتحكم
            const Text(
              'أقسام الإدارة والمتابعة',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              children: [
                MenuTile(
                  title: 'إدارة الأعضاء (7 أدوار)',
                  icon: Icons.people_alt,
                  color: Colors.purple,
                  onTap: () {},
                ),
                MenuTile(
                  title: 'تقارير الخوازيق',
                  icon: Icons.engineering,
                  color: Colors.teal,
                  onTap: () {},
                ),
                MenuTile(
                  title: 'تقارير الخرسانة المسلحة',
                  icon: Icons.domain,
                  color: Colors.blue,
                  onTap: () {},
                ),
                MenuTile(
                  title: 'أوامر وتوجيهات DTP',
                  icon: Icons.gavel,
                  color: Colors.brown,
                  onTap: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class StatCard extends StatelessWidget {
  final String title;
  final String value;
  final Color color;
  final IconData icon;

  const StatCard({
    required this.title,
    required this.value,
    required this.color,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color, width: 1.5),
      ),
      child: Column(
        children: [
          Icon(icon, size: 36, color: color),
          const SizedBox(height: 8),
          Text(title, style: const TextStyle(fontSize: 14, color: Colors.black87)),
          const SizedBox(height: 4),
          Text(value, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: color)),
        ],
      ),
    );
  }
}

class MenuTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const MenuTile({
    required this.title,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Colors.white),
            const SizedBox(height: 10),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

class NavigationDrawer extends StatelessWidget {
  final String userRole;
  const NavigationDrawer({required this.userRole});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text('متابعة الرصيف الشمالي'),
            accountEmail: Text(userRole),
            currentAccountPicture: const CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.anchor, size: 40, color: Colors.blueGrey),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.gavel),
            title: const Text('أوامر مدير الأشغال العمومية (DTP)'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.check_circle_outline),
            title: const Text('اعتماد التقارير اليومية'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.people),
            title: const Text('الأعضاء الـ 7 في النظام'),
            onTap: () {},
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('إعدادات النظام'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
