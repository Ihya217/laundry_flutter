import 'package:get/get.dart';

import '../controller/auth_controller.dart';
import '../modules/dashboard/bindings/dashboard_binding.dart';
import '../modules/dashboard/views/dashboard_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login_page/bindings/login_page_binding.dart';
import '../modules/login_page/views/login_page_view.dart';
import '../modules/pesanan/bindings/pesanan_binding.dart';
import '../modules/pesanan/views/pesanan_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/promo_details/bindings/promo_details_binding.dart';
import '../modules/promo_details/views/promo_details_view.dart';
import '../modules/register_page/bindings/register_page_binding.dart';
import '../modules/register_page/views/register_page_view.dart';
import '../modules/search_page/bindings/search_page_binding.dart';
import '../modules/search_page/views/search_page_view.dart';
import '../modules/shop_details/bindings/shop_details_binding.dart';
import '../modules/shop_details/views/shop_details_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();
  final AuthController authController = Get.put(AuthController());
  static const String home = '/home';
  static const String dashboard = '/dashboard';
  static const String login = '/login-page';
  static const String search = '/search-page';
  static const String shopDetails = '/shop-details';
  static const String promoDetails = '/promo-details';

  static const INITIAL = Routes.LOGIN_PAGE;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN_PAGE,
      page: () => const LoginPageView(),
      binding: LoginPageBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER_PAGE,
      page: () => const RegisterPageView(),
      binding: RegisterPageBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.SEARCH_PAGE,
      page: () => SearchPageView(),
      binding: SearchPageBinding(),
    ),
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => DashboardView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: _Paths.SHOP_DETAILS,
      page: () => ShopDetailsView(),
      binding: ShopDetailsBinding(),
    ),
    GetPage(
      name: _Paths.PROMO_DETAILS,
      page: () => const PromoDetailsView(),
      binding: PromoDetailsBinding(),
    ),
    GetPage(
      name: _Paths.PESANAN,
      page: () => const PesananView(),
      binding: PesananBinding(),
    ),
  ];
}
