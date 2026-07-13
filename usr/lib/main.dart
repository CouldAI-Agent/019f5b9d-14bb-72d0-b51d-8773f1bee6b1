import 'package:flutter/material.dart';

void main() {
  runApp(const HijaiyahApp());
}

class HijaiyahApp extends StatelessWidget {
  const HijaiyahApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Materi Hijaiyah Bersambung',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF00695C), // Warna hijau islami yang elegan
          brightness: Brightness.light,
        ),
        useMaterial3: true,
        fontFamily: 'Segoe UI',
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final outlineData = [
      _Topic(
        title: '1. Pengenalan Huruf Hijaiyah Bersambung',
        subtopics: [
          'Konsep dasar menyambung huruf (kanan ke kiri).',
          'Perubahan bentuk huruf: di awal, tengah, dan akhir kata.',
          'Kelompok huruf yang bisa disambung (ke kanan dan kiri).',
          '6 Huruf spesial yang tidak bisa disambung ke kiri (ا, د, ذ, ر, ز, و).',
        ],
        icon: Icons.auto_awesome,
      ),
      _Topic(
        title: '2. Membaca Huruf Hijaiyah Bersambung',
        subtopics: [
          'Membaca kombinasi 2 huruf bersambung.',
          'Membaca kombinasi 3 huruf bersambung.',
          'Membaca kata pendek dengan tanda baca dasar (Fathah, Kasrah, Dhammah).',
          'Membaca kata dengan tanda baca lanjutan (Sukun, Tasydid, Tanwin).',
        ],
        icon: Icons.menu_book,
      ),
      _Topic(
        title: '3. Menulis Huruf Hijaiyah Bersambung',
        subtopics: [
          'Teknik dasar menggerakkan pena (Proporsi dan garis dasar/Khat).',
          'Latihan menebalkan (tracing) huruf bersambung.',
          'Latihan merangkai huruf terpisah menjadi satu kata utuh.',
          'Menyalin kata dari contoh tulisan standar.',
        ],
        icon: Icons.draw,
      ),
      _Topic(
        title: '4. Membedakan Huruf yang Bentuknya Berubah atau Mirip',
        subtopics: [
          'Membedakan huruf bersambung dengan titik yang mirip (ب, ت, ث, ن, ي).',
          'Huruf yang berubah bentuk secara drastis saat di tengah/akhir (ع, غ, هـ, ك).',
          'Membedakan huruf yang mirip dengan huruf lain saat disambung (contoh: م dengan ف/qaf).',
        ],
        icon: Icons.compare_arrows,
      ),
      _Topic(
        title: '5. Latihan dan Evaluasi',
        subtopics: [
          'Kuis membaca cepat kata bersambung.',
          'Latihan mendikte (menulis kata bersambung yang didengar).',
          'Menganalisis kesalahan umum dalam merangkai huruf.',
          'Praktik membaca kalimat pendek dalam Al-Qur\\'an atau teks Arab.',
        ],
        icon: Icons.fact_check,
      ),
    ];

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: const Text(
          'Materi Hijaiyah Bersambung',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        elevation: 0,
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            double horizontalPadding = constraints.maxWidth > 800 ? constraints.maxWidth * 0.15 : 16.0;
            return ListView.builder(
              padding: EdgeInsets.symmetric(
                vertical: 24,
                horizontal: horizontalPadding,
              ),
              itemCount: outlineData.length + 1,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return const Padding(
                    padding: EdgeInsets.only(bottom: 24),
                    child: _HeaderSection(),
                  );
                }
                final topic = outlineData[index - 1];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: ExpansionTile(
                      leading: CircleAvatar(
                        backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                        child: Icon(topic.icon, color: Theme.of(context).colorScheme.primary),
                      ),
                      title: Text(
                        topic.title,
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      children: topic.subtopics.map((subtopic) {
                        return ListTile(
                          contentPadding: const EdgeInsets.symmetric(horizontal: 32, vertical: 4),
                          leading: Icon(
                            Icons.check_circle_outline,
                            size: 20,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                          title: Text(
                            subtopic,
                            style: const TextStyle(fontSize: 14),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class _HeaderSection extends StatelessWidget {
  const _HeaderSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.mosque, color: Theme.of(context).colorScheme.onPrimary, size: 32),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  'Silabus Pembelajaran',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            'Pokok dan sub pokok bahasan untuk materi Membaca, Menulis, dan Membedakan Huruf Hijaiyah Bersambung.',
            style: TextStyle(
              color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.9),
              fontSize: 16,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}

class _Topic {
  final String title;
  final List<String> subtopics;
  final IconData icon;

  _Topic({
    required this.title,
    required this.subtopics,
    required this.icon,
  });
}
