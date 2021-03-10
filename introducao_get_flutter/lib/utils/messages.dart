import 'package:get/get.dart';

class Messages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'title': 'Contacts',
          'Apptitle': 'First App',
        },
        'pt_BR': {
          'title': 'Contatos',
          'Apptitle': 'Primeiro App',
        }
      };
}
