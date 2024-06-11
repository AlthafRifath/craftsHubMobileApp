import 'package:flutter/material.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_share_me/flutter_share_me.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Contacts',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ContactsPage(),
    );
  }
}

class ContactsPage extends StatefulWidget {
  @override
  _ContactsPageState createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  List<Contact>? _contacts;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _getContacts();
  }

  Future<void> _getContacts() async {
    var status = await Permission.contacts.request();
    if (status.isGranted) {
      var contacts = await ContactsService.getContacts();
      setState(() {
        _contacts = contacts.toList();
        _isLoading = false;
      });
    } else {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _shareToWhatsApp() {
    FlutterShareMe().shareToWhatsApp(msg: "Check out this amazing app!");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts'),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : _contacts != null && _contacts!.isNotEmpty
              ? ListView.builder(
                  itemCount: _contacts!.length,
                  itemBuilder: (context, index) {
                    Contact contact = _contacts![index];
                    String phoneNumber = contact.phones?.isNotEmpty == true ? contact.phones!.first.value! : '';
                    return ListTile(
                      title: Text(contact.displayName ?? 'No name'),
                      subtitle: Text(phoneNumber),
                      trailing: IconButton(
                        icon: Icon(Icons.share),
                        onPressed: () => _shareToWhatsApp(),
                      ),
                    );
                  },
                )
              : Center(child: Text('No contacts found or access not granted.')),
    );
  }
}
