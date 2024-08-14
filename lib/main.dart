import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profil Restoran',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: RestoranProfile(),
    );
  }
}

class RestoranProfile extends StatelessWidget {
  final String namaResto = 'RM NUSANTARA';
  final String email = 'qna@rmnusantara.com';
  final String phone = '08123456789';
  final double latitude = -6.982709199500799;
  final double longitude = 110.4091091666801;
  final String deskripsi =
      'RM NUSANTARA adalah restoran yang menyajikan kelezatan masakan Nusantara dengan cita rasa yang otentik. Dengan suasana yang nyaman dan hidangan yang disiapkan dengan bahan fresh, RM NUSANTARA menghadirkan pengalaman tak terlupakan.';

  Future<void> _launchPhone() async {
    final Uri phoneLaunchUri = Uri(
      scheme: 'tel',
      path: phone,
    );

    if (await canLaunchUrl(phoneLaunchUri)) {
      await launchUrl(phoneLaunchUri);
    }
  }

  Future<void> _launchMap() async {
    final Uri googleMapsUri = Uri.parse(
        'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude');

    if (await canLaunchUrl(googleMapsUri)) {
      await launchUrl(googleMapsUri, mode: LaunchMode.externalApplication);
    }
  }

  Future<void> _launchEmail() async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: email,
      query: 'subject=Tanya%20Seputar%20Resto',
    );

    if (await canLaunchUrl(emailLaunchUri)) {
      await launchUrl(emailLaunchUri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          namaResto,
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
        backgroundColor: Colors.orange[700],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.orange[100],
                borderRadius: BorderRadius.circular(10),
              ),
              child: CircleAvatar(
                radius: 80,
                backgroundImage: AssetImage('assets/profile.jpg'),
                backgroundColor: Colors.transparent,
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.orange[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.email),
                    onPressed: _launchEmail,
                  ),
                  IconButton(
                    icon: Icon(Icons.phone),
                    onPressed: _launchPhone,
                  ),
                  IconButton(
                    icon: Icon(Icons.map),
                    onPressed: _launchMap,
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.orange[100],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                deskripsi,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.orange[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Menu',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Column(
                    children: <Widget>[
                      ListTile(
                        title: Text('Rendang'),
                        subtitle: Text('Rp 25,000'),
                        contentPadding: EdgeInsets.symmetric(vertical: 4.0),
                      ),
                      ListTile(
                        title: Text('Gudeg'),
                        subtitle: Text('Rp 20,000'),
                        contentPadding: EdgeInsets.symmetric(vertical: 4.0),
                      ),
                      ListTile(
                        title: Text('Coto Makassar'),
                        subtitle: Text('Rp 25,000'),
                        contentPadding: EdgeInsets.symmetric(vertical: 4.0),
                      ),
                      ListTile(
                        title: Text('Es Teh'),
                        subtitle: Text('Rp 5,000'),
                        contentPadding: EdgeInsets.symmetric(vertical: 4.0),
                      ),
                      ListTile(
                        title: Text('Es Jeruk'),
                        subtitle: Text('Rp 5,000'),
                        contentPadding: EdgeInsets.symmetric(vertical: 4.0),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.orange[100],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: <Widget>[
                  Text(
                    'Alamat',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Jl. Nusantara No.45, Kota Merdeka, Indonesia',
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.orange[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: <Widget>[
                  Text(
                    'Jam Buka',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Senin - Jumat: 08:00 - 20:00\nSabtu - Minggu: 09:00 - 22:00',
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
