import 'package:dockggu/controller/bookerton_controller.dart';
import 'package:dockggu/controller/team_controller.dart';
import 'package:dockggu/repogistory/main_repo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../model/partyinfoDTO.dart';

class AddThonController extends GetxController {
  var currentTeam = PartyResponseDto().obs;
  TextEditingController inputThonName = TextEditingController();
  TextEditingController inputMaxMembers = TextEditingController();
  Rx<DateTimeRange> dateRange = Rx(DateTimeRange(
    start: DateTime.now(),
    end: DateTime.now().add(Duration(days: 7)),
  ));

  Future<void> addThon() async {
    await MainRepo.addThon(
        currentTeam.value.partyId!,
        inputThonName.text,
        DateFormat("yyyyMMdd").format(dateRange.value.start),
        DateFormat("yyyyMMdd").format(dateRange.value.end),
        int.parse(inputMaxMembers.text));
        Get.find<TeamController>().getBookathonList();
        Get.find<BookertonController>().fetchBookertonData(currentTeam.value.partyId!, 0);
        Get.put(BookertonController());
        Navigator.pop(Get.context!);
  }
}
