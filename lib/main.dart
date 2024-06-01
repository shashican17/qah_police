import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  await Supabase.initialize(
    url: '',
    anonKey:
        '',
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PanicScreen(),
    );
  }
}

class PanicScreen extends StatefulWidget {
  @override
  PanicScreenState createState() => PanicScreenState();
}

class PanicScreenState extends State<PanicScreen> {
  final alertStream = Supabase.instance.client
      .from('panic') // Use the correct table name
      .stream(primaryKey: ['id']);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Panic Table Data'),
      ),
      body: StreamBuilder<List<Map<String, dynamic>>>(
        stream: alertStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(
              child: Text('Error has occured bro: ${snapshot.error}'),
            );
          } else {
            final panicData = snapshot.data ?? [];
            print('Checking step1......');
            return ListView.builder(
              itemCount: panicData.length,
              itemBuilder: (context, index) {
                final panic = panicData[index];
                print('Checking step1......');
                return ListTile(
                    title: Text(
                        'Username: ${panic['username']}'), // Use the correct column name
                    subtitle: Text(
                      'Location: (${panic['latitude']}, ${panic['longitude']})',
                    ),
                    trailing: Text('Time: ${panic['created_at']}'));
              },
            );
          }
        },
      ),
    );
  }
}
