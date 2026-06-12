// fr manual chapters. part of ../manual.dart.
// Grundbedienung migrated verbatim from the retired
// info_content_fr.dart (legacy chapter 0). Teaching chapters are
// German-first and fall back until translated; the chapter title is the
// German placeholder until the manual translation pass.

part of '../manual.dart';

List<ManualChapter> _manualChaptersFr() => const [
  ManualChapter('Grundbedienung', [
    _H("Les chiffres"),
    _P(
      "Cette calculatrice utilise ses propres symboles pour les "
      "douze chiffres. Quatre chiffres-pivots sont des pointes de "
      "flèche stylisées pointant dans les quatre points cardinaux "
      "— 1 (haut), 4 (gauche), 7 (droite), A (bas). Ils divisent "
      "le cercle numérique en quatre groupes de trois, comme les "
      "heures 12, 3, 6 et 9 sur un cadran d'horloge.",
    ),
    _P(
      "Tous les chiffres intermédiaires sont construits à partir "
      "de demi-cercles et de cercles pleins. Le zéro est un simple "
      "cercle, B (= onze) un demi-cercle au-dessus d’un cercle plein.",
    ),
    _DigitLegend(),
    _H("Utilisation de base"),
    _P(
      "Tapez les nombres et les opérateurs comme sur une "
      "calculatrice de poche ordinaire. Appuyez sur la large "
      "touche = en bas pour calculer le résultat. AC (en rouge "
      "d'avertissement) efface toute la saisie et le résultat ; "
      "Del supprime le caractère à gauche du curseur.",
    ),
    _H("Aide et théorie"),
    _P(
      "À gauche et à droite de la touche =, deux boutons ronds : "
      "(i) ouvre ces douze chapitres de théorie, (?) rejoue la "
      "visite guidée avec les marqueurs rouges. La visite "
      "s'ouvre automatiquement au premier lancement.",
    ),
    _H("Curseur et navigation"),
    _P(
      "La barre rouge dans le champ de saisie est le curseur. "
      "Utilisez ◀ et ▶ pour le déplacer, en insérant ou en "
      "supprimant des caractères au milieu d'une formule. Après "
      "un calcul, le curseur passe dans le champ de résultat — "
      "les flèches déplacent alors le curseur du résultat. Dès "
      "qu'une nouvelle saisie commence, le curseur revient dans "
      "le champ de saisie.",
    ),
    _H("Poursuivre un calcul"),
    _P(
      "Après un calcul, vous pouvez poursuivre directement avec "
      "un opérateur. Tapez + 5 = par exemple, et la calculatrice "
      "utilise automatiquement le dernier résultat comme premier "
      "opérande. Pour commencer un calcul entièrement nouveau, "
      "appuyez d'abord sur AC.",
    ),
    _H("Double appui pour les fonctions inverses"),
    _P(
      "Un second appui sur une touche de fonction la transforme "
      "en son inverse : sin devient sin⁻¹, cos devient cos⁻¹, et "
      "ainsi de suite. La même règle s'applique aux fonctions "
      "hyperboliques du panneau d'extension. Un petit point doré "
      "sur la touche signale que le prochain appui inversera.",
    ),
    _H("Appui long pour plus de fonctions"),
    _P(
      "Les touches marquées d'un petit coin en bas à droite "
      "offrent des fonctions apparentées par appui long : x□ "
      "contient x², log contient ln, log₁₂ et eˣ, − contient ±, "
      "STO contient M+ et M−, n! contient nCr et nPr. Pour "
      "choisir, glissez le doigt sur l'option voulue et relâchez "
      "— ou relâchez puis touchez l'option. Un tap à côté ferme "
      "le panneau.",
    ),
    _H("Opérateurs spéciaux"),
    _P(
      "x² élève le nombre précédent au carré. √ calcule la racine "
      "carrée ; si un nombre se trouve à sa gauche, ce nombre sert de "
      "degré de la racine : 3√8 donne la racine cubique de 8, soit 2. "
      "log calcule un logarithme où le nombre de gauche est l'argument "
      "et celui de droite la base : 8 log 2 est le logarithme de 8 en "
      "base 2, soit 3. ⊕ calcule la somme parallèle : "
      "a ⊕ b = (a·b)/(a+b), utile pour les résistances en "
      "parallèle.",
    ),
    _H("Panneau d'extension"),
    _P(
      "La touche … en bas à droite ouvre le panneau d'extension "
      "avec d'autres fonctions : mémoire, constantes (π, e, φ, "
      "√2), fonctions hyperboliques, opérateurs avancés, ainsi "
      "que EXP et DRG. La même touche le ferme, ou un tap en dehors du "
      "panneau. Sur tablette, tous les ensembles sont visibles "
      "côte à côte de toute façon — pas de superposition.",
    ),
    _Pre(
      "  6 — Mémoire :        STO   RCL   MC    Ans\n"
      "  7 — Constantes :     π     e     φ     √2\n"
      "  8 — Hyperboliques :  sinh  cosh  tanh  coth\n"
      "  9 — Avancés :        n!    |x|   1/x   mod\n"
      "  10 — Modes :         EXP   DRG   …",
    ),
    _H("Mémoire"),
    _P(
      "STO mémorise le résultat actuel, RCL insère la valeur "
      "mémorisée dans la saisie, MC efface la mémoire. Un petit "
      "M sur l'écran indique que quelque chose est mémorisé. Ans "
      "insère le résultat du dernier calcul — les valeurs "
      "rationnelles exactes sont mémorisées entièrement, la "
      "périodicité est préservée.",
    ),
    _H("Trait de période"),
    _P(
      "Lorsque le résultat est une fraction périodique, la "
      "calculatrice marque les chiffres répétés d'une barre "
      "au-dessus. Exemple : 1/5 donne 0.2497 avec une barre sur "
      "les quatre chiffres. Pour les périodes de plus de cinq "
      "chiffres, seuls les cinq premiers sont affichés, suivis "
      "de …",
    ),
    _H("Système numérique : Doz / Dez"),
    _P(
      "Vous changez le système numérique dans les réglages, "
      "accessibles via la touche (i) : duodécimal calcule en base "
      "12 (par défaut), décimal en base 10. Le système actif "
      "s'affiche en haut à droite de l'écran.",
    ),
    _P(
      "En basculant, le nombre actuellement visible est "
      "automatiquement converti dans l'autre système. « 10 » en "
      "Doz devient « 12 » en Dez. En mode Dez, les symboles 10 "
      "et 11 deviennent inactifs (grisés), puisqu'ils n'existent "
      "pas comme chiffres uniques en base 10 — pour le Doz, il "
      "suffit de rebasculer.",
    ),
    _H("Mode angle"),
    _P(
      "DRG cycle le mode angle pour les fonctions "
      "trigonométriques : DEG → RAD → GRAD → DEG. Le mode actuel "
      "s'affiche en haut à droite de l'écran, juste au-dessus de "
      "l'indicateur Doz/Dez. Par défaut : DEG.",
    ),
  ]),
];
