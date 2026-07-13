class Tasabeh {
  final int id;
  final String title;
  final int count;

  Tasabeh({required this.id, required this.title, required this.count});

  factory Tasabeh.fromMap(Map<String, dynamic> map) =>
      Tasabeh(id: map["id"], title: map["title"], count: map["count"]);
}

final List<Map<String, dynamic>> sebhaContent = [
  {"id": 1, "title": "سُبْحَانَ اللَّهِ", "count": 33},
  {"id": 2, "title": "الْحَمْدُ لِلَّهِ", "count": 33},
  {"id": 3, "title": "اللَّهُ أَكْبَرُ", "count": 33},
 
  {"id": 4, "title": "لَا حَوْلَ وَلَا قُوَّةَ إِلَّا بِاللَّهِ", "count": 33},
  {"id": 5, "title": "أَسْتَغْفِرُ اللَّهَ", "count": 33},
  {"id": 6, "title": "سُبْحَانَ اللَّهِ وَبِحَمْدِهِ", "count": 33},
  {"id": 7, "title": "سُبْحَانَ اللَّهِ الْعَظِيمِ", "count": 33},
  {"id": 8, "title": "اللَّهُمَّ صَلِّ عَلَى مُحَمَّدٍ", "count": 33},
  {"id": 9, "title": "حَسْبِيَ اللَّهُ وَنِعْمَ الْوَكِيلُ", "count": 33},
  {
    "id": 10,
    "title":
    "لَا إِلَٰهَ إِلَّا اللَّهُ وَحْدَهُ لَا شَرِيكَ لَهُ، لَهُ الْمُلْكُ وَلَهُ الْحَمْدُ وَهُوَ عَلَىٰ كُلِّ شَيْءٍ قَدِيرٌ",
    "count": 33,
  },
];
