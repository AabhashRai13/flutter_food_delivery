import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hungerz_store/data/network/category_provider.dart';
import 'package:hungerz_store/models/category.dart';
import 'package:hungerz_store/models/shop.dart';

class CategoryRepository {
  final CategoriesProvider categoriesProvider = CategoriesProvider();
  List<CategoryId> _categoryIdList = [];
  Future<List<CategoryId>> getAllCategory() async {
    try {
      final QuerySnapshot documentsSnapshot =
          await categoriesProvider.fetchCategories();
      List<CategoryId> allCategory = [];
      Name name;
      for (QueryDocumentSnapshot docSnapshot in documentsSnapshot.docs) {
        Map<String, dynamic> docData =
            docSnapshot.data() as Map<String, dynamic>;
        name = Name.fromJson(docData);
        allCategory.add(CategoryId(categoryId: docSnapshot.id, name: name));
      }
      _categoryIdList = allCategory;
      return allCategory;
    } catch (error) {
      rethrow;
    }
  }

  Future<CategoryId> getCategory(Shop shop) async {
    CategoryId categoryId = CategoryId(categoryId: '', name: Name(name: ''));
    Name name = Name(name: '');
    final DocumentSnapshot categoryDocumentsSnapshot =
        await categoriesProvider.fetCategory(shop.category!);
    if (categoryDocumentsSnapshot.exists) {
      Map<String, dynamic> categoryData =
          categoryDocumentsSnapshot.data() as Map<String, dynamic>;
      name = Name.fromJson(categoryData);
      categoryId =
          CategoryId(categoryId: categoryDocumentsSnapshot.id, name: name);
      return categoryId;
    } else {
      return categoryId;
    }
  }
}
