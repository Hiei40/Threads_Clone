import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:untitled/Cubit/timeline_cubit/timeline_cubit.dart';
import 'package:untitled/Cubit/timeline_cubit/timeline_state.dart';

class TimelineScreen extends StatefulWidget {
  const TimelineScreen({super.key});
  @override
  State<TimelineScreen> createState() => _TimelineScreenState();
}

class _TimelineScreenState extends State<TimelineScreen> {
  void initState() {
    super.initState();
    context.read<TimelineCubit>().FetachAllposts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text("TimeLine"),
        leading: SizedBox(),
        centerTitle: true,
        elevation: 2,
      ),
      body: BlocBuilder<TimelineCubit, TimelineState>(
        builder: (BuildContext context, TimelineState state) {
          if (state is TimelineLoadingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is TimelineSuccessState) {
            return ListView.builder(
              itemCount: state.data.length,
              itemBuilder: (context, int index) {
                final post = state.data[index].data();
                final timestamp =
                    (post['createdAt'] as Timestamp).microsecondsSinceEpoch;
                final date = DateTime.fromMicrosecondsSinceEpoch(timestamp);
                final time = DateFormat.yMEd().format(date);
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 25,
                      backgroundImage: NetworkImage(post['profile_picture']),
                    ),
                    title: Text(post['user'].toString()),
                    subtitle: Text(post['content'].toString()),
                    trailing: Text(time),
                  ),
                );
              },
            );
          }
          return const SizedBox(
            child: Text('Try Again Later'),
          );
        },
      ),
    );
  }
}
