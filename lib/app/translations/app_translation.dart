import 'en_US/en_us_translations.dart';
import 'hi_IN/hi_in_translations.dart';
import 'vi_VN/vi_vn_translations.dart';

abstract class AppTranslation {
  static Map<String, Map<String, String>> translations = {
    'en': enUs,
    'vi': viVn,
    'hi': hiIN,
  };
}
