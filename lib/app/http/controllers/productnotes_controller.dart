import 'package:vania/vania.dart';
import 'package:tugas_rest/app/models/productsnotes.dart';

class ProductNotesController extends Controller {
  Future<Response> index() async {
    final productNotes = await Productnotes().query().get();
    return Response.json({'message': 'Data ditemukan', 'data': productNotes});
  }

  Future<Response> store(Request request) async {
    await Productnotes().query().insert({
      'note_id': request.body['note_id'],
      'prod_id': request.body['prod_id'],
      'note_date': request.body['note_date'],
      'note_text': request.body['note_text'],
    });

    return Response.json({'message': 'Data berhasil disimpan'});
  }

  Future<Response> show(String id) async {
    final productNotes = await Productnotes().query().where('note_id', '=', id).first();
    return Response.json({'message': 'Data ditemukan', 'data': productNotes});
  }

  Future<Response> update(Request request, String id) async {
    await Productnotes().query().where('note_id', '=', id).update({
      'prod_id': request.body['prod_id'],
      'note_date': request.body['note_date'],
      'note_text': request.body['note_text'],
    });

    return Response.json({'message': 'Data berhasil diupdate'});
  }

  Future<Response> destroy(String id) async {
    await Productnotes().query().where('note_id', '=', id).delete();
    return Response.json({'message': 'Data berhasil dihapus'});
  }
}

final ProductNotesController productNotesController = ProductNotesController();
