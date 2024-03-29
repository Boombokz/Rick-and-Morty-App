class DimensionsRepository {
  final List<String> _dimensions = [
    'Dimension C-137',
    'unknown',
    'Post-Apocalyptic Dimension',
    'Replacement Dimension',
    'Cronenberg Dimension',
    'Fantasy Dimension',
    'Dimension 5-126',
    'Testicle Monster Dimension',
    'Cromulon Dimension',
    'Dimension C-500A',
    'Dimension K-83',
    'Dimension J19ζ7',
    'Eric Stoltz Mask Dimension',
    'Evil Rick\'s Target Dimension',
    'Giant Telepathic Spiders Dimension',
    'Unknown dimension',
    'Dimension K-22',
    'Dimension D-99',
    'Dimension D716',
    'Dimension D716-B',
    'Dimension D716-C',
    'Dimension J-22',
    'Dimension C-35',
    'Pizza Dimension',
    'Phone Dimension',
    'Chair Dimension',
    'Fascist Dimension',
    'Fascist Shrimp Dimension',
    'Fascist Teddy Bear Dimension',
    'Wasp Dimension',
    'Tusk Dimension',
    'Magic Dimension',
    'Merged Dimension',
  ];

  void sortList() {
    _dimensions.sort((a, b) {
      return a.compareTo(b);
    });
  }

  List<String> getTypes() {
    sortList();
    return _dimensions;
  }
}
