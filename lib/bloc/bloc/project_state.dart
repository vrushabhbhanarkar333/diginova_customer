part of 'project_bloc.dart';

@immutable
sealed class ProjectState {}

final class ProjectInitial extends ProjectState {}

class FetechProjectInProgressSuccefulState extends ProjectState {
  final List<ProjectDetails> inProgressProjects;

  FetechProjectInProgressSuccefulState({required this.inProgressProjects});
}
class FetechProjectFinishedSuccefulState extends ProjectState {
  final List<ProjectDetails> inProgressProjects;

  FetechProjectFinishedSuccefulState({required this.inProgressProjects});
}

class ProjectLoading extends ProjectState{}
