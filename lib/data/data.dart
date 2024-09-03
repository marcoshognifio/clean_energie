
import 'package:path/path.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

List<Map<String,dynamic>> listTypeProject = [
  {
    'label' : 'Ménage',
    'value' : 1
  },
  {
    'label' : 'Boutique',
    'value' : 2
  },
  {
    'label' : 'Résidence',
    'value' : 3
  },
];


class DatabaseHelper {
  final databaseName = 'database.db';
  Database? _database;

  Future get database async {
    if (_database != null) {
      return _database;
    }
    else {
      _database = await initDB();
      return _database;
    }
  }

  Future<Database> initDB() async {
    print('---------INITIALISATION DB-----------');

    final dbPath = await getDatabasesPath();
    final path = join(dbPath, databaseName);
    return await openDatabase(path, version: 1, onCreate: createDB);
  }

  Future createDB(Database db, int version) async {
    print('---------CREATE DB-----------');

    await db.execute('''CREATE TABLE IF NOT EXISTS projets(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      nom TEXT NOT NULL,
      date Date Not NULL,
      lieu TEXT NOT NULL,
      type Date Not NULL,
      client TEXT NOT NULL,
      adresse Date Not NULL,
      telephone TEXT NOT NULL,
      email Not NULL,
      manager TEXT NOT NULL
      )'''
    );
    print('Batabase is create of success');
  }

  Future addProject(Map<String, dynamic> project) async {
    final db = await database;
    db.insert("projets", project);
    print('add project success');
  }
}

late Group listObjectsGroup;
class Group {
  List list ;
  List<List> groupList =[];
  Group(this.list);

  Future<List> getGroupList(int s) async{

    List<List> result = [];
    int n = list.length;

    int a = s,b=0;
    int c = n ~/ a ;
    List E;
    if(c>0){
      for(int i=0;i<c;i++){
        E=[];
        for(int j =0;j<a;j++){

          E.add(Map.from(list[b]));
          b++;
        }
        result.add(E);
      }
    }

    c = c*a;
    n = n-c;
    E = [];
    for(int i=0;i<n;i++){
      E.add(Map.from(list[b]));
      b++;
    }
    result.add(E);
    groupList = result;
    return [] ;
  }
}

  List<Map> listObjects =   [
      {
      'name' : "Lampe",
      'image' : 'assets/RESSOURCES2/app1.png',
      },
      {
        'name' : "Frigo",
        'image' : 'assets/RESSOURCES2/app2.png',
      },
      {
        'name' : "Lampadaire",
        'image' : 'assets/RESSOURCES2/app3.png',
      },
      {
        'name' : "Television",
        'image' : 'assets/RESSOURCES2/app4.png',
      },
      {
        'name' : "",
        'image' : 'assets/RESSOURCES2/app5.png',
      },
      {
        'name' : "Aloe Vera",
        'image' : 'assets/RESSOURCES2/app6.png',
      },
      {
        'name' : "Lampe",
        'image' : 'assets/RESSOURCES2/app7.png',
      },
      {
        'name' : "Frigo",
        'image' : 'assets/RESSOURCES2/app8.png',
      },
      {
        'name' : "Lampadaire",
        'image' : 'assets/RESSOURCES2/app9.png',
      },
      {
        'name' : "Television",
        'image' : 'assets/RESSOURCES2/app10.png',
      },
      {
        'name' : "",
        'image' : 'assets/RESSOURCES2/app11.png',
      },
      {
        'name' : "Aloe Vera",
        'image' : 'assets/RESSOURCES2/app12.png',
      },
      {
        'name' : "Lampe",
        'image' : 'assets/RESSOURCES2/app13.png',
      },
      {
        'name' : "Frigo",
        'image' : 'assets/RESSOURCES2/app2.png',
      },
      {
        'name' : "Lampadaire",
        'image' : 'assets/RESSOURCES2/app3.png',
      },
      {
        'name' : "Television",
        'image' : 'assets/RESSOURCES2/app4.png',
      },
      {
        'name' : "",
        'image' : 'assets/RESSOURCES2/app5.png',
      },
      {
        'name' : "Aloe Vera",
        'image' : 'assets/RESSOURCES2/app6.png',
      },

  ];

class KeepIndex {
  int value;
  KeepIndex(this.value);
}



//////////////////// BilanPage data ///////////////////////////

List<String> listColumn = ['N°','Equipements','Qté','Puissance','Rend','T-diurne',
  'T-noctur','Coef Dé'];
