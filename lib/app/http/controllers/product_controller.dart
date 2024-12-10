import 'package:vania/vania.dart';
import 'package:tugas_rest/app/models/products.dart';

class ProductController extends Controller {
  Future<Response> index() async {
    final product = await Products().query().get();
    return Response.json({'message': 'Data ditemukan', 'data': product});
  }

  Future<Response> store(Request request) async {
    await Products().query().insert({
      'prod_id': request.body['prod_id'],
      'vend_id': request.body['vend_id'],
      'prod_name': request.body['prod_name'],
      'prod_price': request.body['prod_price'],
      'prod_desc': request.body['prod_desc'],
    });

    return Response.json({'message': 'Data berhasil disimpan'});
  }

  Future<Response> show(String id) async {
    final product = await Products().query().where('prod_id', '=', id).first();
    return Response.json({'message': 'Data ditemukan', 'data': product});
  }

  Future<Response> update(Request request, String id) async {
    await Products().query().where('prod_id', '=', id).update({
      'vend_id': request.body['vend_id'],
      'prod_name': request.body['prod_name'],
      'prod_price': request.body['prod_price'],
      'prod_desc': request.body['prod_desc']
    });

    return Response.json({'message': 'Data berhasil diupdate'});
  }

  Future<Response> destroy(String id) async {
    await Products().query().where('prod_id', '=', id).delete();
    return Response.json({'message': 'Data berhasil dihapus'});
  }
}

final ProductController productController = ProductController();
