import 'package:dio/dio.dart';
import 'package:pods_only/core/models/product_model.dart';

class ApiService {

  Future<ProductModel> getItem() async{
    try {
       final dio = Dio();
      final response = await dio.get('https://dummyjson.com/products/1');
      final data = response.data;
      return ProductModel.fromJson(data);
    } catch (e) {
      throw('oops! something went wrong');
    }
}

}