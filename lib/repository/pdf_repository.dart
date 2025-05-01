import 'package:ccw/models/pdf_item.dart';
import 'package:dio/dio.dart';
import '../models/title_model.dart';

class PdfRepository {
  final Dio _dio = Dio();
  final String _baseUrl = 'https://pocketbase-5i4fn3.chbk.app';

  // دریافت لیست عنوان‌ها (pdf_titles)
  Future<List<PdfTitle>> fetchTitles() async {
    try {
      final response = await _dio.get('$_baseUrl/api/collections/pdf_titles/records');
      if (response.statusCode == 200) {
        List<dynamic> items = response.data['items'];
        return items.map((item) => PdfTitle.fromJson(item)).toList();
      } else {
        throw Exception('Failed to load titles');
      }
    } catch (e) {
      throw Exception('Error fetching titles: $e');
    }
  }

  // دریافت لیست آیتم‌های مربوط به یک عنوان خاص (pdf_items)
  Future<List<PdfItem>> fetchItemsByTitleId(String titleId) async {
    try {
      final response = await _dio.get(
        '$_baseUrl/api/collections/pdf_items/records',
        queryParameters: {
          'filter': 'title="$titleId"',
        },
      );

      if (response.statusCode == 200) {
        List<dynamic> items = response.data['items'];
        return items.map((item) => PdfItem.fromJson(item)).toList();
      } else {
        throw Exception('Failed to load items');
      }
    } catch (e) {
      throw Exception('Error fetching items: $e');
    }
  }
}
