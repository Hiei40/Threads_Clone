import 'package:cloud_firestore/cloud_firestore.dart';

abstract class TimelineState {}

class TimelineInitial extends TimelineState {}

class TimelineLoadingState extends TimelineState {}

class TimelineSuccessState extends TimelineState {
  final List<QueryDocumentSnapshot<Map<String, dynamic>>> data;

  TimelineSuccessState(this.data);

}

class TimelineFailedState extends TimelineState {}