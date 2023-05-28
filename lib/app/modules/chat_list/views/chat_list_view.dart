import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/chat_list_controller.dart';

class ChatListView extends GetView<ChatListController> {
  const ChatListView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ChatListView'),
        centerTitle: true,
      ),
    );
  }
}
