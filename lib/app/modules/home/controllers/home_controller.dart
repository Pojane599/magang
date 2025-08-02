import 'package:get/get.dart';
import '../../../data/models/news_model.dart';
import '../../../data/providers/api_provider.dart';

class HomeController extends GetxController {
  var newsList = <NewsModel>[].obs;
  var isLoading = false.obs;

  final ApiProvider apiProvider = ApiProvider();

  @override
  void onInit() {
    super.onInit();
    fetchNews();
  }

  Future<void> fetchNews() async {
    isLoading.value = true;
    try {
      final result = await apiProvider.getNews(); // List<NewsModel>
      newsList.assignAll(result);
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
