class TypesRepository {
  final List<String> _types = [
    'World',
    'Planet',
    'Microverse',
    'Space station',
    'TV',
    'Resort',
    'Fantasy town',
    'Dream',
    'Dimension',
    'Menagerie',
    'Game',
    'Customs',
    'Daycare',
    'Dwarf planet (Celestial Dwarf)',
    'Miniverse',
    'Teenyverse',
    'Box',
    'Spacecraft',
    'Artificially generated world',
    'Machine',
    'Arcade',
    'unknown',
    'Spa',
    'Quadrant',
    'Quasar',
    'Mount',
    'Liquid',
    'Convention',
    'Woods',
    'Diegesis',
    'Non-Diegetic Alternative Reality',
    'Nightmare',
    'Asteroid',
    'Acid Plant',
    'Reality',
    'Death Star',
    'Base',
  ];

  void sortList() {
    _types.sort((a, b) {
      return a.compareTo(b);
    });
  }

  List<String> getTypes() {
    sortList();
    return _types;
  }
}
