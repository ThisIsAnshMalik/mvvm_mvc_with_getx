import 'package:get/get_navigation/src/root/internacionalization.dart';

class Languages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'email_hint': 'Enter email',
          'internet_exception':
              'We are unable to show result.\nPlease check yout network conection',
        },
        'hi_ID': {
          'email_hint': ' ईमेल दर्ज करें ',
          'internet_exception':
              'हम परिणाम दिखाने में असमर्थ हैं।\nकृपया अपने नेटवर्क कनेक्शन की जाँच करें'
        }
      };
}
