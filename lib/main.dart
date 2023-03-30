import 'package:book2/pdf_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
 
 // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const BooksApp());
}

class BooksApp extends StatelessWidget {
  const BooksApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Book',
          theme: ThemeData(
            backgroundColor: Colors.blue,
            textTheme: const TextTheme(
              headline1: TextStyle(
                color: Colors.white,
              ),
            ),
            primarySwatch: Colors.blue,
          ),
          home: PdfView(),
          
        );
      },
    );
  }
}
