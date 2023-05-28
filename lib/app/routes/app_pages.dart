// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';

import '../modules/chat_list/bindings/chat_list_binding.dart';
import '../modules/chat_list/views/chat_list_view.dart';
import '../modules/doc_detail/bindings/doc_detail_binding.dart';
import '../modules/doc_detail/views/doc_detail_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.DOC_DETAIL,
      page: () => const DocDetailView(),
      binding: DocDetailBinding(),
    ),
    GetPage(
      name: _Paths.CHAT_LIST,
      page: () => const ChatListView(),
      binding: ChatListBinding(),
    ),
  ];
}
