import 'package:vania/vania.dart';
import 'package:tugas_rest/app/http/controllers/customer_controller.dart';
import 'package:tugas_rest/app/http/controllers/orders_controller.dart';
import 'package:tugas_rest/app/http/controllers/orderitems_controller.dart';
import 'package:tugas_rest/app/http/controllers/product_controller.dart';
import 'package:tugas_rest/app/http/controllers/productnotes_controller.dart';
import 'package:tugas_rest/app/http/controllers/vendors_controller.dart';

class ApiRoute implements Route {
  @override
  void register() {
    Router.basePrefix('api');
    
    Router.get("/customer", customerController.index);
    Router.get("/customer/{id}", customerController.show);
    Router.post("/customer", customerController.store);
    Router.put("/customer/{id}", customerController.update);
    Router.delete("/customer/{id}", customerController.destroy);

    Router.get("/order", orderController.index);
    Router.get("/order/{id}", orderController.show);
    Router.post("/order", orderController.store);
    Router.put("/order/{id}", orderController.update);
    Router.delete("/order/{id}", orderController.destroy);

    Router.get("/orderitems", orderitemsController.index);
    Router.get("/orderitems/{id}", orderitemsController.show);
    Router.post("/orderitems", orderitemsController.store);
    Router.put("/orderitems/{id}", orderitemsController.update);
    Router.delete("/orderitems/{id}", orderitemsController.destroy);

    Router.get("/product", productController.index);
    Router.get("/product/{id}", productController.show);
    Router.post("/product", productController.store);
    Router.put("/product/{id}", productController.update);
    Router.delete("/product/{id}", productController.destroy);

    Router.get("/productnotes", productNotesController.index);
    Router.get("/productnotes/{id}", productNotesController.show);
    Router.post("/productnotes", productNotesController.store);
    Router.put("/productnotes/{id}", productNotesController.update);
    Router.delete("/productnotes/{id}", productNotesController.destroy);

    Router.get("/vendors", vendorController.index);
    Router.get("/vendors/{id}", vendorController.show);
    Router.post("/vendors", vendorController.store);
    Router.put("/vendors/{id}", vendorController.update);
    Router.delete("/vendors/{id}", vendorController.destroy);

  }
}
