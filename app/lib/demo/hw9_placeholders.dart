/// Temporary HW9 demo art — strip / replace when wiring real shop + siege UI.
abstract final class Hw9Placeholders {
  static const art = 'assets/art';

  /// Left hand — starter-looking star cards (not shop catalog).
  static const battlefieldStars = [
    '$art/star_cards/newhope_starcard.png',
    '$art/star_cards/suppresionfire_starcard.png',
    '$art/star_cards/shelling_starcard.png',
  ];

  /// Right hand — playable unit card faces.
  static const battlefieldUnits = [
    '$art/star_cards/infantry_starcard.png',
    '$art/star_cards/xwing_starcard.png',
    '$art/star_cards/snowspeeder_starcard.png',
  ];

  /// Briefing enemy models (villains / hostiles).
  static const briefingEnemies = [
    '$art/units/stormtrooper_model.png',
    '$art/units/atst_model.png',
    '$art/units/tiefighter_model.png',
    '$art/units/probedroid_model.png',
    '$art/units/speederbike_model.png',
    '$art/units/bobafett_model.png',
  ];

  /// Shop tiles — non-starter catalog cards (locked look for demo).
  static const shopNonStarters = [
    '$art/star_cards/bactabomb_starcard.png',
    '$art/star_cards/blastercannon_starcard.png',
    '$art/star_cards/lukeskywalker_starcard.png',
    '$art/star_cards/hansolo_starcard.png',
    '$art/star_cards/chewbacca_starcard.png',
    '$art/star_cards/iontorpedo_starcard.png',
    '$art/star_cards/orbitalbombing_starcard.png',
    '$art/star_cards/thermalgrenade_starcard.png',
  ];

  static const shopLabels = [
    'Bacta Bomb',
    'Blaster Cannon',
    'Luke Skywalker',
    'Han Solo',
    'Chewbacca',
    'Ion Torpedo',
    'Orbital Strike',
    'Thermal Detonator',
  ];

  /// Starter deck row thumbs (Decks list).
  static const starterDeckThumbs = [
    '$art/star_cards/newhope_starcard.png',
    '$art/star_cards/baseshield_starcard.png',
    '$art/star_cards/suppresionfire_starcard.png',
    '$art/star_cards/shelling_starcard.png',
    '$art/star_cards/trap_starcard.png',
  ];

  /// Deck editor — cards currently in the deck.
  static const deckEditorInDeck = [
    '$art/star_cards/newhope_starcard.png',
    '$art/star_cards/baseshield_starcard.png',
    '$art/star_cards/suppresionfire_starcard.png',
    '$art/star_cards/shelling_starcard.png',
    '$art/star_cards/trap_starcard.png',
    '$art/star_cards/ionblast_starcard.png',
    '$art/star_cards/squadleader_starcard.png',
    '$art/star_cards/warveteran_starcard.png',
    '$art/star_cards/conversion_starcard.png',
  ];

  /// Deck editor — owned pool (also starters for demo).
  static const deckEditorOwned = [
    '$art/star_cards/newhope_starcard.png',
    '$art/star_cards/baseshield_starcard.png',
    '$art/star_cards/suppresionfire_starcard.png',
    '$art/star_cards/shelling_starcard.png',
    '$art/star_cards/trap_starcard.png',
    '$art/star_cards/ionblast_starcard.png',
    '$art/star_cards/squadleader_starcard.png',
    '$art/star_cards/warveteran_starcard.png',
    '$art/star_cards/conversion_starcard.png',
    '$art/star_cards/elitetraining_starcard.png',
    '$art/star_cards/augmentation_starcard.png',
    '$art/star_cards/neworder_starcard.png',
  ];
}
