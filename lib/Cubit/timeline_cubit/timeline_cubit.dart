import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:untitled/Cubit/timeline_cubit/timeline_state.dart';


class TimelineCubit extends Cubit<TimelineState> {
  TimelineCubit() : super(TimelineInitial());

void FetachAllposts() async{
  final postCollection = FirebaseFirestore.instance.collection('posts');
  // final docId = postCollection.doc().id;
  final query= await postCollection.get();
  query.docs;
  emit(TimelineSuccessState( query.docs));
}



}
