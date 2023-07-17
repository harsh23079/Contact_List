import 'dart:ffi';

import 'package:flutter/material.dart';

import 'contact.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  int selectIndex = -1;

  List<Contact> contacts = List.empty(growable: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Color.fromARGB(255, 102, 173, 244),
        centerTitle: true,
        title: const Text(
          'Samparak Suchi',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Center(
          child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: TextField(
              controller: nameController,
              decoration: InputDecoration(
                hintText: 'Contact Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: TextField(
              maxLength: 10,
              keyboardType: TextInputType.number,
              controller: contactController,
              decoration: InputDecoration(
                hintText: 'Contact Number',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                width: 120.0,
                height: 50, // Set the width for the Save button
                child: ElevatedButton(
                  onPressed: () {
                    String name = nameController.text.trim();
                    String contact = contactController.text.trim();
                    if (name.isNotEmpty && contact.isNotEmpty) {
                      setState(() {
                        nameController.text = "";
                        contactController.text = "";
                        contacts.add(Contact(name: name, contact: contact));
                      });
                    }
                  },
                  child: Text('Save', style: TextStyle(fontSize: 20)),
                ),
              ),
              SizedBox(width: 40.0),
              Container(
                width: 120.0,
                height: 50, // Set the width for the Update button
                child: ElevatedButton(
                  onPressed: () {
                    String name = nameController.text.trim();
                    String contact = contactController.text.trim();
                    if (name.isNotEmpty && contact.isNotEmpty) {
                      setState(() {
                        nameController.text = "";
                        contactController.text = "";
                        contacts[selectIndex].name = name;

                        contacts[selectIndex].contact = contact;

                        selectIndex = -1;
                      });
                    }
                  },
                  child: Text(
                    'Update',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ]),
          ),
          contacts.isEmpty
              ? Text(
                  'No Contact yet...',
                  style: TextStyle(fontSize: 22),
                )
              : Expanded(
                  child: ListView.builder(
                    itemCount: contacts.length,
                    itemBuilder: (context, index) => getRow(index),
                  ),
                )
        ],
      )),
    );
  }

  Widget getRow(int index) {
    return Card(
        child: ListTile(
      leading: CircleAvatar(
        backgroundColor: index % 2 == 0 ? Colors.blue : Colors.blueGrey,
        child: Text(
          contacts[index].name[0],
          style: TextStyle(color: Colors.white),
        ),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            contacts[index].name,
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          Text(contacts[index].contact)
        ],
      ),
      trailing: SizedBox(
          width: 70,
          child: Row(children: [
            InkWell(
                onTap: () {
                  setState(() {
                    nameController.text = contacts[index].name;
                    contactController.text = contacts[index].contact;
                    selectIndex = index;
                  });
                },
                child: Icon(Icons.edit)),
            SizedBox(
              width: 10,
            ),
            InkWell(
              child: Icon(Icons.delete),
              onTap: () {
                setState(() {
                  contacts.removeAt(index);
                });
              },
            )
          ])),
    ));
  }
}
