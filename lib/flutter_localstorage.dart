library flutter_localstorage;

import 'dart:async';
import 'dart:io';
import 'dart:convert';

import 'package:path_provider/path_provider.dart';

class LocalStorage {
  Map<String, dynamic> localStorageData = {};

  LocalStorage() {
    loadData();
  }
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return new File('$path/localStorage.db');
  }

  Future<File> _internalSaveData() async{
    final file = await _localFile;
    final data = json.encode(localStorageData);
    print(data);

    return file.writeAsString('$data');

  }

  void loadData() async{
    try {
      final file = await _localFile;

      bool exists = await file.exists();

      if(exists){
          // Read the file
        String contents = await file.readAsString();

        localStorageData =  json.decode(contents);
      } else {
        file.writeAsString(json.encode(localStorageData));
      }

      
    } catch (e) {
      // If we encounter an error, return 0
      print("Error here: $e");
    }
  }

  String getItem(name){
    if(localStorageData.containsKey(name)){
      return localStorageData[name];
    }
    return null;

  }

  void setItem(name, value){
    localStorageData[name] = value;
    _internalSaveData();
  }

  void removeItem(name){
    if(localStorageData.containsKey(name)){
      localStorageData.remove(name);
      _internalSaveData();
    }
  }

  void clear(){
    localStorageData = {};
    _internalSaveData();
  }

  int get length => localStorageData.keys.length;
}
