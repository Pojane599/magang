import 'package:dio/dio.dart';
import 'package:magang/app/data/models/news_model.dart';

class ApiProvider {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl:
          "https://702fee62ce67.ngrok-free.app/api", // ganti sesuai API kamu
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ),
  );

  // LOGIN
  Future<Response> login(String email, String password) async {
    try {
      final response = await _dio.post(
        "/login/karyawan",
        data: {
          "email": email,
          "pw": password, // harus 'pw' biar cocok dengan backend
        },
      );
      return response;
    } on DioException catch (e) {
      throw Exception(e.response?.data["message"] ?? "Terjadi kesalahan");
    }
  }

  // REGISTER
  Future<Response> register({
    required String name,
    required String email,
    required int tenantCompanyId,
    required String password,
  }) async {
    try {
      final response = await _dio.post(
        "/register/karyawan",
        data: {
          "nama": name,
          "email": email,
          "pw": password,
          "tenant_company_id": tenantCompanyId,
        },
      );
      return response;
    } on DioException catch (e) {
      throw Exception(e.response?.data["message"] ?? "Terjadi kesalahan");
    }
  }

  //nama Tenant Companies
  Future<List<Map<String, dynamic>>> getTenantCompanies() async {
    try {
      final response = await _dio.get("/tenant-companies");
      List data = response.data; // karena route return langsung array

      return data.map((e) => {"id": e["id"], "name": e["name"]}).toList();
    } on DioException catch (e) {
      throw Exception(e.response?.data["message"] ?? "Gagal ambil perusahaan");
    }
  }

  //NEWS
  Future<List<NewsModel>> getNews() async {
    try {
      final response = await _dio.get("/news");

      if (response.statusCode == 200) {
        final data = response.data;
        if (data != null && data["data"] != null && data["data"] is List) {
          List listData = data["data"];
          return listData.map((e) => NewsModel.fromJson(e)).toList();
        } else {
          return [];
        }
      } else {
        throw Exception("Response error: ${response.statusCode}");
      }
    } on DioException catch (e) {
      throw Exception(e.response?.data["message"] ?? "Gagal ambil data news");
    }
  }
}
