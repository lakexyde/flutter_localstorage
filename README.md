# flutter_localstorage

A tiny package for persistent storage in Flutter Apps.

## Getting Started

For help getting started with Flutter, view our online [documentation](https://flutter.io/).

- Add  ```flutter_localstorage``` as a dependency in your ```pubspec.yaml``` file.

```
dependencies:
    ...
    flutter_localstorage: 
        git: git://github.com/lakexyde/flutter_localstorage.git
```

## Usage

- Import the package in your file
```
import 'package:flutter_localstorage/flutter_localstorage.dart';
```

- Create a new instance of the ```LocalStorage``` class
```
LocalStorage localStorage = new LocalStorage;
```

- Get an item
```
String myName = localStorage.getItem("name");
```

## Available Methods

- ```getItem``` : Gets a key.
```
localStorage.getItem("name");
```
- ```setItem``` : Sets an item
```
localStorage.setItem("name", "Olalekan Oladipupo");
```
- ```clear ```: Clears all items
```
localStorage.clear();
```
- ```removeItem ```: Removes an item
```
localStorage.removeItem("name");
```
- ```length ```: Returns the total number of items
```
localStorage.length;
```

- Quick tip:

To store a ```Map```, you will need to convert it to a string before you save.

```
import 'dart:io';

...

Map<String, String> myData = {"name": "Olalekan Oladipupo"}

localStorage.setItem("user", json.encode(myData));

// To get back myData as a Map
Map<String, String> myDataAgain = json.encode(localStorage.getItem("user"));

print(myDataAgain['name']); // Should print Olalekan Oladipupo
```

## Dependencies
- ```path_provider```

## TODO
- Improve documentation
- Provide asynchronous operations
- Add testing
- and more.




