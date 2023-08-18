import 'package:exam_repo_n8/services/provider/map_provider.dart';
import 'package:exam_repo_n8/ui/tab_screen/tab_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  Location location = Location();

  Future<void> retrieveLocation() async {
    bool serviceEnabled;
    PermissionStatus permissionGranted;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }
    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    PermissionStatus permissionStatus = await location.requestPermission();
    // LocationData? currentLocation = await location.getLocation();

    if (permissionStatus == PermissionStatus.granted) {
      LocationData? currentLocation = await location.getLocation();
      if (context.mounted) {
        context.read<MapProvider>().updateLatLng(
            LatLng(currentLocation.latitude!, currentLocation.longitude!));
      }

      Future.delayed(const Duration(seconds: 1), () {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const TabScreen()));
      });
    }
  }

  @override
  void initState() {
    retrieveLocation();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomPaint(
            size: Size(
                MediaQuery.of(context).size.height,
                (MediaQuery.of(context).size.width * 0.8177570093457944)
                    .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
            painter: RPSCustomPainter(),
          ),
          Column(
            children: [
              SizedBox(
                height: 120.h,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      "assets/arava.svg",
                      width: 50,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    const Text(
                      "E-Commerce Shop",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          // decoration: TextDecoration.underline,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    const Divider(
                      endIndent: 160,
                      color: Colors.white,
                      thickness: 2,
                    ),
                    const Text(
                      """Professional App for your
eCommerce Business
                      """,
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    )
                  ],
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: SvgPicture.asset(
                  'assets/splash.svg',
                  width: 300,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              const Text(
                "Purchase online",
                style: TextStyle(
                    fontSize: 25,
                    // decoration: TextDecoration.underline,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 30.h,
              ),
              const Text(
                "Lorem Ipsum",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(
                height: 45.h,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path appBarCustom = Path();
    appBarCustom.moveTo(size.width * 1, 0);
    appBarCustom.lineTo(size.width * 0, 0);
    appBarCustom.lineTo(size.width * 0, size.height * 0.95);
    appBarCustom.cubicTo(
        size.width * 0.045,
        size.height * 0.99,
        size.width * 0.1,
        size.height * 1,
        size.width * 0.18,
        size.height * 0.99);
    appBarCustom.cubicTo(
        size.width * 0.4,
        size.height * 0.97,
        size.width * 0.81,
        size.height * 0.56,
        size.width * 1,
        size.height * 0.46);

    appBarCustom.close();
    var paintCircle = Paint()..color = Colors.white.withOpacity(0.2);

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = const Color(0xff037EEE).withOpacity(1.0);
    canvas.drawPath(appBarCustom, paint0Fill);
    canvas.drawCircle(Offset(size.width, -25), size.width / 1.7, paintCircle);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
