import 'package:get/get.dart';
import '../modules/detailpage/bindings/detailpage_binding.dart';
import '../modules/detailpage/views/detailpage_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/onbording/bindings/onbording_binding.dart';
import '../modules/onbording/views/onbording_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.ONBORDING;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.ONBORDING,
      page: () => OnbordingView(),
      binding: OnbordingBinding(),
    ),
    GetPage(
      name: _Paths.DETAILPAGE,
      page: () =>  DetailpageView(),
      binding: DetailpageBinding(),
    ),
  ];
}
