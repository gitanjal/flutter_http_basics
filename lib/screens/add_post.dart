import 'package:flutter/material.dart';
import 'package:flutter_basics/HTTPHelper.dart';

class AddPost extends StatefulWidget {
  const AddPost({Key? key}) : super(key: key);

  @override
  State<AddPost> createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  TextEditingController _controllerTitle = TextEditingController();
  TextEditingController _controllerBody = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add a Post'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Add a title'
                ),
                controller: _controllerTitle,
              ),
              TextFormField(
                decoration: InputDecoration(
                    hintText: 'Add a body'
                ),
                controller: _controllerBody,
                maxLines: 5,
              ),
              ElevatedButton(
                  onPressed: () async {
                    Map<String, String> dataToUpdate = {
                      'title': _controllerTitle.text,
                      'body': _controllerBody.text,
                    };

                    bool status = await HTTPHelper()
                        .addItem(dataToUpdate);

                    if (status) {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text('Post added')));
                    }
                    else
                    {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text('Failed to add the post')));
                    }
                  },
                  child: Text('Submit'))
            ],
          ),
        ),
      ),
    );
  }
}
