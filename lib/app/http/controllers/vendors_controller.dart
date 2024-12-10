import 'package:vania/vania.dart';
import 'package:tugas_rest/app/models/vendors.dart';

class VendorController extends Controller {
  Future<Response> index() async {
    final vendor = await Vendors().query().get();
    return Response.json({'message': 'Data ditemukan', 'data': vendor});
  }

  Future<Response> store(Request request) async {
    await Vendors().query().insert({
      'vend_id' : request.body['vend_id'],
      'vend_name' : request.body['vend_name'],
      'vend_address' : request.body['vend_address'],
      'vend_kota' : request.body['vend_kota'],
      'vend_state' : request.body['vend_state'],
      'vend_zip' : request.body['vend_zip'],
      'vend_country' : request.body['vend_country'],
    });

    return Response.json({'message': 'Data berhasil disimpan'});
  }

  Future<Response> show(String id) async {
    final vendor = await Vendors().query().where('vend_id', '=', id).first();
    return Response.json({'message': 'Data ditemukan', 'data': vendor});
  }

  Future<Response> update(Request request, String id) async {
    await Vendors().query().where('vend_id', '=', id).update({
      'vend_name': request.body['vend_name'],
      'vend_address': request.body['vend_address'],
      'vend_kota': request.body['vend_kota'],
      'vend_state': request.body['vend_state'],
      'vend_zip': request.body['vend_zip'],
      'vend_country': request.body['vend_country'],
    });

    return Response.json({'message': 'Data berhasil diupdate'});
  }

  Future<Response> destroy(String id) async {
    await Vendors().query().where('vend_id', '=', id).delete();
    return Response.json({'message': 'Data berhasil dihapus'});
  }
}

final VendorController vendorController = VendorController();
