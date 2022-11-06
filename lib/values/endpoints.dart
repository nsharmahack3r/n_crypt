class ApiEndPoints{
  static const String _baseUrl = 'http://192.168.31.170:5500';
  static const String _auth = '$_baseUrl/auth';

  static const String login = '$_auth/login';
  static const String signup = '$_auth/signup';

}