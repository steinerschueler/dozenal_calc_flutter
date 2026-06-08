// Renders a chapter's lead image plus a small, tappable credit line
// (author · license → opens the source page). Used by the theory chapter pages
// (info_pages) and the unit-theory tabs (conversions_page). A broken/missing
// asset collapses to nothing rather than throwing.
import 'package:flutter/material.dart';

import '../license_page.dart' show openExternalLink;
import 'chapter_images.dart';

class ChapterImageView extends StatelessWidget {
  final TheoryImage image;
  const ChapterImageView(this.image, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 260),
              // contain (not cover): show the whole artwork, never crop top/
              // bottom. Portrait pieces letterbox sideways against the page.
              child: Image.asset(
                image.asset,
                width: double.infinity,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stack) =>
                    const SizedBox.shrink(),
              ),
            ),
          ),
          const SizedBox(height: 4),
          InkWell(
            onTap: () => openExternalLink(context, image.sourceUrl),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 2),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.image_outlined,
                      size: 12, color: Color(0xFF808080)),
                  const SizedBox(width: 4),
                  Flexible(
                    child: Text(
                      '${image.author} · ${image.license}',
                      style: const TextStyle(
                        color: Color(0xFF808080),
                        fontSize: 11,
                        height: 1.3,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// A small "related app/tool" card: the referenced icon, name and maker, plus
/// a button that opens its App Store page (apps) or website (web tools). Shown
/// at the head of a chapter that points at another tool (see [AppRef]).
class AppRefCard extends StatelessWidget {
  final AppRef app;
  const AppRefCard(this.app, {super.key});

  @override
  Widget build(BuildContext context) {
    final host = Uri.tryParse(app.url)?.host ?? '';
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF242424),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFF333333)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(13),
            child: Container(
              width: 60,
              height: 60,
              // White backing for transparent icons (e.g. a dark-glyph
              // favicon) so they stay visible on the dark card.
              color: app.iconNeedsBacking ? Colors.white : null,
              child: Image.asset(
                app.icon,
                width: 60,
                height: 60,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stack) => const Icon(
                    Icons.apps, color: Color(0xFF808080)),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  app.name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  '${app.maker} · ${app.genre}',
                  style: const TextStyle(
                    color: Color(0xFF9A9A9A),
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 8),
                InkWell(
                  onTap: () => openExternalLink(context, app.url),
                  borderRadius: BorderRadius.circular(6),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: const Color(0xFF0A84FF),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(app.web ? Icons.public : Icons.apple,
                            color: Colors.white, size: 15),
                        const SizedBox(width: 6),
                        Text(
                          app.web ? host : 'App Store',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(width: 4),
                        const Icon(Icons.open_in_new,
                            color: Colors.white, size: 13),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
