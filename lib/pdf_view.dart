import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfView extends StatelessWidget {
  PdfView({Key? key}) : super(key: key);
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SfPdfViewer.network(
        'https://link.springer.com/content/pdf/10.1007/978-981-19-9932-1_1?pdf=chapter%20toc',
        key: _pdfViewerKey,
      ),
      appBar: AppBar(
        
        actions: [
          IconButton(
            icon: const Icon(
              Icons.bookmark,
              color: Colors.white,
              semanticLabel: 'Bookmark',
            ),
            onPressed: () {
              _pdfViewerKey.currentState?.openBookmarkView();
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.download,
              color: Colors.red,
              semanticLabel: 'download',
            ),
            onPressed: () async {
              await downloadimagessss();
            },
          ),
        ],
      ),
    );
  }
}

downloadimagessss() async {
  List<String> imageList = ["car.jpg", "cat.jpg", "can.jpg"];

  FirebaseStorage storage = FirebaseStorage.instance;

  var storageRef = storage.ref();

  final appDocDir = await getApplicationDocumentsDirectory();

  for (String imageName in imageList) {
    final islandRef = storageRef.child("$imageName");

    final filePath = "${appDocDir.absolute}/$imageName";

    final file = File(filePath);
    if (file.existsSync()) {
      await file.create(recursive: true);
    }

    final downloadTask = islandRef.writeToFile(file);

    downloadTask.snapshotEvents.listen((taskSnapshot) {
      switch (taskSnapshot.state) {
        case TaskState.running:
          print('ruuuuuuuuuuuuuuuuuuuuuun');
          break;
        case TaskState.paused:
          // TODO: Handle this case.
          break;
        case TaskState.success:
          print('successsuccesssuccesssuccesssuccess');
          break;
        case TaskState.canceled:
          // TODO: Handle this case.
          break;
        case TaskState.error:
          print('errorerrorerrorerrorerrorerrorerror');
          break;
      }
    });
  }
}
