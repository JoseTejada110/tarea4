

import 'dart:io';

class Environment {
  static String apiUrl = Platform.isAndroid ? 'http://10.0.0.8:3000/api' : 'http://localhost:3000/api';
}