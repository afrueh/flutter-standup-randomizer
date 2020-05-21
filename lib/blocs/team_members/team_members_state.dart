import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:standup_randomizer/models/models.dart';

abstract class TeamMembersState extends Equatable {
  @override
  List<Object> get props => [];
}

class TeamMembersStateNotLoaded extends TeamMembersState {}

class TeamMembersStateLoaded extends TeamMembersState {
  final List<TeamMember> teamMembers;

  TeamMembersStateLoaded({@required this.teamMembers});

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [teamMembers];
}
