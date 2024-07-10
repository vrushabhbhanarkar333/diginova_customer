import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:diginova/global/constant.dart';
import 'package:diginova/model/project_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:bloc/bloc.dart';
import 'package:diginova/global/utility.dart';
import 'package:meta/meta.dart';

part 'project_event.dart';
part 'project_state.dart';

class ProjectBloc extends Bloc<ProjectEvent, ProjectState> {
  ProjectBloc() : super(ProjectInitial()) {
    on<FetchInProgressProjectsEvent>(fetchInProgressProjectsEvent);
    on<FetchFinishedProjectsEvent>(fetchFinishedProjectsEvent);
  }

  FutureOr<void> fetchInProgressProjectsEvent(FetchInProgressProjectsEvent event, Emitter<ProjectState> emit) async {
    emit(ProjectLoading());
    final result = await fetchProjectsInProgress();
    if (result != null) {
      emit(FetechProjectInProgressSuccefulState(inProgressProjects: result));
    }
  }

  FutureOr<void> fetchFinishedProjectsEvent(FetchFinishedProjectsEvent event, Emitter<ProjectState> emit)async {
    emit(ProjectLoading());

    final result = await fetchProjectsFinished();
    if (result != null) {
      emit(FetechProjectFinishedSuccefulState(inProgressProjects: result));
    }
  }
}




Future<List<ProjectDetails>?> fetchProjectsInProgress() async {
  final userInfo = await UserDataManager.getLoginInfo();
  final jwtToken = userInfo['jwtToken'];
  final url = "$BASE_URL/project";
  final headers = {
    'Authorization': 'Bearer $jwtToken'
  };

  final response = await http.get(Uri.parse(url), headers: headers);
  debugPrint("status code project fetching = ${response.statusCode}");
  debugPrint("body project fetching = ${response.body}");
  try {
     if (response.statusCode == 200) {
    final List<dynamic> jsonResponse = json.decode(response.body);
    List<ProjectDetails> allProjects = jsonResponse.map((data) => ProjectDetails.fromJson(data)).toList();
    
    List<ProjectDetails> inProgressProjects = allProjects.where((project) => project.selectedStatus == "In Progress").toList();
    print("in progress projects = $inProgressProjects");
    return inProgressProjects;
  } else {
    throw Exception('Failed to load projects');
  }
  } catch (e) {
    log(e.toString());
    return null;
  }
 
}
Future<List<ProjectDetails>?> fetchProjectsFinished() async {
  final userInfo = await UserDataManager.getLoginInfo();
  final jwtToken = userInfo['jwtToken'];
  final url = "$BASE_URL/project";
  final headers = {
    'Authorization': 'Bearer $jwtToken'
  };

  final response = await http.get(Uri.parse(url), headers: headers);
  debugPrint("status code project fetching = ${response.statusCode}");
  debugPrint("body project fetching = ${response.body}");
  try {
     if (response.statusCode == 200) {
    final List<dynamic> jsonResponse = json.decode(response.body);
    List<ProjectDetails> allProjects = jsonResponse.map((data) => ProjectDetails.fromJson(data)).toList();
    
    List<ProjectDetails> inProgressProjects = allProjects.where((project) => project.selectedStatus == "Done").toList();
    print("in progress projects = $inProgressProjects");
    return inProgressProjects;
  } else {
    throw Exception('Failed to load projects');
  }
  } catch (e) {
    log(e.toString());
    return null;
  }
 
}
