import 'package:tugas_rest/app/models/user.dart';
import 'package:vania/vania.dart';

class AuthController extends Controller {
  Future<Response> login(Request request) async {
    request.validate({
      'email': 'required|email',
      'password': 'required|max_length:255'
    });

    final Map<String, dynamic>? user = await User()
        .query()
        .where('email', '=', request.input('email'))
        .first();

    if (user == null) {
      return Response.json(
          {'success': false, 'message': 'Email not found'}, 404);
    }

    if (!Hash().verify(request.input('password'), user['password'])) {
      return Response.json(
          {'success': false, 'message': 'Password not match'}, 400);
    }

    Map<String, dynamic> token = await Auth()
        .login(user)
        .createToken(expiresIn: Duration(days: 1), withRefreshToken: true);

    return Response.json({
      'success': true,
      'message': 'Login success',
      'data': token,
    });
  }

  Future<Response> register(Request request) async {
    request.validate({
      'name': 'required',
      'email': 'required|email',
      'password': 'required|confirmed',
    });

    final user = await User().query().insert({
      'name': request.input('name'),
      'email': request.input('email'),
      'password': Hash().make(request.input('password')),
    });

    return Response.json({
      'success': true,
      'message': 'Register success',
    });
  }
}

final AuthController authController = AuthController();
