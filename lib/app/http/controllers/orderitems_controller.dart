import 'package:vania/vania.dart';
import 'package:tugas_rest/app/models/Orderitems.dart';

class OrderitemsController extends Controller {
  Future<Response> index() async {
    final orderitems = await Orderitems().query().get();
    return Response.json({'message': 'Data ditemukan', 'data': orderitems});
  }

  Future<Response> store(Request request) async {
    await Orderitems().query().insert({
      'order_item': request.body['order_item'],
      'order_num': request.body['order_num'],
      'prod_id': request.body['prod_id'],
      'quantity': request.body['quantity'],
      'size': request.body['size'],
    });

    return Response.json({'message': 'Data berhasil disimpan'});
  }

  Future<Response> show(int id) async {
    final orderitems = await Orderitems().query().where('order_item', '=', id).first();
    return Response.json({'message': 'Data ditemukan', 'data': orderitems});
  }

  Future<Response> update(Request request, int id) async {
    await Orderitems().query().where('order_item', '=', id).update({
      'order_num': request.body['order_num'],
      'prod_id': request.body['prod_id'],
      'quantity': request.body['quantity'],
      'size': request.body['size'],
    });

    return Response.json({'message': 'Data berhasil diupdate'});
  }

  Future<Response> destroy(int id) async {
    await Orderitems().query().where('order_item', '=', id).delete();
    return Response.json({'message': 'Data berhasil dihapus'});
  }
}

final OrderitemsController orderitemsController = OrderitemsController();
