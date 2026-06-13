// Language-neutral registry of legally-unprotected (Public Domain / CC0) images
// for the theory chapters. Keyed by a STABLE chapter id — "<module>/<index>"
// for the prose blocks (world/0, math/2, society/1, …) and "unit/<cat>" for the
// unit-theory areas — so the same image is used in all 14 languages.
//
// Populated from the image-research workflow (docs/research images). Every entry
// is a PD or CC0 image bundled under assets/theory/ and declared in pubspec.yaml.
// A chapter without an entry simply renders no image — the display layer treats a
// missing id (and a missing/broken asset file) as "no image", never an error.

/// One bundled chapter image plus the credit shown beneath it. [license] is
/// always "Public Domain" or "CC0" (the only statuses we accept). [sourceUrl]
/// points at the source page (e.g. the Wikimedia Commons File: page) and is made
/// tappable in the credit line.
class TheoryImage {
  final String asset;
  final String author;
  final String license;
  final String sourceUrl;

  const TheoryImage(
    this.asset, {
    required this.author,
    required this.license,
    required this.sourceUrl,
  });
}

/// id → image. Filled in once the research picks are downloaded and bundled.
const Map<String, TheoryImage> kTheoryImages = {
  'world/0': TheoryImage('assets/theory/world_0.webp',
      author: 'René Just Haüy, 1801 (Traité de minéralogie)',
      license: 'Public Domain',
      sourceUrl: 'https://commons.wikimedia.org/wiki/File:Crystallography_Ha%C3%BCy_integrant_molecules_form_pentagonal_dodecahedron_of_pyrite_1801.jpg'),
  'world/1': TheoryImage('assets/theory/world_1.webp',
      author: 'U.S. Geological Survey / U.S. Bureau of Mines ("Minerals in Your World" project)',
      license: 'Public Domain',
      sourceUrl: 'https://commons.wikimedia.org/wiki/File:GarnetCrystalUSGOV.jpg'),
  'world/2': TheoryImage('assets/theory/world_2.webp',
      author: 'Ernst Haeckel (1834–1919), lithograph with Adolf Giltsch, 1904',
      license: 'Public Domain',
      sourceUrl: 'https://commons.wikimedia.org/wiki/File:Haeckel_Phaeodaria_1.jpg'),
  'world/3': TheoryImage('assets/theory/world_3.webp',
      author: 'Inductiveload',
      license: 'Public Domain',
      sourceUrl: 'https://commons.wikimedia.org/wiki/File:Penrose_Tiling_(Rhombi).svg'),
  'world/4': TheoryImage('assets/theory/world_4.webp',
      author: 'Tomruen (English Wikipedia)',
      license: 'Public Domain',
      sourceUrl: 'https://commons.wikimedia.org/wiki/File:12-14-hedral_honeycomb.png'),
  'world/5': TheoryImage('assets/theory/world_5.webp',
      author: 'Inductiveload',
      license: 'Public Domain',
      sourceUrl: 'https://commons.wikimedia.org/wiki/File:Circle_packing_(hexagonal).svg'),
  'world/6': TheoryImage('assets/theory/world_6.webp',
      author: 'Watchduck (Tilman Piesk)',
      license: 'Public Domain',
      sourceUrl: 'https://commons.wikimedia.org/wiki/File:Circle-of-fifths.svg'),
  'world/7': TheoryImage('assets/theory/world_7.webp',
      author: 'Luca Pacioli (c. 1446-1517), from Summa de Arithmetica, 1494',
      license: 'Public Domain',
      sourceUrl: 'https://commons.wikimedia.org/wiki/File:Finger_counting.jpg'),
  'world/8': TheoryImage('assets/theory/world_8.webp',
      author: 'Stephanus Garsia and other illuminators, 11th century',
      license: 'Public Domain',
      sourceUrl: 'https://commons.wikimedia.org/wiki/File:Saint-Sever_Beatus_f._207v-208r_-_New_Jerusalem.jpg'),
  'world/9': TheoryImage('assets/theory/world_9.webp',
      author: 'Leonardo da Vinci (1452–1519)',
      license: 'Public Domain',
      sourceUrl: 'https://commons.wikimedia.org/wiki/File:De_divina_proportione_-_Dodecaedron_Elevatum_Vacuum.jpg'),
  'world/10': TheoryImage('assets/theory/world_10.webp',
      author: 'Limbourg brothers (Paul, Johan, Herman de Limbourg), c. 1411-1416',
      license: 'Public Domain',
      sourceUrl: 'https://commons.wikimedia.org/wiki/File:Anatomical_Man.jpg'),
  'math/1': TheoryImage('assets/theory/math_1.webp',
      author: 'Immanuel Giel',
      license: 'Public Domain',
      sourceUrl: 'https://commons.wikimedia.org/wiki/File:Maya_numbers_0-20.png'),
  'math/2': TheoryImage('assets/theory/math_2.webp',
      author: 'Babylonian clay tablet, c. 1800 BCE (PD-Art reproduction)',
      license: 'Public Domain',
      sourceUrl: 'https://commons.wikimedia.org/wiki/File:Plimpton_322.jpg'),
  'math/3': TheoryImage('assets/theory/math_3.webp',
      author: 'Gottfried Wilhelm Leibniz (drawing, 1710)',
      license: 'Public Domain',
      sourceUrl: 'https://commons.wikimedia.org/wiki/File:Leibniz\'s_drawing_of_his_calculating_machine.jpg'),
  'society/0': TheoryImage('assets/theory/society_0.webp',
      author: 'Unidentified photographer (work predates Spencer\'s death, 8 Dec 1903)',
      license: 'Public Domain',
      sourceUrl: 'https://commons.wikimedia.org/wiki/File:Herbert_Spencer.jpg'),
  'society/2': TheoryImage('assets/theory/society_2.webp',
      author: 'Marianov (Wikimedia Commons)',
      license: 'CC0',
      sourceUrl: 'https://commons.wikimedia.org/wiki/File:Huevera_o_caja_de_una_docena_de_huevos_00.jpg'),
  'society/3': TheoryImage('assets/theory/society_3.webp',
      author: 'Wikimedia Commons user Ivory',
      license: 'Public Domain',
      sourceUrl: 'https://commons.wikimedia.org/wiki/File:Duimstok_50cm.jpg'),
  'unit/dist': TheoryImage('assets/theory/unit_dist.webp',
      author: 'Leonardo da Vinci (c. 1490)',
      license: 'Public Domain',
      sourceUrl: 'https://commons.wikimedia.org/wiki/File:0_The_Vitruvian_Man_-_by_Leonardo_da_Vinci.jpg'),
  'unit/area': TheoryImage('assets/theory/unit_area.webp',
      author: 'Limbourg brothers and Barthélemy d\'Eyck (c. 1412–1416, additions c. 1440)',
      license: 'Public Domain',
      sourceUrl: 'https://commons.wikimedia.org/wiki/File:Les_Tr%C3%A8s_Riches_Heures_du_duc_de_Berry_mars.jpg'),
  'unit/space': TheoryImage('assets/theory/unit_space.webp',
      author: 'Louis-Jean Montier Deslongchamps (1721–1782)',
      license: 'Public Domain',
      sourceUrl: 'https://commons.wikimedia.org/wiki/File:Futaille_pour_navigation_XVIII%C3%A8_si%C3%A8cle.jpg'),
  'unit/weight': TheoryImage('assets/theory/unit_weight.webp',
      author: 'Johannes Vermeer (1632-1675)',
      license: 'Public Domain',
      sourceUrl: 'https://commons.wikimedia.org/wiki/File:Johannes_Vermeer_-_Woman_Holding_a_Balance_-_Google_Art_Project.jpg'),
  'unit/time': TheoryImage('assets/theory/unit_time.webp',
      author: 'Philippe de Champaigne (1602–1674)',
      license: 'Public Domain',
      sourceUrl: 'https://commons.wikimedia.org/wiki/File:StillLifeWithASkull.jpg'),
  'unit/angle': TheoryImage('assets/theory/unit_angle.webp',
      author: 'Andreas Cellarius (1596-1665)',
      license: 'Public Domain',
      sourceUrl: 'https://commons.wikimedia.org/wiki/File:Cellarius_Harmonia_Macrocosmica_-_Planisphaerium_Arateum.jpg'),
  'unit/price': TheoryImage('assets/theory/unit_price.webp',
      author: 'Quentin Matsys (Quinten Metsys, c. 1466-1530)',
      license: 'Public Domain',
      sourceUrl: 'https://commons.wikimedia.org/wiki/File:Massysm_Quentin_%E2%80%94_The_Moneylender_and_his_Wife_%E2%80%94_1514.jpg'),
  'unit/temp': TheoryImage('assets/theory/unit_temp.webp',
      author: 'Wikimedia Commons',
      license: 'Public Domain',
      sourceUrl: 'https://commons.wikimedia.org/wiki/File:Thermometer_CF.svg'),
};

/// The image for [id], or null when none is registered (id null or unknown).
TheoryImage? theoryImageFor(String? id) =>
    id == null ? null : kTheoryImages[id];

/// A reference to another app (its icon, name, maker, and store link), shown as
/// a small card at the head of a chapter. The icon is the referenced app's own
/// icon, used nominatively to identify and link to it — not a decorative image,
/// so it is exempt from the Public-Domain rule that governs [TheoryImage].
class AppRef {
  final String icon; // bundled asset (the referenced app's/tool's icon)
  final String name;
  final String maker;
  final String genre;
  final String url;

  /// true → a website (globe icon, host shown on the button);
  /// false → an App Store app (Apple icon, "App Store" on the button).
  final bool web;

  /// Whether the icon has transparency and needs a white backing so a dark
  /// glyph stays visible on the dark card (e.g. a transparent favicon).
  final bool iconNeedsBacking;

  const AppRef(
    this.icon, {
    required this.name,
    required this.maker,
    required this.genre,
    required this.url,
    this.web = false,
    this.iconNeedsBacking = false,
  });
}

/// id → referenced app/tool. Keyed like [kTheoryImages] by stable chapter id.
const Map<String, AppRef> kTheoryAppRefs = {
  'society/4': AppRef('assets/theory/dozecal_icon.webp',
      name: 'Dozecal',
      maker: 'Johan Kovacs',
      genre: 'iOS · Utilities',
      url: 'https://apps.apple.com/app/id1521160089'),
  'society/5': AppRef('assets/theory/rapoport_icon.webp',
      name: 'Dozenal Calculator',
      maker: 'Paul Rapoport',
      genre: 'Web · Scientific calculator',
      url: 'https://doz-calc.mx-dev.com',
      web: true,
      iconNeedsBacking: true),
};

/// The referenced app for [id], or null when none is registered.
AppRef? theoryAppRefFor(String? id) =>
    id == null ? null : kTheoryAppRefs[id];
