import 'package:vania/vania.dart';
import 'package:tugas_rest/app/http/controllers/customer_controller.dart';
import 'package:tugas_rest/app/http/controllers/orders_controller.dart';
import 'package:tugas_rest/app/http/controllers/orderitems_controller.dart';
import 'package:tugas_rest/app/http/controllers/product_controller.dart';
import 'package:tugas_rest/app/http/controllers/productnotes_controller.dart';
import 'package:tugas_rest/app/http/controllers/vendors_controller.dart';
import 'package:tugas_rest/app/http/controllers/auth_controller.dart';
import 'package:tugas_rest/app/http/middleware/authenticate.dart';

class ApiRoute implements Route {
  @override
  void register() {
    Router.basePrefix('api');
    
    Router.group(() {
      Router.post('/login', authController.login);
      Router.post('/register', authController.register);
    }, prefix: 'auth');

    Router.group(() {
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

      Router.get("/items", orderitemsController.index);
      Router.get("/items/{id}", orderitemsController.show);
      Router.post("/items", orderitemsController.store);
      Router.put("/items/{id}", orderitemsController.update);
      Router.delete("/items/{id}", orderitemsController.destroy);

      Router.get("/product", productController.index);
      Router.get("/product/{id}", productController.show);
      Router.post("/product", productController.store);
      Router.put("/product/{id}", productController.update);
      Router.delete("/product/{id}", productController.destroy);

      Router.get("/notes", productNotesController.index);
      Router.get("/notes/{id}", productNotesController.show);
      Router.post("/notes", productNotesController.store);
      Router.put("/notes/{id}", productNotesController.update);
      Router.delete("/notes/{id}", productNotesController.destroy);

      Router.get("/vendor", vendorController.index);
      Router.get("/vendor/{id}", vendorController.show);
      Router.post("/vendor", vendorController.store);
      Router.put("/vendor/{id}", vendorController.update);
      Router.delete("/vendor/{id}", vendorController.destroy);
    }, middleware: [AuthenticateMiddleware()]);
  }
}
