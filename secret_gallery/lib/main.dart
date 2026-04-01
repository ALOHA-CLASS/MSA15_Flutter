import 'package:flutter/material.dart';
import 'package:secret_gallery/pages/album_list_page.dart';
import 'package:secret_gallery/pages/gallery_picker_page.dart';
import 'package:secret_gallery/pages/lock_page.dart';
import 'package:secret_gallery/pages/photo_detail_page.dart';
import 'package:secret_gallery/pages/photo_list_page.dart';
import 'package:secret_gallery/pages/settings_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '시크릿 갤러리',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      initialRoute: '/lock',
      routes: {
        '/lock' : (context) => LockPage(),              // 잠금화면
        '/album' : (context) => AlbumListPage(),        // 앨범목록
        '/photo' : (context) => PhotoListPage(),        // 사진목록
        '/picker' : (context) => GalleryPickerPage(),   // 사진선택
        '/detail' : (context) => PhotoDetailPage(),     // 사진상세
        '/setting' : (context) => SettingsPage(),       // 설정화면
      },
    );
  }
}
