import 'package:diginova/global/constant.dart';
import 'package:diginova/screens/help_desk/chat.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  final TextEditingController searchController = TextEditingController();
  RxList<ChatsListCustom> chatsList = <ChatsListCustom>[
    const ChatsListCustom(
      title: 'Bhaskar',
      subtitle: 'Stand up for what you belive in',
      number: 9,
      color: BLUE_DARK_CLR,
    ),
    const ChatsListCustom(
      title: 'Nathan Scott',
      subtitle:
          'One day you’re seventeen and planning for someday. And then quietly and without I am who I am. No excuses.',
      color: Colors.transparent,
    ),
    const ChatsListCustom(
      title: 'Brooke Davis',
      subtitle: 'I am who I am. No excuses.',
      number: 2,
      color: BLUE_DARK_CLR,
    ),
    const ChatsListCustom(
      title: 'Jamie Scott',
      subtitle: 'Some people are a little different. I think that’s cool.',
      color: Colors.transparent,
    ),
    const ChatsListCustom(
      title: 'Marvin McFadden',
      subtitle:
          'Last night in the NBA the Charlotte Bobcats quietly made a move that most sports fans sdsd',
      color: Colors.transparent,
    ),
    const ChatsListCustom(
      title: 'Antwon Taylor',
      subtitle: 'Meet me at the Rivercourt',
      color: Colors.transparent,
    ),
  ].obs;

  RxList<ChatsListCustom> filteredChats = <ChatsListCustom>[].obs;

  @override
  void onInit() {
    super.onInit();
    filteredChats.value = chatsList;
  }

  void filterChats(String query) {
    if (query.isNotEmpty) {
      filteredChats.value = chatsList
          .where((chat) {
            return chat.title.toLowerCase().contains(query.toLowerCase());
          })
          .toList()
          .obs;
    } else {
      filteredChats.value = chatsList;
    }
  }
}
