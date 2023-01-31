import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:whattoexpect/constants/text_strings.dart';
import 'package:intl/intl.dart';

class NoteScreen extends StatefulWidget {
  const NoteScreen({super.key});

  @override
  _NoteScreenState createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  final CollectionReference notesCollection = FirebaseFirestore.instance
      .collection('users')
      .doc(uuid)
      .collection('journal');
  late TextEditingController _controller;
  late String _time;

  @override
  void initState() {
    _controller = TextEditingController();
    _time = DateTime.now().toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Journal"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              minLines: 1,
              maxLines: 5,
              keyboardType: TextInputType.multiline,
              decoration: const InputDecoration(
                hintText: "Enter your note",
              ),
            ),
            const SizedBox(height: 16.0),
            // Text("Last saved at: $_time"),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: notesCollection.orderBy('time').snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        var note = snapshot.data!.docs[index];
                        var data = note.data();

                        if (data is Map<String, dynamic>) {
                          Timestamp timestamp = data['time'];
                          DateTime dateTime = timestamp.toDate();

                          var formatter = DateFormat('dd-MM-yyyy');
                          String formattedTime =
                              DateFormat('h:mm:a').format(dateTime);

                          String date = formatter.format(dateTime);

                          return Card(
                            child: ListTile(
                              title: Text(data['text']),
                              subtitle: Text('$date $formattedTime'),
                              trailing: IconButton(
                                  onPressed: () {
                                    deleteNote(
                                        snapshot.data!.docs[index].reference);
                                  },
                                  icon: const Icon(Icons.delete)),
                            ),
                          );
                        }
                        return Container();
                      });
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await notesCollection.add({
            'text': _controller.text,
            'time': DateTime.now(),
          }).whenComplete(() => _controller.clear());
        },
        child: const Icon(Icons.save),
      ),
    );
  }

  void deleteNote(DocumentReference noteRef) {
    noteRef.delete().catchError((error) {
      print("Error deleting note: $error");
    });
  }
}
