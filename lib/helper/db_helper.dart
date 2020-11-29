import 'dart:io';

import 'package:WReminder/model/word.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static DatabaseHelper _databaseHelper; // Singleton DatabaseHelper
  static Database _database; // Singleton Database

  String wordTable = 'word_table';
  String colId = 'id';
  String colWord = 'word';
  String colTranslatedWord = 'translatedWord';
  String colLanguage = 'language';
  String colTranslatedLanguage = 'translatedTanguage';
  String colPriority = 'priority';
  String colColor = 'color';

  DatabaseHelper._createInstance(); // Named constructor to create instance of DatabaseHelper

  factory DatabaseHelper() {
    if (_databaseHelper == null) {
      _databaseHelper = DatabaseHelper
          ._createInstance(); // This is executed only once, singleton object
    }
    return _databaseHelper;
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database;
  }

  Future<Database> initializeDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'word_reminder.db';

    var notesDatabase =
        await openDatabase(path, version: 1, onCreate: _createDb);
    return notesDatabase;
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute(
        'CREATE TABLE $wordTable($colId INTEGER PRIMARY KEY AUTOINCREMENT, $colWord TEXT, '
        '$colTranslatedWord TEXT,$colLanguage TEXT,$colTranslatedLanguage TEXT, $colPriority INTEGER, $colColor INTEGER)');
  }

  Future<List<Map<String, dynamic>>> getWordMapList() async {
    Database db = await this.database;
    var result = await db.query(wordTable, orderBy: '$colPriority ASC');
    return result;
  }

  Future<int> insertWord(Word word) async {
    Database db = await this.database;
    var result = await db.insert(wordTable, word.toMap());
    return result;
  }

  // Update Operation: Update a Note object and save it to database
  Future<int> updateNote(Word word) async {
    var db = await this.database;
    var result = await db.update(wordTable, word.toMap(),
        where: '$colId = ?', whereArgs: [word.id]);
    return result;
  }

  // Delete Operation: Delete a Note object from database
  Future<int> deleteWord(int id) async {
    var db = await this.database;
    int result =
        await db.rawDelete('DELETE FROM $wordTable WHERE $colId = $id');
    return result;
  }

  Future<int> getCount() async {
    Database db = await this.database;
    List<Map<String, dynamic>> x =
        await db.rawQuery('SELECT COUNT (*) from $wordTable');
    int result = Sqflite.firstIntValue(x);
    return result;
  }

  Future<List<Word>> getWordList() async {
    var wordMapList = await getWordMapList();
    int count = wordMapList.length;
    List<Word> wordList = List<Word>();
    for (int i = 0; i < count; i++) {
      wordList.add(Word.fromMapObject(wordMapList[i]));
    }
    return wordList;
  }
}
