import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:standup_randomizer/models/models.dart';

abstract class TeamMembersState extends Equatable {
  @override
  List<Object> get props => [];
}

class TeamMembersStateNotLoaded extends TeamMembersState {}

// TODO: Rename this to a better state name
class TeamMembersStateLoaded extends TeamMembersState {
  final List<TeamMember> teamMembers;

  TeamMembersStateLoaded({@required teamMembers})
      : teamMembers = List<TeamMember>.from(teamMembers);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [teamMembers];
}
