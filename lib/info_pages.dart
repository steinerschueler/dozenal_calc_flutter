// Step 11 of PORTING.md: Info modal navigation.
// List → Detail → Back via the Flutter Navigator. Pure routing; chapter
// content is in info_content.dart.

import 'package:flutter/material.dart';

import 'info_content.dart';

class InfoListPage extends StatelessWidget {
  const InfoListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dozenal — Zwölf Kapitel'),
        backgroundColor: const Color(0xFF1A1A1A),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 4),
        itemCount: infoTitles.length,
        separatorBuilder: (_, _) => const Divider(
          color: Color(0xFF2C2C2C),
          height: 1,
        ),
        itemBuilder: (ctx, i) {
          return ListTile(
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
          );
        },
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
