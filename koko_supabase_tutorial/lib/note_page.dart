import "package:flutter/material.dart";
import "package:flutter/rendering.dart";
import "package:koko_supabase_tutorial/note.dart";
import "package:koko_supabase_tutorial/note_database.dart";


class NotePage extends StatefulWidget {
  const NotePage({super.key});

  @override
  State<NotePage> createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  final notesDatabase = NoteDatabase();

  final noteController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  int _displayLimit = 20;
  final int _increment = 10;
  bool _isLoadingMore = false;
  int _totalItems = 0;

  //add new note
  void addNewNote() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("New Note"),
          content: TextField(
            controller: noteController,
            decoration: const InputDecoration(hintText: "Note content"),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                final newNote = Note(content: noteController.text);
                notesDatabase.createNote(newNote);
                noteController.clear();
                Navigator.of(context).pop();
              },
              child: const Text("Add"),
            ),
          ],
        );
      },
    );
  }

  //update note
  void updateNote(Note note) {
    noteController.text = note.content;
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Update Note"),
          content: TextField(
            controller: noteController,
            decoration: const InputDecoration(hintText: "Note content"),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                notesDatabase.updateNote(note, noteController.text);
                noteController.clear();
                Navigator.of(context).pop();
              },
              child: const Text("Update"),
            ),
          ],
        );
      },
    );
  }

  //delete note

  //Build UI
  
  
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      final pos = _scrollController.position;
      // Only trigger when content is scrollable and the user is actively scrolling down
      if (pos.maxScrollExtent > 0 &&
          pos.userScrollDirection == ScrollDirection.reverse &&
          pos.pixels >= pos.maxScrollExtent - 200 &&
          !_isLoadingMore &&
          _displayLimit < _totalItems) {
        // request load more only if we know there are more items available
        setState(() {
          _isLoadingMore = true;
          _displayLimit += _increment;
        });
        // small delay to allow UI update; will be bounded by data length in builder
        Future.delayed(const Duration(milliseconds: 200), () {
          if (mounted) {
            setState(() {
              _isLoadingMore = false;
            });
          }
        });
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notes"),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: addNewNote,
        child: const Icon(Icons.add),
      ),

      body: StreamBuilder<List<Note>>(
        stream: notesDatabase.stream,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final notes = snapshot.data!;
          final total = notes.length;
          // update known total for the scroll listener (no setState here)
          _totalItems = total;
          final displayCount = _displayLimit < total ? _displayLimit : total;
          final pageItems = notes.take(displayCount).toList();

          return ListView.builder(
            controller: _scrollController,
            itemCount: pageItems.length + (displayCount < total ? 1 : 0),
            itemBuilder: (context, index) {
              if (index >= pageItems.length) {
                // loading indicator when more items are available
                return const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Center(child: CircularProgressIndicator()),
                );
              }

              final note = pageItems[index];
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ListTile(
                  title: Text(note.content),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () => updateNote(note),
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () => notesDatabase.deleteNote(note),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    noteController.dispose();
    super.dispose();
  }
}