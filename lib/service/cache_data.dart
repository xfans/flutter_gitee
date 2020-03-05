// import 'dart:collection';
// import 'package:dio/dio.dart';

// class CacheData{
//   CacheData(this.response)
//       : timeStamp = DateTime.now().millisecondsSinceEpoch;
//   Response response;
//   int timeStamp; // 缓存创建时间

//   @override
//   bool operator ==(other) {
//     return response.hashCode == other.hashCode;
//   }

//   //将请求uri作为缓存的key
//   @override
//   int get hashCode => response.realUri.hashCode;
// }

// class CacheInterceptor extends Interceptor{
//   var cache = LinkedHashMap<String,CacheData>();
//   @override
//   onRequest(RequestOptions options) async {
//     var key = options.uri.toString();
//     var data = cache[key];
//     if(DateTime.now().millisecondsSinceEpoch - data.timeStamp < 1000 ){
//       Response response = data.response;
//       return response;
//     }else{
//       cache.remove(key);
//     }
//   }

//   @override
//   onResponse(Response response) async{
//     _saveCache(response);
//   }

//   @override
//   onError(DioError err) async{
//     return super.onError(err);
//   }

//   _saveCache(Response response){
//     RequestOptions options = response.request;
//     var key = options.uri.toString();
//     cache[key] = CacheData(response);
//   }
// }