import 'package:diginova/controller/help_desk_controller/chat_controller.dart';
import 'package:diginova/global/constant.dart';
import 'package:diginova/screens/chat/chatting_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final ChatController _chatController = Get.put(ChatController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: SPACING_MD,
            ),
            SizedBox(
              height: 45,
              width: MediaQuery.of(context).size.width,
              child: TextFormField(
                controller: _chatController.searchController,
                cursorColor: TEXTFIELD_HINT_TXT_CLR,
                textInputAction: TextInputAction.done,
                onChanged: (query) => _chatController.filterChats(query),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.zero,
                  filled: true,
                  fillColor: WHITE_CLR,
                  hintText: 'Search',
                  hintStyle: GoogleFonts.poppins(
                    fontSize: FONT_SM,
                    fontWeight: FontWeight.w400,
                    color: const Color(0XFF8F9098),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0XFFE0E2E7),
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(24),
                    ),
                  ),
                  disabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0XFFE0E2E7),
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(24),
                    ),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0XFFE0E2E7),
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(24),
                    ),
                  ),
                  prefixIcon: const Icon(
                    Icons.search,
                    size: 18,
                    color: Color(0XFF2F3036),
                  ),
                ),
              ),
            ),
            const SizedBox(height: SPACING_MD),
            Obx(
              () => Column(
                children: _chatController.filteredChats
                    .map((chat) => ChatsListCustom(
                          title: chat.title,
                          subtitle: chat.subtitle,
                          number: chat.number,
                          color: chat.color,
                        ))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChatsListCustom extends StatelessWidget {
  final dynamic index;

  final String title;
  final String subtitle;
  final int? number;
  final Color color;
  const ChatsListCustom({
    super.key,
    required this.title,
    required this.subtitle,
    this.number,
    required this.color,
    this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ChattingScreen(),
              ),
            );
          },
          contentPadding: EdgeInsets.zero,
          leading: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: const Color(0XFFEAF2FF),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.asset(
              'assets/images/Avatar1.png',
              fit: BoxFit.contain,
            ),
          ),
          title: Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: FONT_14,
              fontWeight: FontWeight.bold,
              color: BLACK_CLR,
            ),
          ),
          subtitle: Text(
            subtitle,
            style: GoogleFonts.poppins(
              fontSize: FONT_XSS,
              fontWeight: FontWeight.normal,
              color: WARM_GRAY_CLR,
            ),

            maxLines: 2, // Limit to two lines
            overflow:
                TextOverflow.ellipsis, // Display ellipsis if exceeds two lines
          ),
          trailing: ClipOval(
            child: Container(
              color: color,
              height: 20,
              width: 20,
              child: Center(
                child: number == null
                    ? Container()
                    : Text(
                        number.toString(),
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: WHITE_CLR,
                        ),
                      ),
              ),
            ),
          ),
        ),
        const Divider(
          color: DIVIDER_CLR,
        ),
      ],
    );
  }
}

//List of Chat
const List<ChatsListCustom> _chatsList = [
  ChatsListCustom(
    title: 'Bhaskar',
    subtitle: 'Stand up for what you belive in',
    number: 9,
    color: BLUE_DARK_CLR,
  ),
  ChatsListCustom(
    title: 'Nathan Scott',
    subtitle:
        'One day you’re seventeen and planning for someday. And then quietly and without I am who I am. No excuses.',
    color: Colors.transparent,
  ),
  ChatsListCustom(
    title: 'Brooke Davis',
    subtitle: 'I am who I am. No excuses.',
    number: 2,
    color: BLUE_DARK_CLR,
  ),
  ChatsListCustom(
    title: 'Jamie Scott',
    subtitle: 'Some people are a little different. I think that’s cool.',
    color: Colors.transparent,
  ),
  ChatsListCustom(
    title: 'Marvin McFadden',
    subtitle:
        'Last night in the NBA the Charlotte Bobcats quietly made a move that most sports fans sdsd',
    color: Colors.transparent,
  ),
  ChatsListCustom(
    title: 'Antwon Taylor',
    subtitle: 'Meet me at the Rivercourt',
    color: Colors.transparent,
  ),
];
