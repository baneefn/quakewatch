import 'gempa.dart';

class InfoGempa {
  final List<Gempa> gempa;

  InfoGempa.fromJson(Map<String, dynamic> json)
      : gempa = (json['gempa'] as List).map((i) => Gempa.fromJson(i)).toList();

  @override
  String toString() {
    return 'InfoGempa{gempa: $gempa}';
  }
}
