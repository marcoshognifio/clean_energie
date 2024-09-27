import 'dart:io';
import 'package:pdf/widgets.dart' ;
import 'package:pdf/pdf.dart';
import 'package:path_provider/path_provider.dart';


 textPdf(){
  final pdf = Document();
  pdf.addPage(
    Page(
        build: (context) =>Container()
    )
  );
  return saveDocument('my_example.pdf',pdf);
 }


 Future<File> saveDocument(String name, Document pdf) async{
  final bytes = await pdf.save();
  final dir = await getApplicationDocumentsDirectory();
  print('${dir.path}/$name');
  final file = File('${dir.path}/$name');
  await file.writeAsBytes(bytes);
  return file;
 }



