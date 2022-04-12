import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';

import '../../models/top_news_headline_model/article_model.dart';

class HiveHelper {
  static List getAll({required Box box}) {
    try {
      return box.values.toList();
    } catch (e) {
      debugPrint(e.toString());
      return [];
    }
  }

  static Future<void> addToDb({required Box box, required String title, required dynamic data}) async {
    try {
      await box.put(title, data);
     Article article= await  box.get(title);
      print(article.title);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  static Future<void> removeFromDb({required Box box, required String title}) async {
    try {
      await box.delete(title);
    } catch (e) {
      debugPrint(e.toString());
    }
  }


  static Future<void> deleteBox(Box box) async {
    try {
      await box.clear();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  static Future<void> deleteBoxFromDisk(Box box) async {
    try {
      await box.deleteFromDisk();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  static Future<Box?> openBox(String boxName) async {
    try {
      return await Hive.openBox(boxName);
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  static Future<void> closeBox(Box box) async {
    try {
      if (box.isOpen) {
        await box.close();
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
