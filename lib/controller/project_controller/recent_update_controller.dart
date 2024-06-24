import 'package:get/get.dart';

class RecentUpdateController extends GetxController {
  var updateList = <Map<String, dynamic>>[].obs;
  var descriptionList = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    // Initialize the update list
    updateList.addAll([
      {'title': "Design Changes", 'days': '2 Days ago'},
      {'title': "Service Changes", 'days': '2 Days ago'},
      {'title': "Panel Changes", 'days': '2 Days ago'},
      {'title': "MCB Changes", 'days': '2 Days ago'},
    ]);
    descriptionList.addAll(
      [
        {
          'title': "Organization",
          'descr':
              'Wiring and cable routing are organized meticulously to prevent issues and simplify maintenance.'
        },
        {
          'title': "Interference Prevention",
          'descr':
              'Planning aims to minimize interference and ensure that signals remain clear and reliable.'
        },
        {
          'title': "Safety Measures",
          'descr':
              'Cable management solutions like cable trays, conduits, and routing channels are utilized to protect wiring from damage and reduce the risk of electrical hazards.'
        },
        {
          'title': "Damage Reduction",
          'descr':
              'Proper organization and protection of wiring reduce the likelihood of damage, ensuring continued functionality.'
        },
      ],
    );
    super.onInit();
  }
}

List<Map<String, dynamic>> descriptionList = [
  {
    'title': "Organization",
    'descr':
        'Wiring and cable routing are organized meticulously to prevent issues and simplify maintenance.'
  },
  {
    'title': "Interference Prevention",
    'descr':
        'Planning aims to minimize interference and ensure that signals remain clear and reliable.'
  },
  {
    'title': "Safety Measures",
    'descr':
        'Cable management solutions like cable trays, conduits, and routing channels are utilized to protect wiring from damage and reduce the risk of electrical hazards.'
  },
  {
    'title': "Damage Reduction",
    'descr':
        'Proper organization and protection of wiring reduce the likelihood of damage, ensuring continued functionality.'
  },
];
