import 'dart:io';
import 'package:vania/vania.dart';
import 'create_customer_table.dart';
import 'create_orders_table.dart';
import 'create_vendors_table.dart';
import 'create_products_table.dart';
import 'create_productsnotes_table.dart';
import 'create_orderitems_table.dart';
import 'create_users_table.dart';
import 'create_personal_access_tokens_table.dart';

void main(List<String> args) async {
  await MigrationConnection().setup();
  if (args.isNotEmpty && args.first.toLowerCase() == "migrate:fresh") {
    await Migrate().dropTables();
  } else {
    await Migrate().registry();
  }
  await MigrationConnection().closeConnection();
  exit(0);
}

class Migrate {
  registry() async {
		 await CreateCustomerTable().up();
		 await CreateOrdersTable().up();
		 await CreateVendorsTable().up();
		 await CreateProductsTable().up();
		 await CreateProductsnotesTable().up();
		 await CreateOrderitemsTable().up();
		 await CreateUsersTable().up();
		 await CreatePersonalAcccessTokensTable().up();
	}

  dropTables() async {
		 await CreatePersonalAcccessTokensTable().down();
		 await CreateUsersTable().down();
		 await CreateOrderitemsTable().down();
		 await CreateProductsnotesTable().down();
		 await CreateProductsTable().down();
		 await CreateVendorsTable().down();
		 await CreateOrdersTable().down();
		 await CreateCustomerTable().down();
	 }
}
