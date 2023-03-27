import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class TicketPage extends StatefulWidget {
  const TicketPage({Key? key}) : super(key: key);

  @override
  State<TicketPage> createState() => _TicketPageState();
}

class _TicketPageState extends State<TicketPage> {
  int _selectedIndex = 0;

  List<Widget> _pages = [
    TrainBooking(),
    FlightBooking(),
    CabBooking(),
  ];

  bool _isBookmarked = false; // initialize bookmark state to false

  void _toggleBookmark() async {
    // TODO: implement saving riding details to persistent storage
    setState(() {
      _isBookmarked = !_isBookmarked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tickets Page"),
        actions: [
          IconButton(
            icon: Icon(
              _isBookmarked ? Icons.bookmark : Icons.bookmark_border,
              color: Colors.white,
            ),
            onPressed: _toggleBookmark,
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                "https://www.freepik.com/free-photo/vivid-transparent-orange-autumn-leaf_5286232.htm#query=background%20jpg&position=9&from_view=keyword&track=ais"),
            fit: BoxFit.cover,
          ),
        ),
        child: _pages[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.train),
            label: 'Train',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.flight),
            label: 'Flight',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_taxi),
            label: 'Cab',
          ),
        ],
      ),
    );
  }
}

class TrainBooking extends StatelessWidget {
  final String irctcUrl =
      "https://www.ixigo.com/trains/train-seat-availability?utm_source=bing&utm_medium=paid_search_bing_trains&utm_campaign=train_search_desktop_bing&msclkid=b83ff74c8e2f1c860795936c3f022719&utm_term=https%3A%2F%2Fwww.ixigo.com%2Ftrains%2Ftrain-seat-availability&utm_content=DSA_Trains";

  Future<void> _launchIrctcUrl() async {
    if (await canLaunch(irctcUrl)) {
      await launch(irctcUrl);
    } else {
      throw 'Could not launch $irctcUrl';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: () {
          _launchIrctcUrl();
        },
        child: Icon(Icons.train),
      ),
    );
  }
}

class FlightBooking extends StatelessWidget {
  final String skyscannerUrl =
      "https://www.in.cheapflights.com/flights-to-India/";

  Future<void> _launchSkyscannerUrl() async {
    if (await canLaunch(skyscannerUrl)) {
      await launch(skyscannerUrl);
    } else {
      throw 'Could not launch $skyscannerUrl';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: () {
          _launchSkyscannerUrl();
        },
        child: Icon(Icons.flight),
      ),
    );
  }
}

class CabBooking extends StatelessWidget {
  final String uberUrl =
      "https://www.save70.com/cars/?campaignid=388553822&adgroupid=1230353783269333&lpage=alpha&lb=skys&YallaBeitar=1&msclkid=ef7e02e9a32a1c77651a66c911ff4b7f&utm_source=bing&utm_medium=cpc&utm_campaign=B_Cars-WW-%5BEN%5D-DSKTAB-ALP_SKS-LIR-03_Mixed_KWs&utm_term=cheap%20car%20rentals%20in%20India&utm_content=CR_In_Loc%20(Exact)";

  Future<void> _launchUberUrl() async {
    if (await canLaunch(uberUrl)) {
      await launch(uberUrl);
    } else {
      throw 'Could not launch $uberUrl';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: () {
          _launchUberUrl();
        },
        child: Icon(Icons.local_taxi),
      ),
    );
  }
}
