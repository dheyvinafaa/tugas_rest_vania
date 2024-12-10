import 'package:tugas_rest/app/models/customers.dart';

Map<String, dynamic> authConfig = {
  'guards': {
    'default': {
      'provider': Customers(),
    }
  }
};
