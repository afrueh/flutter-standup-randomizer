import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class TeamMembersEvent extends Equatable {
  @override
  List<Object> get props => [];
}

// TODO: Rename this to a better event name
class TeamMembersEventLoadData extends TeamMembersEvent {}

class TeamMembersEventAddMember extends TeamMembersEvent {
  final String name;
  TeamMembersEventAddMember({@required this.name});

  @override
  List<Object> get props => [name];
}

class TeamMembersEventRemoveAll extends TeamMembersEvent {}
