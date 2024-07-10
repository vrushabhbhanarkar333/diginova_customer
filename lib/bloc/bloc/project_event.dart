part of 'project_bloc.dart';

@immutable
sealed class ProjectEvent {}

class FetchInProgressProjectsEvent extends ProjectEvent {
  
}
class FetchFinishedProjectsEvent extends ProjectEvent {
  
}
