import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import '../../global/constant.dart';
import '../../global/utility.dart';
import '../../provider/raise_ticket.dart';

class MyTickets extends StatefulWidget {
  const MyTickets({super.key});

  @override
  State<MyTickets> createState() => _MyTicketsState();
}

class _MyTicketsState extends State<MyTickets> {
  @override
  void initState() {
    _fetchTickets();
    super.initState();
  }

  Future<void> _fetchTickets() async {
    setState(() {});

    try {
      final Map<String, String> userData = await UserDataManager.getLoginInfo();
      String jwtToken = userData['jwtToken'] ?? '';
      String uid = userData['uid'] ?? '';
      log(uid);

      final String apiUrl = '${BASE_URL}raise/tickets/my/';

      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {
          'Authorization': 'Bearer $jwtToken',
        },
      );

      if (response.statusCode == 200) {
        log(response.body);
        final List<dynamic> data = json.decode(response.body);

        // Explicitly cast List<dynamic> to List<Map<String, dynamic>>
        List<Map<String, dynamic>> ticketData =
            List<Map<String, dynamic>>.from(data);

        // Use Provider to update the ticket data
        // ignore: use_build_context_synchronously
        Provider.of<TicketProvider>(context, listen: false)
            .setTickets(ticketData);
      } else {
        log('Failed to fetch notifications: ${response.statusCode}');
      }
    } catch (error) {
      log('Error fetching notifications: $error');
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    bool isLoading = Provider.of<TicketProvider>(context).isLoading;
    return Scaffold(
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(
                  // color: APP_CLR,
                  ),
            )
          : Stack(
              children: [
                Image.asset(
                  'assets/images/Background.png',
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: mediaQueryH(context) * 0.06,
                    left: 18,
                    right: 18,
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.popUntil(
                                  context, (route) => route.isFirst);
                            },
                            icon: const Icon(
                              Icons.arrow_back_ios,
                              size: 18,
                            ),
                          ),
                          Text(
                            'My tickets',
                            style: TEXT_STYLE_M_SEMI_BOLD,
                          ),
                        ],
                      ),
                      Expanded(
                        child: Consumer<TicketProvider>(
                          builder: (context, ticketModel, child) {
                            List<Map<String, dynamic>> tickets =
                                ticketModel.tickets;

                            if (tickets.isNotEmpty) {
                              tickets.sort((a, b) {
                                DateTime dateA = a['createdDate'] != null
                                    ? DateTime.parse(a['createdDate'])
                                    : DateTime.now();
                                DateTime dateB = b['createdDate'] != null
                                    ? DateTime.parse(b['createdDate'])
                                    : DateTime.now();
                                return dateB.compareTo(dateA);
                              });
                            }

                            return tickets.isEmpty
                                ? const Center(child: Text('No tickets found'))
                                : ListView.builder(
                                    itemCount: tickets.length,
                                    itemBuilder: (context, index) {
                                      log('Ticket details: ${tickets[index]}');
                                      return TicketCard(ticket: tickets[index]);
                                    },
                                  );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}

class TicketCard extends StatelessWidget {
  final Map<String, dynamic> ticket;

  const TicketCard({super.key, required this.ticket});
  String formatDateString(String dateString) {
    DateTime dateTime = DateTime.parse(dateString);
    return DateFormat("MMMM d, yyyy h:mm:ss a").format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      elevation: 2,
      child: ListTile(
        contentPadding: const EdgeInsets.all(12),
        title: Text(
          "${ticket['subject'] ?? ''} ${ticket['message'] ?? ''} by ${ticket['createdBy']['firstName'] ?? 'Unknown'} on ${formatDateString(ticket['createdDate'])} with ${ticket['priority'] ?? 'Unknown'} priority.",
          style: TEXT_STYLE,
        ),
        subtitle: Text(
          'Created For: ${ticket['createdFor']['firstName'] ?? 'Unknown'}',
          style: TEXT_STYLE,
        ),
      ),
    );
  }
}
