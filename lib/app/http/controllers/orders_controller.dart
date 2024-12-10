import 'package:vania/vania.dart';
import 'package:tugas_rest/app/models/orders.dart';

class OrdersController extends Controller {
  Future<Response> index() async {
    final orders = await Orders().query().get();
    return Response.json({'message': 'Data ditemukan', 'data': orders});
  }

  Future<Response> store(Request request) async {
    await Orders().query().insert({
      'order_num': request.body['order_num'],
      'order_date': request.body['order_date'],
      'cust_id': request.body['cust_id'],
    });

    return Response.json({'message': 'Data berhasil disimpan'});
  }

  Future<Response> show(int id) async {
    final order = await Orders().query().where('order_num', '=', id).first();
    return Response.json({'message': 'Data ditemukan', 'data': order});
  }

  Future<Response> update(Request request, int id) async {
    await Orders().query().where('order_num', '=', id).update({
      'order_date': request.body['order_date'],
      'cust_id': request.body['cust_id'],
    });

    return Response.json({'message': 'Data berhasil diupdate'});
  }

  Future<Response> destroy(int id) async {
    await Orders().query().where('order_num', '=', id).delete();
    return Response.json({'message': 'Data berhasil dihapus'});
  }
}

final OrdersController orderController = OrdersController();
