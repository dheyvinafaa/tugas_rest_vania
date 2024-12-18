import 'package:vania/vania.dart';

class CreatePersonalAcccessTokensTable extends Migration {

  @override
  Future<void> up() async{
   super.up();
   await createTableNotExists('personal_acccess_tokens', () {
      id();
      tinyText('name');
      bigInt('tokenable_id');
      string('token');
      timeStamp('last_used_at', nullable: true);
      timeStamps();
    });
  }
  
  @override
  Future<void> down() async {
    super.down();
    await dropIfExists('personal_acccess_tokens');
  }
}
