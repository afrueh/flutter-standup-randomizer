import 'package:flutter/material.dart';

abstract class TeamMembersEvent {}

// TODO: Rename this to a better event name
class TeamMembersEventLoadData extends TeamMembersEvent {}

class TeamMembersEventAddMember extends TeamMembersEvent {
  final String name;
  TeamMembersEventAddMember({@required this.name});
}

class TeamMembersEventRemoveAll extends TeamMembersEvent {}

class TeamMembersEventShuffleOrder extends TeamMembersEvent {}
