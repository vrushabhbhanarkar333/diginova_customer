import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../global/constant.dart';
import '../../global/utility.dart';
import '../../provider/chat.dart';

class ChatBot extends StatefulWidget {
  const ChatBot({super.key});

  @override
  State<ChatBot> createState() => _ChatBotState();
}

class _ChatBotState extends State<ChatBot> {
  List<dynamic> chatMessages = [];
  String uid = "";
  bool _isLoading = false;
  bool _isSending = false;

  TextEditingController messageController = TextEditingController();

  late ChatProvider _chatProvider;

  @override
  void initState() {
    super.initState();
    _chatProvider = ChatProvider();
    _getUserInfo();
    _loadChatMessages();
    _fetchMessage();
  }

  Future<void> _loadChatMessages() async {
    final prefs = await SharedPreferences.getInstance();
    final String? messages = prefs.getString('chatMessages');
    if (messages != null) {
      _chatProvider.initChatMessages(jsonDecode(messages));
    }
  }

  Future<void> _getUserInfo() async {
    final Map<String, String> userData = await UserDataManager.getLoginInfo();
    setState(() {
      uid = userData['uid'] ?? '';
    });
  }

  Future<void> _saveChatMessages() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('chatMessages', jsonEncode(_chatProvider.chatMessages));
  }

  Future<void> _postMessage(String content) async {
    setState(() {
      _isSending = true;
    });

    final url = Uri.parse(BASE_URL + CHATBOT);
    final Map<String, String> userData = await UserDataManager.getLoginInfo();
    String jwtToken = userData['jwtToken'] ?? '';
    String uid = userData['uid'] ?? '';
    final headers = <String, String>{
      'Authorization': 'Bearer $jwtToken',
      'Content-Type': 'application/json',
    };
    final body =
        jsonEncode({"sender": uid, "content": content, "contentType": "text"});

    try {
      final response = await http.post(url, headers: headers, body: body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        log('Message sent successfully: ${response.body}');
        var responseBody = jsonDecode(response.body);
        var newMsg = responseBody['data'][0];

        _chatProvider.addMessage(newMsg);
        messageController.clear();

        await _saveChatMessages();
      } else {
        log('Failed to send message: ${response.statusCode}');
      }
    } catch (error) {
      log('Error sending message: $error');
    } finally {
      setState(() {
        _isSending = false;
      });
    }
  }

  void _fetchMessage() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final Map<String, String> userData = await UserDataManager.getLoginInfo();
      String jwtToken = userData['jwtToken'] ?? '';

      final String apiUrl = '${BASE_URL}messages/chatbot/my/chat';
      log('URL : $apiUrl');
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Authorization': 'Bearer $jwtToken',
        },
      );
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        log('chats: $data');
        List<dynamic> messages = data['messages'];

        List<Map<String, dynamic>> formattedMessages = [];

        for (var message in messages) {
          Map<String, dynamic> formattedMessage = {
            'sender': message['sender']['_id'],
            'content': message['content'],
            'createdAt': message['createdAt'],
          };
          formattedMessages.add(formattedMessage);
        }

        _chatProvider.initChatMessages(formattedMessages);
      } else {
        log('Failed to load message');
      }
    } catch (error) {
      log('Error fetching messages: $error');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _chatProvider,
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              BACKGROUNDIMAGE,
              fit: BoxFit.cover,
            ),
            AppBar(
              centerTitle: true,
              backgroundColor: Colors.transparent,
              // leading: IconButton(
              //   onPressed: () {
              //     Navigator.popUntil(context, (route) => route.isFirst);
              //   },
              //   icon: const Icon(
              //     Icons.arrow_back_ios,
              //     size: 18,
              //   ),
              // ),
              title: Text(
                'Chatbot',
                style: TEXT_STYLE_M_SEMI_BOLD,
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    // Call the fetchMessage function when the refresh button is pressed
                    _fetchMessage();
                  },
                  icon: const Icon(
                    Icons.refresh,
                    size: 20,
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                top: mediaQueryH(context) * 0.1,
                left: 18,
                right: 18,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Expanded(
                          child: Consumer<ChatProvider>(
                            builder: (context, chatProvider, child) {
                              return SingleChildScrollView(
                                reverse: true,
                                child: Column(
                                  children: [
                                    for (var message
                                        in chatProvider.chatMessages)
                                      ChatBubble(
                                        message: message,
                                        isUserMessage: message['sender'] == uid,
                                      ),
                                    const SizedBox(height: SPACING_SM),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(color: BLUE_CLR_SHADE),
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: TextField(
                                          style: TEXT_STYLE,
                                          controller: messageController,
                                          decoration: const InputDecoration(
                                            hintText: 'Type a message...',
                                            border: InputBorder.none,
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    horizontal: 10),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(width: SPACING_XS),
                              SizedBox(
                                width: 40,
                                height: 40,
                                child: FloatingActionButton(
                                  elevation: 2,
                                  onPressed: _isSending
                                      ? null
                                      : () {
                                          String message =
                                              messageController.text.trim();
                                          if (message.isNotEmpty) {
                                            _postMessage(message);
                                          }
                                        },
                                  backgroundColor: _isSending
                                      ? Colors.grey
                                      : BLUE_N_SHADE_CLR,
                                  child: _isSending
                                      ? CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                                  Colors.white),
                                        )
                                      : const Icon(Icons.send,
                                          color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChatBubble extends StatelessWidget {
  final dynamic message;
  final bool isUserMessage;

  const ChatBubble({
    super.key,
    required this.message,
    required this.isUserMessage,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isUserMessage ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        decoration: BoxDecoration(
          color: isUserMessage ? Colors.blue : Colors.grey[300],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          message['content'],
          style: TEXT_STYLE.copyWith(
            color: isUserMessage ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
