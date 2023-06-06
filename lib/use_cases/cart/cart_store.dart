import 'package:injectable/injectable.dart';
import 'package:test_project/domain/models/product/product.dart';
import 'package:test_project/use_cases/cart/data_base_helper.dart';
import 'package:collection/collection.dart';

@LazySingleton()
class CartStore {
  Future addProduct(Product product) async {
    var result = await DataBaseHelper.getAllProducts();

    var addedProduct =
        result!.firstWhereOrNull((element) => element.id == product.id);
    if (addedProduct != null) {
      addedProduct.selectedCount = addedProduct.selectedCount + 1;
      await DataBaseHelper.updateProduct(addedProduct);
    } else {
      var newProduct =
          product.copyWith(selectedCount: product.selectedCount + 1);

      await DataBaseHelper.addProduct(newProduct);
    }
  }

  Future<List<Product>> getProducts() async {
    var result = await DataBaseHelper.getAllProducts();
    return result ?? [];
  }

  Future<void> deleteItem(int id) async {
    var result = await DataBaseHelper.getAllProducts();
    var product = result!.firstWhereOrNull((element) => element.id == id);
    if (product!.selectedCount == 1) {
      await DataBaseHelper.deleteProduct(product);
    } else {
      product.selectedCount = product.selectedCount - 1;
      await DataBaseHelper.updateProduct(product);
    }
  }
}
