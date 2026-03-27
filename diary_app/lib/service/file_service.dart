import 'dart:io';

import 'package:path_provider/path_provider.dart';

class DiaryEntry {
  final String path;      // 일기 txt 파일 저장경로
  final String date;      // 날짜
  final String time;      // 시간
  final String title;     // 일기 제목

  const DiaryEntry({
    required this.path,
    required this.date,
    required this.time,
    required this.title,
  });
}

// 파일 서비스
// - 파일 저장
// - 일기 목록
// - 일기 조회
// - 날짜 변경
// - 파일 삭제
const _seperator = '---DIARY---';
class FileService {
  // 앱 문서 디렉토리 경로 반환
  Future<String> getDirPath() async {
    final dir = await getApplicationDocumentsDirectory();
    return dir.path;
  }

  // 제목, 내용을 파일에 저장할 형식으로 변환
  String _serialize(String title, String content)
    => '$title\n$_seperator\n$content';

  /// 일기 저장
  Future<void> saveDiaryForDate(
    String date, String title, String content 
  ) async {
    final dirPath = await getDirPath();
    final now = DateTime.now();
    // 시간 포맷 
    // - 052005 : 5시20분5초
    // - 110535 : 11시5분35초
    final t = '${now.hour.toString().padLeft(2, '0')}'
              '${now.minute.toString().padLeft(2, '0')}'
              '${now.second.toString().padLeft(2, '0')}'
              ;
    // 파일명 : 2026-03-27_131022.txt
    final file = File('$dirPath/${date}_$t.txt');
    await file.writeAsString(_serialize(title, content));
  }


}
