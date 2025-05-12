import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // 80% primary (dark tone) and 20% accent (vibrant) colors.
  final Color primaryColor = Color(0xFF1A237E); // Dark blue
  final Color accentColor = Color(0xFFFF6F00);

  MyApp({super.key}); // Vibrant orange
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MCA Department',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: primaryColor,
        scaffoldBackgroundColor: Color(0xFF121212),
        colorScheme: ColorScheme.dark(
          primary: primaryColor,
          secondary: accentColor,
          surface: Color(0xFF121212),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: primaryColor,
          foregroundColor: Colors.white,
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Color(0xFF1E1E1E),
          selectedItemColor: accentColor,
          unselectedItemColor: Colors.grey[500],
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: accentColor,
          ),
        ),
        cardColor: Color(0xFF1E1E1E),
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Colors.white70),
          bodyMedium: TextStyle(color: Colors.white70),
        ),
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  // List of pages corresponding to each BottomNavigationBar item.
  final List<Widget> _pages = [
    FacultyPage(),
    DepartmentPage(),
    NotificationPage(),
    WebViewPage(),
    FeedbackPage(),
  ];

  // Drawer for additional navigation (optional).
  Widget buildDrawer() {
    return Drawer(
      backgroundColor: Color(0xFF1E1E1E),
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage('lib/images/mca.png'),
                  backgroundColor: Colors.transparent,
                ),
                SizedBox(height: 10),
                Text(
                  'MCA Department',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.people, color: Theme.of(context).primaryColor),
            title: Text('Faculty', style: TextStyle(color: Colors.white70)),
            onTap: () {
              Navigator.pop(context);
              setState(() {
                _currentIndex = 0;
              });
            },
          ),
          ListTile(
            leading: Icon(Icons.visibility, color: Theme.of(context).primaryColor),
            title: Text('Vision & Mission', style: TextStyle(color: Colors.white70)),
            onTap: () {
              Navigator.pop(context);
              setState(() {
                _currentIndex = 1;
              });
            },
          ),
          ListTile(
            leading: Icon(Icons.notifications, color: Theme.of(context).primaryColor),
            title: Text('Notifications', style: TextStyle(color: Colors.white70)),
            onTap: () {
              Navigator.pop(context);
              setState(() {
                _currentIndex = 2;
              });
            },
          ),
          ListTile(
            leading: Icon(Icons.web, color: Theme.of(context).primaryColor),
            title: Text('WebView', style: TextStyle(color: Colors.white70)),
            onTap: () {
              Navigator.pop(context);
              setState(() {
                _currentIndex = 3;
              });
            },
          ),
          ListTile(
            leading: Icon(Icons.feedback, color: Theme.of(context).primaryColor),
            title: Text('Feedback', style: TextStyle(color: Colors.white70)),
            onTap: () {
              Navigator.pop(context);
              setState(() {
                _currentIndex = 4;
              });
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar with a title and logo.
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              'lib/images/mca.png',
              height: 40,
            ),
            SizedBox(width: 10),
            Text('MCA Department'),
          ],
        ),
      ),
      drawer: buildDrawer(), // optional: keep drawer for additional navigation
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Faculty',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.visibility),
            label: 'Vision/Mission',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.web),
            label: 'WebView',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.feedback),
            label: 'Feedback',
          ),
        ],
      ),
    );
  }
}

// 1. Faculty Information using a GridView with centered cards and a majority image display.
class FacultyPage extends StatelessWidget {
  final List<Map<String, String>> facultyData = [
    {
      'name': 'Prof. Dr. Dhananjay Kalbande',
      'designation': 'Head Of Department',
      'info':
          'With extensive experience in research and academic leadership, he guides the department towards excellence.',
      'image': 'lib/images/hod.png'
    },
    {
      'name': 'Prof. Dr. Pooja Raundale',
      'designation': 'Professor',
      'info':
          'Specializes in advanced computing concepts and has numerous publications in reputed journals.',
      'image': 'lib/images/prof.png'
    },
    {
      'name': 'Prof. Dr. Aarti Karande',
      'designation': 'Assistant Professor',
      'info':
          'Focuses on innovative teaching methodologies and cutting-edge research in computer science.',
      'image': 'lib/images/prof1.png'
    },
    {
      'name': 'Prof. Harshil Kanakia',
      'designation': 'Assistant Professor',
      'info':
          'Engages in dynamic classroom interactions and is involved in several collaborative projects.',
      'image': 'lib/images/prof2.png'
    },
    {
      'name': 'Prof. Nikhita Mangaonkar',
      'designation': 'Assistant Professor',
      'info':
          'Passionate about technology and its real-world applications, she brings practical insights to her lectures.',
      'image': 'lib/images/prof3.png'
    },
    {
      'name': 'Prof. Sakina Shaikh',
      'designation': 'Assistant Professor',
      'info':
          'Known for her dedication to student success and research in emerging areas of IT.',
      'image': 'lib/images/prof4.png'
    },
    {
      'name': 'Prof. Pallavi Thakur',
      'designation': 'Assistant Professor',
      'info':
          'An enthusiastic educator focused on bridging theory and practice in software development.',
      'image': 'lib/images/prof5.png'
    },
  ];

  const FacultyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          childAspectRatio: 0.75,
        ),
        itemCount: facultyData.length,
        itemBuilder: (context, index) {
          return Center(child: FacultyCard(faculty: facultyData[index]));
        },
      ),
    );
  }
}

class FacultyCard extends StatefulWidget {
  final Map<String, String> faculty;
  const FacultyCard({super.key, required this.faculty});

  @override
  _FacultyCardState createState() => _FacultyCardState();
}

class _FacultyCardState extends State<FacultyCard> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).cardColor,
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Image takes ~80% of the card.
          Expanded(
            flex: 4,
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
              child: Image.asset(
                widget.faculty['image']!,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Text area takes ~20% of the card.
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6.0),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.faculty['name']!,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 12),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          widget.faculty['designation']!,
                          style: TextStyle(
                              fontSize: 10, color: Colors.grey[400]),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    padding: EdgeInsets.zero,
                    constraints: BoxConstraints(),
                    icon: Icon(
                      _expanded
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down,
                      size: 20,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    onPressed: () {
                      setState(() {
                        _expanded = !_expanded;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          if (_expanded)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
              child: Text(
                widget.faculty['info']!,
                style: TextStyle(fontSize: 10, color: Colors.white70),
              ),
            ),
        ],
      ),
    );
  }
}

// 2. Department Vision and Mission with expanded details.
class DepartmentPage extends StatelessWidget {
  const DepartmentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      children: [
        Card(
          color: Theme.of(context).cardColor,
          elevation: 4,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          margin: EdgeInsets.only(bottom: 12),
          child: ExpansionTile(
            collapsedIconColor: Colors.white70,
            iconColor: Theme.of(context).colorScheme.secondary,
            title: Text(
              'Department Vision',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                child: Text(
                  'Our vision is to become a premier center of excellence in IT education and research. We strive to create an environment where students and faculty collaborate to innovate, adapt, and excel in the rapidly evolving world of technology.',
                  style: TextStyle(color: Colors.white70),
                ),
              ),
            ],
          ),
        ),
        Card(
          color: Theme.of(context).cardColor,
          elevation: 4,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          margin: EdgeInsets.only(bottom: 12),
          child: ExpansionTile(
            collapsedIconColor: Colors.white70,
            iconColor: Theme.of(context).colorScheme.secondary,
            title: Text(
              'Department Mission',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                child: Text(
                  'The mission of the MCA Department is to provide high-quality education that balances theoretical knowledge with practical skills. We are committed to:\n\n'
                  '1. Delivering a curriculum that is current with industry trends and technological advancements.\n'
                  '2. Fostering an innovative and research-oriented environment.\n'
                  '3. Promoting interdisciplinary learning and collaboration.\n'
                  '4. Equipping students with the skills needed for successful careers in software engineering, data science, and IT management.\n'
                  '5. Encouraging lifelong learning and professional growth among our graduates.',
                  style: TextStyle(color: Colors.white70),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// 3. Notifications page.
class NotificationPage extends StatelessWidget {
  final List<Map<String, String>> notifications = [
    {
      'event': 'Placement Update: Top Recruiters Visit on April 10, 2025',
      'info':
          'Our placement cell has arranged campus interviews with leading IT companies. Check details for schedules and preparation tips.',
      'url': 'https://mca.spit.ac.in/index.php/internship-placements'
    },
    {
      'event': 'Webinar on Emerging Technologies - Register Now!',
      'info':
          'Join experts as they discuss trends in AI, IoT, and blockchain. Don\'t miss this opportunity to enhance your skills.',
      'url': 'https://mca.spit.ac.in/index.php/events'
    },
    {
      'event': 'Annual Fest 2025: Schedule and Events Announced',
      'info':
          'Get ready for an exciting array of competitions, workshops, and cultural events at the MCA Annual Fest 2025.',
      'url': 'https://mca.spit.ac.in/index.php/events'
    },
    {
      'event': 'Admissions Open for MCA 2025 Batch',
      'info':
          'Apply now to be a part of one of the most sought-after MCA programs. Check eligibility criteria and application process.',
      'url': 'https://mca.spit.ac.in/index.php/admissions'
    },
  ];

  const NotificationPage({super.key});

  Future<void> _launchURL(String url) async {
    Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      itemCount: notifications.length,
      itemBuilder: (context, index) {
        final notif = notifications[index];
        return Card(
          color: Theme.of(context).cardColor,
          elevation: 4,
          margin: EdgeInsets.symmetric(vertical: 6),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: ListTile(
            contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            title: Text(
              notif['event']!,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Text(notif['info']!),
            ),
            trailing: Icon(Icons.open_in_new,
                color: Theme.of(context).colorScheme.secondary),
            onTap: () => _launchURL(notif['url']!),
          ),
        );
      },
    );
  }
}

// 4. WebView page.
class WebViewPage extends StatefulWidget {
  const WebViewPage({super.key});

  @override
  _WebViewPageState createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  late final WebViewController _controller;
  
  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse('https://mca.spit.ac.in/'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MCA Website'),
      ),
      body: WebViewWidget(controller: _controller),
    );
  }
}

// 5. Feedback form with a rating bar.
class FeedbackPage extends StatefulWidget {
  const FeedbackPage({super.key});

  @override
  _FeedbackPageState createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  final _formKey = GlobalKey<FormState>();
  double _rating = 3.0;
  String _feedback = '';

  void _submitFeedback() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Feedback submitted! Rating: $_rating, Feedback: $_feedback'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Text(
              'Rate our Department',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            RatingBar.builder(
              initialRating: _rating,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => Icon(Icons.star,
                  color: Theme.of(context).colorScheme.secondary),
              onRatingUpdate: (rating) {
                setState(() {
                  _rating = rating;
                });
              },
            ),
            SizedBox(height: 24),
            TextFormField(
              style: TextStyle(color: Colors.white70),
              decoration: InputDecoration(
                labelText: 'Your Feedback',
                labelStyle: TextStyle(color: Colors.white70),
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your feedback';
                }
                return null;
              },
              onSaved: (value) {
                _feedback = value!;
              },
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: _submitFeedback,
              child: Text('Submit'),
            )
          ],
        ),
      ),
    );
  }
}
