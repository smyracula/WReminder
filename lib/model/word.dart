class Word {
  int _id;
  String _word;
  String _translatedWord;
  String _language;
  String _translatedLanguage;
  int _priority, _color;

  Word(this._word, this._translatedWord, this._language,
      this._translatedLanguage, this._priority, this._color);

  Word.withId(this._id, this._word, this._translatedWord, this._language,
      this._translatedLanguage, this._priority, this._color);

  int get id => _id;

  String get word => _word;

  String get translatedWord => _translatedWord;

  String get language => _language;

  String get translatedLanguage => _translatedLanguage;

  int get priority => _priority;

  int get color => _color;

  set word(String newWord) {
    if (newWord.length <= 255) {
      this._word = newWord;
    }
  }

  set translatedWord(String newTranslatedWord) {
    if (newTranslatedWord.length <= 255) {
      this._translatedWord = newTranslatedWord;
    }
  }

  set language(String newLanguage) {
    if (newLanguage.length <= 255) {
      this._language = newLanguage;
    }
  }

  set translatedLanguage(String newTranslatedLanguage) {
    if (newTranslatedLanguage.length <= 255) {
      this._translatedLanguage = newTranslatedLanguage;
    }
  }

  set priority(int newPriority) {
    if (newPriority >= 1 && newPriority <= 3) {
      this._priority = newPriority;
    }
  }

  set color(int newColor) {
    if (newColor >= 0 && newColor <= 9) {
      this._color = newColor;
    }
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = _id;
    }
    map['word'] = _word;
    map['translatedWord'] = _translatedWord;
    map['language'] = _language;
    map['translatedLanguage'] = _translatedLanguage;
    map['priority'] = _priority;
    map['color'] = _color;

    return map;
  }

  // Extract a Note object from a Map object
  Word.fromMapObject(Map<String, dynamic> map) {
    this._id = map['id'];
    this._word = map['word'];
    this._translatedWord = map['translatedWord'];
    this._language = map['language'];
    this._translatedLanguage = map['translatedLanguage'];
    this._priority = map['priority'];
    this._color = map['color'];
  }
}
