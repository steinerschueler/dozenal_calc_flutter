// Step 11 of PORTING.md: Info modal navigation.
// List → Detail → Back via the Flutter Navigator. Pure routing; chapter
// content is in info_content.dart.

import 'package:flutter/material.dart';

import 'info_content.dart';
import 'privacy_page.dart';

class InfoListPage extends StatelessWidget {
  const InfoListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dozenal — Zwölf Kapitel'),
        backgroundColor: const Color(0xFF1A1A1A),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 4),
        children: [
          for (var i = 0; i < infoTitles.length; i++) ...[
            if (i > 0)
              const Divider(color: Color(0xFF2C2C2C), height: 1),
            ListTile(
              leading: SizedBox(
                width: 28,
                child: Text(
                  '${i + 1}.',
                  style: const TextStyle(
                    color: Color(0xFFA0A0A0),
                    fontFamily: 'monospace',
                    fontSize: 13,
                  ),
                  textAlign: TextAlign.right,
                ),
              ),
              title: Text(
                infoTitles[i],
                style: const TextStyle(fontSize: 14, color: Colors.white),
              ),
              trailing: const Icon(
                Icons.chevron_right,
                color: Color(0xFF707070),
                size: 18,
              ),
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => InfoDetailPage(chapterIndex: i),
                ),
              ),
            ),
          ],
          // Spacer + visually-distinct legal-link section.
          const SizedBox(height: 24),
          const Divider(color: Color(0xFF2C2C2C), height: 1),
          ListTile(
            leading: const SizedBox(
              width: 28,
              child: Icon(
                Icons.shield_outlined,
                color: Color(0xFFA0A0A0),
                size: 16,
              ),
            ),
            title: const Text(
              'Datenschutzerklärung',
              style: TextStyle(fontSize: 14, color: Color(0xFFD0D0D0)),
            ),
            trailing: const Icon(
              Icons.chevron_right,
              color: Color(0xFF707070),
              size: 18,
            ),
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const PrivacyPage()),
            ),
          ),
        ],
      ),
    );
  }
}

class InfoDetailPage extends StatelessWidget {
  final int chapterIndex;

  const InfoDetailPage({super.key, required this.chapterIndex});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${chapterIndex + 1}. ${infoTitles[chapterIndex]}',
          style: const TextStyle(fontSize: 14),
        ),
        backgroundColor: const Color(0xFF1A1A1A),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: buildChapterContent(chapterIndex),
        ),
      ),
    );
  }
}
