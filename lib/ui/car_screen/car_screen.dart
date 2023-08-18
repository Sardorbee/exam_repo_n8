import 'package:flutter/material.dart';

class CarScreen extends StatefulWidget {
  const CarScreen({super.key});

  @override
  State<CarScreen> createState() => _CarScreenState();
}

class _CarScreenState extends State<CarScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Car Screen"),
      ),
      body: SizedBox(
      
        child: CustomPaint(
         
          painter: RPSCustomPainter(),
        ),
      ),
    );
  }
}

//Copy this CustomPainter code to the Bottom of the File
class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final double width = size.width;
    final double height = size.height;
    final Path path_0 = Path();
    path_0.moveTo(-0.5, -0.5);
    path_0.cubicTo(159.833 * width / 480.5, -0.5, 320.167 * width / 480.5, -0.5,
        480.5 * width / 480.5, -0.5);
    path_0.cubicTo(
        480.5 * width / 480.5,
        92.8333 * height / 279.5,
        480.5 * width / 480.5,
        186.167 * height / 279.5,
        480.5 * width / 480.5,
        279.5 * height / 279.5);
    path_0.cubicTo(
        320.167 * width / 480.5,
        279.5 * height / 279.5,
        159.833 * width / 480.5,
        279.5 * height / 279.5,
        -0.5,
        279.5 * height / 279.5);
    path_0.cubicTo(-0.5, 186.167 * height / 279.5, -0.5,
        92.8333 * height / 279.5, -0.5, -0.5);
    path_0.close();

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = const Color(0xfffdfdfd).withOpacity(1.0);
    canvas.drawPath(path_0, paint0Fill);

    Path path_1 = Path();
    path_1.moveTo(229.5, 48.5);
    path_1.cubicTo(271.505, 48.1668, 313.505, 48.5001, 355.5, 49.5);
    path_1.cubicTo(359.035, 55.9042, 362.035, 62.5709, 364.5, 69.5);
    path_1.cubicTo(364.392, 70.4419, 364.059, 71.2753, 363.5, 72);
    path_1.cubicTo(310.5, 72.6667, 257.5, 72.6667, 204.5, 72);
    path_1.cubicTo(203.409, 69.9361, 203.242, 67.7695, 204, 65.5);
    path_1.cubicTo(210.814, 57.1849, 219.314, 51.5183, 229.5, 48.5);
    path_1.close();

    Paint paint1Fill = Paint()..style = PaintingStyle.fill;
    paint1Fill.color = const Color(0xff070707).withOpacity(1.0);
    canvas.drawPath(path_1, paint1Fill);

    Path path_2 = Path();
    path_2.moveTo(402.5, 137.5);
    path_2.cubicTo(403.568, 138.434, 404.901, 138.768, 406.5, 138.5);
    path_2.cubicTo(406.5, 131.833, 406.5, 125.167, 406.5, 118.5);
    path_2.cubicTo(406.574, 116.589, 407.574, 115.422, 409.5, 115);
    path_2.cubicTo(417.167, 114.333, 424.833, 114.333, 432.5, 115);
    path_2.cubicTo(435, 116.167, 436.833, 118, 438, 120.5);
    path_2.cubicTo(438.966, 141.897, 438.633, 163.231, 437, 184.5);
    path_2.cubicTo(435.786, 186.049, 434.286, 187.215, 432.5, 188);
    path_2.cubicTo(426.175, 188.5, 419.842, 188.666, 413.5, 188.5);
    path_2.cubicTo(414.572, 201.838, 413.072, 214.838, 409, 227.5);
    path_2.cubicTo(407.668, 229.66, 406.168, 231.66, 404.5, 233.5);
    path_2.cubicTo(402.821, 233.892, 401.154, 234.392, 399.5, 235);
    path_2.cubicTo(388.172, 235.5, 376.838, 235.667, 365.5, 235.5);
    path_2.cubicTo(365.819, 230.637, 365.486, 225.97, 364.5, 221.5);
    path_2.cubicTo(360.375, 193.269, 344.042, 179.269, 315.5, 179.5);
    path_2.cubicTo(312.848, 179.41, 310.515, 180.076, 308.5, 181.5);
    path_2.cubicTo(290.929, 188.256, 280.095, 200.923, 276, 219.5);
    path_2.cubicTo(275.501, 224.823, 275.334, 230.156, 275.5, 235.5);
    path_2.cubicTo(228.833, 235.5, 182.167, 235.5, 135.5, 235.5);
    path_2.cubicTo(135.823, 228.978, 135.49, 222.645, 134.5, 216.5);
    path_2.cubicTo(134.59, 213.848, 133.924, 211.515, 132.5, 209.5);
    path_2.cubicTo(128.662, 196.329, 120.328, 187.329, 107.5, 182.5);
    path_2.cubicTo(105.383, 180.345, 102.716, 179.345, 99.5, 179.5);
    path_2.cubicTo(71.2579, 176.866, 53.4246, 189.199, 46, 216.5);
    path_2.cubicTo(45.5004, 223.158, 45.3337, 229.825, 45.5, 236.5);
    path_2.cubicTo(37.4931, 236.666, 29.4931, 236.5, 21.5, 236);
    path_2.cubicTo(18.6193, 234.749, 16.786, 232.583, 16, 229.5);
    path_2.cubicTo(11.1918, 218.008, 10.5251, 206.342, 14, 194.5);
    path_2.cubicTo(16.6171, 191.015, 20.1171, 189.348, 24.5, 189.5);
    path_2.cubicTo(24.1241, 180.765, 24.6241, 172.098, 26, 163.5);
    path_2.cubicTo(26.9326, 157.801, 29.7659, 153.301, 34.5, 150);
    path_2.cubicTo(51.5825, 145.602, 68.9159, 142.769, 86.5, 141.5);
    path_2.cubicTo(91.7312, 141.556, 96.7312, 140.889, 101.5, 139.5);
    path_2.cubicTo(107.871, 138.996, 114.205, 138.162, 120.5, 137);
    path_2.cubicTo(138.999, 119.159, 158.666, 102.825, 179.5, 88);
    path_2.cubicTo(183.95, 85.7388, 188.617, 84.0722, 193.5, 83);
    path_2.cubicTo(252.545, 82.0157, 311.545, 82.349, 370.5, 84);
    path_2.cubicTo(378.013, 85.8378, 383.847, 90.0045, 388, 96.5);
    path_2.cubicTo(393.297, 110.035, 398.131, 123.702, 402.5, 137.5);
    path_2.close();

    Paint paint2Fill = Paint()..style = PaintingStyle.fill;
    paint2Fill.color = const Color(0xff030303).withOpacity(1.0);
    canvas.drawPath(path_2, paint2Fill);

    Path path_3 = Path();
    path_3.moveTo(312.5, 149.5);
    path_3.cubicTo(292.167, 149.5, 271.833, 149.5, 251.5, 149.5);
    path_3.cubicTo(251.701, 143.491, 252.034, 137.491, 252.5, 131.5);
    path_3.cubicTo(252.885, 124.803, 253.552, 118.136, 254.5, 111.5);
    path_3.cubicTo(255.889, 106.731, 256.556, 101.731, 256.5, 96.5);
    path_3.cubicTo(256.33, 95.1779, 256.663, 94.0113, 257.5, 93);
    path_3.cubicTo(274.5, 92.3333, 291.5, 92.3333, 308.5, 93);
    path_3.cubicTo(309.249, 94.7337, 309.749, 96.567, 310, 98.5);
    path_3.cubicTo(310.427, 115.53, 311.26, 132.53, 312.5, 149.5);
    path_3.close();

    Paint paint3Fill = Paint()..style = PaintingStyle.fill;
    paint3Fill.color = const Color(0xfffbfbfb).withOpacity(1.0);
    canvas.drawPath(path_3, paint3Fill);

    Path path_4 = Path();
    path_4.moveTo(374.5, 111.5);
    path_4.cubicTo(374.41, 114.152, 375.076, 116.485, 376.5, 118.5);
    path_4.cubicTo(379.395, 128.666, 381.395, 138.999, 382.5, 149.5);
    path_4.cubicTo(363.5, 149.5, 344.5, 149.5, 325.5, 149.5);
    path_4.cubicTo(324.553, 130.472, 323.22, 111.472, 321.5, 92.5);
    path_4.cubicTo(333.52, 92.4771, 345.52, 92.9771, 357.5, 94);
    path_4.cubicTo(367.059, 96.059, 372.726, 101.892, 374.5, 111.5);
    path_4.close();

    Paint paint4Fill = Paint()..style = PaintingStyle.fill;
    paint4Fill.color = const Color(0xfffcfcfc).withOpacity(1.0);
    canvas.drawPath(path_4, paint4Fill);

    Path path_5 = Path();
    path_5.moveTo(242.5, 105.5);
    path_5.cubicTo(240.625, 114.287, 239.292, 123.287, 238.5, 132.5);
    path_5.cubicTo(238.304, 138.099, 237.638, 143.599, 236.5, 149);
    path_5.cubicTo(206.168, 149.5, 175.835, 149.667, 145.5, 149.5);
    path_5.cubicTo(146.085, 144.578, 147.585, 139.911, 150, 135.5);
    path_5.cubicTo(160.216, 118.284, 174.049, 104.784, 191.5, 95);
    path_5.cubicTo(193.5, 94.3333, 195.5, 93.6667, 197.5, 93);
    path_5.cubicTo(212.5, 92.3333, 227.5, 92.3333, 242.5, 93);
    path_5.cubicTo(243.249, 97.0866, 243.249, 101.253, 242.5, 105.5);
    path_5.close();

    Paint paint5Fill = Paint()..style = PaintingStyle.fill;
    paint5Fill.color = const Color(0xfffcfcfc).withOpacity(1.0);
    canvas.drawPath(path_5, paint5Fill);

    Path path_6 = Path();
    path_6.moveTo(256.5, 96.5);
    path_6.cubicTo(256.556, 101.731, 255.889, 106.731, 254.5, 111.5);
    path_6.cubicTo(254.444, 106.269, 255.111, 101.269, 256.5, 96.5);
    path_6.close();

    Paint paint6Fill = Paint()..style = PaintingStyle.fill;
    paint6Fill.color = const Color(0xff808080).withOpacity(1.0);
    canvas.drawPath(path_6, paint6Fill);

    Path path_7 = Path();
    path_7.moveTo(374.5, 111.5);
    path_7.cubicTo(375.924, 113.515, 376.59, 115.848, 376.5, 118.5);
    path_7.cubicTo(375.076, 116.485, 374.41, 114.152, 374.5, 111.5);
    path_7.close();

    Paint paint7Fill = Paint()..style = PaintingStyle.fill;
    paint7Fill.color = const Color(0xff909090).withOpacity(1.0);
    canvas.drawPath(path_7, paint7Fill);

    Path path_8 = Path();
    path_8.moveTo(242.5, 105.5);
    path_8.cubicTo(242.082, 114.767, 240.748, 123.767, 238.5, 132.5);
    path_8.cubicTo(239.292, 123.287, 240.625, 114.287, 242.5, 105.5);
    path_8.close();

    Paint paint8Fill = Paint()..style = PaintingStyle.fill;
    paint8Fill.color = const Color(0xff555555).withOpacity(1.0);
    canvas.drawPath(path_8, paint8Fill);

    Path path_9 = Path();
    path_9.moveTo(406.5, 118.5);
    path_9.cubicTo(406.5, 125.167, 406.5, 131.833, 406.5, 138.5);
    path_9.cubicTo(404.901, 138.768, 403.568, 138.434, 402.5, 137.5);
    path_9.cubicTo(403.5, 137.5, 404.5, 137.5, 405.5, 137.5);
    path_9.cubicTo(405.177, 130.978, 405.51, 124.645, 406.5, 118.5);
    path_9.close();

    Paint paint9Fill = Paint()..style = PaintingStyle.fill;
    paint9Fill.color = const Color(0xff939393).withOpacity(1.0);
    canvas.drawPath(path_9, paint9Fill);

    Path path_10 = Path();
    path_10.moveTo(101.5, 139.5);
    path_10.cubicTo(96.7312, 140.889, 91.7312, 141.556, 86.5, 141.5);
    path_10.cubicTo(91.2688, 140.111, 96.2688, 139.444, 101.5, 139.5);
    path_10.close();

    Paint paint10Fill = Paint()..style = PaintingStyle.fill;
    paint10Fill.color = const Color(0xff474747).withOpacity(1.0);
    canvas.drawPath(path_10, paint10Fill);

    Path path_11 = Path();
    path_11.moveTo(252.5, 131.5);
    path_11.cubicTo(252.034, 137.491, 251.701, 143.491, 251.5, 149.5);
    path_11.cubicTo(271.833, 149.5, 292.167, 149.5, 312.5, 149.5);
    path_11.cubicTo(292.007, 150.497, 271.34, 150.831, 250.5, 150.5);
    path_11.cubicTo(250.239, 143.928, 250.906, 137.594, 252.5, 131.5);
    path_11.close();

    Paint paint11Fill = Paint()..style = PaintingStyle.fill;
    paint11Fill.color = const Color(0xff7b7b7b).withOpacity(1.0);
    canvas.drawPath(path_11, paint11Fill);

    Path path_12 = Path();
    path_12.moveTo(99.5, 179.5);
    path_12.cubicTo(102.716, 179.345, 105.383, 180.345, 107.5, 182.5);
    path_12.cubicTo(104.603, 181.871, 101.936, 180.871, 99.5, 179.5);
    path_12.close();

    Paint paint12Fill = Paint()..style = PaintingStyle.fill;
    paint12Fill.color = const Color(0xff5a5a5a).withOpacity(1.0);
    canvas.drawPath(path_12, paint12Fill);

    Path path_13 = Path();
    path_13.moveTo(315.5, 179.5);
    path_13.cubicTo(313.485, 180.924, 311.152, 181.59, 308.5, 181.5);
    path_13.cubicTo(310.515, 180.076, 312.848, 179.41, 315.5, 179.5);
    path_13.close();

    Paint paint13Fill = Paint()..style = PaintingStyle.fill;
    paint13Fill.color = const Color(0xff8a8a8a).withOpacity(1.0);
    canvas.drawPath(path_13, paint13Fill);

    Path path_14 = Path();
    path_14.moveTo(54.5, 231.5);
    path_14.cubicTo(54.2319, 225.044, 54.8986, 218.711, 56.5, 212.5);
    path_14.cubicTo(67.0334, 190.745, 83.7001, 184.245, 106.5, 193);
    path_14.cubicTo(125.937, 205.039, 131.104, 221.539, 122, 242.5);
    path_14.cubicTo(111.573, 259.163, 96.7395, 264.996, 77.5, 260);
    path_14.cubicTo(64.843, 254.511, 57.1763, 245.011, 54.5, 231.5);
    path_14.close();

    Paint paint14Fill = Paint()..style = PaintingStyle.fill;
    paint14Fill.color = const Color(0xff060606).withOpacity(1.0);
    canvas.drawPath(path_14, paint14Fill);

    Path path_15 = Path();
    path_15.moveTo(354.5, 214.5);
    path_15.cubicTo(355.275, 219.797, 355.608, 225.13, 355.5, 230.5);
    path_15.cubicTo(350.362, 253.418, 336.028, 263.584, 312.5, 261);
    path_15.cubicTo(292.366, 254.664, 283.033, 240.83, 284.5, 219.5);
    path_15.cubicTo(285.924, 217.485, 286.59, 215.152, 286.5, 212.5);
    path_15.cubicTo(294.548, 194.986, 308.214, 187.486, 327.5, 190);
    path_15.cubicTo(340.792, 193.459, 349.792, 201.626, 354.5, 214.5);
    path_15.close();
    Paint paint15Fill = Paint()..style = PaintingStyle.fill;
    paint15Fill.color = const Color(0xff050505).withOpacity(1.0);
    canvas.drawPath(path_15, paint15Fill);

    Path path_16 = Path();
    path_16.moveTo(82.5, 208.5);
    path_16.cubicTo(83.5, 208.5, 84.5, 208.5, 85.5, 208.5);
    path_16.cubicTo(85.5, 212.833, 85.5, 217.167, 85.5, 221.5);
    path_16.cubicTo(81.5, 221.5, 77.5, 221.5, 73.5, 221.5);
    path_16.cubicTo(73.372, 219.345, 73.872, 217.345, 75, 215.5);
    path_16.cubicTo(77.3959, 212.933, 79.8959, 210.6, 82.5, 208.5);
    path_16.close();

    Paint paint16Fill = Paint()..style = PaintingStyle.fill;
    paint16Fill.color = const Color(0xfff1f1f1).withOpacity(1.0);
    canvas.drawPath(path_16, paint16Fill);

    Path path_17 = Path();
    path_17.moveTo(94.5, 208.5);
    path_17.cubicTo(100.69, 210.352, 105.023, 214.352, 107.5, 220.5);
    path_17.cubicTo(103.217, 221.492, 98.8839, 221.826, 94.5, 221.5);
    path_17.cubicTo(94.5, 217.167, 94.5, 212.833, 94.5, 208.5);
    path_17.close();

    Paint paint17Fill = Paint()..style = PaintingStyle.fill;
    paint17Fill.color = const Color(0xffeeeeee).withOpacity(1.0);
    canvas.drawPath(path_17, paint17Fill);

    Path path_18 = Path();
    path_18.moveTo(315.5, 208.5);
    path_18.cubicTo(315.5, 212.5, 315.5, 216.5, 315.5, 220.5);
    path_18.cubicTo(311.5, 220.5, 307.5, 220.5, 303.5, 220.5);
    path_18.cubicTo(305.167, 214.167, 309.167, 210.167, 315.5, 208.5);
    path_18.close();

    Paint paint18Fill = Paint()..style = PaintingStyle.fill;
    paint18Fill.color = const Color(0xfff5f5f5).withOpacity(1.0);
    canvas.drawPath(path_18, paint18Fill);

    Path path_19 = Path();
    path_19.moveTo(324.5, 208.5);
    path_19.cubicTo(331.167, 210.5, 335.5, 214.833, 337.5, 221.5);
    path_19.cubicTo(333.167, 221.5, 328.833, 221.5, 324.5, 221.5);
    path_19.cubicTo(324.5, 217.167, 324.5, 212.833, 324.5, 208.5);
    path_19.close();

    Paint paint19Fill = Paint()..style = PaintingStyle.fill;
    paint19Fill.color = const Color(0xffededed).withOpacity(1.0);
    canvas.drawPath(path_19, paint19Fill);

    Path path_20 = Path();
    path_20.moveTo(132.5, 209.5);
    path_20.cubicTo(133.924, 211.515, 134.59, 213.848, 134.5, 216.5);
    path_20.cubicTo(133.076, 214.485, 132.41, 212.152, 132.5, 209.5);
    path_20.close();

    Paint paint20Fill = Paint()..style = PaintingStyle.fill;
    paint20Fill.color = const Color(0xff9c9c9c).withOpacity(1.0);
    canvas.drawPath(path_20, paint20Fill);

    Path path_21 = Path();
    path_21.moveTo(286.5, 212.5);
    path_21.cubicTo(286.59, 215.152, 285.924, 217.485, 284.5, 219.5);
    path_21.cubicTo(284.41, 216.848, 285.076, 214.515, 286.5, 212.5);
    path_21.close();

    Paint paint21Fill = Paint()..style = PaintingStyle.fill;
    paint21Fill.color = const Color(0xff5a5a5a).withOpacity(1.0);
    canvas.drawPath(path_21, paint21Fill);

    Path path_22 = Path();
    path_22.moveTo(315.5, 208.5);
    path_22.cubicTo(316.485, 212.634, 316.818, 216.968, 316.5, 221.5);
    path_22.cubicTo(311.968, 221.818, 307.634, 221.485, 303.5, 220.5);
    path_22.cubicTo(307.5, 220.5, 311.5, 220.5, 315.5, 220.5);
    path_22.cubicTo(315.5, 216.5, 315.5, 212.5, 315.5, 208.5);
    path_22.close();

    Paint paint22Fill = Paint()..style = PaintingStyle.fill;
    paint22Fill.color = const Color(0xffa2a2a2).withOpacity(1.0);
    canvas.drawPath(path_22, paint22Fill);

    Path path_23 = Path();
    path_23.moveTo(56.5, 212.5);
    path_23.cubicTo(54.8986, 218.711, 54.2319, 225.044, 54.5, 231.5);
    path_23.cubicTo(52.8255, 224.942, 53.4922, 218.609, 56.5, 212.5);
    path_23.close();

    Paint paint23Fill = Paint()..style = PaintingStyle.fill;
    paint23Fill.color = const Color(0xff7a7a7a).withOpacity(1.0);
    canvas.drawPath(path_23, paint23Fill);

    Path path_24 = Path();
    path_24.moveTo(354.5, 214.5);
    path_24.cubicTo(356.006, 217.356, 356.672, 220.523, 356.5, 224);
    path_24.cubicTo(356.496, 226.361, 356.163, 228.527, 355.5, 230.5);
    path_24.cubicTo(355.608, 225.13, 355.275, 219.797, 354.5, 214.5);
    path_24.close();

    Paint paint24Fill = Paint()..style = PaintingStyle.fill;
    paint24Fill.color = const Color(0xff6b6b6b).withOpacity(1.0);
    // canvas.drawPath(path_24, paint24Fill);

    Path path_25 = Path();
    path_25.moveTo(73.5, 229.5);
    path_25.cubicTo(77.5, 229.5, 81.5, 229.5, 85.5, 229.5);
    path_25.cubicTo(85.5, 233.833, 85.5, 238.167, 85.5, 242.5);
    path_25.cubicTo(78.7286, 240.728, 74.7286, 236.395, 73.5, 229.5);
    path_25.close();

    Paint paint25Fill = Paint()..style = PaintingStyle.fill;
    paint25Fill.color = const Color(0xfff0f0f0).withOpacity(1.0);
    canvas.drawPath(path_25, paint25Fill);

    Path path_26 = Path();
    path_26.moveTo(94.5, 229.5);
    path_26.cubicTo(109.021, 227.082, 111.021, 230.582, 100.5, 240);
    path_26.cubicTo(98.7834, 241.559, 96.7834, 242.392, 94.5, 242.5);
    path_26.cubicTo(94.5, 238.167, 94.5, 233.833, 94.5, 229.5);
    path_26.close();

    Paint paint26Fill = Paint()..style = PaintingStyle.fill;
    paint26Fill.color = const Color(0xfff0f0f0).withOpacity(1.0);
    canvas.drawPath(path_26, paint26Fill);

    Path path_27 = Path();
    path_27.moveTo(303.5, 229.5);
    path_27.cubicTo(307.5, 229.5, 311.5, 229.5, 315.5, 229.5);
    path_27.cubicTo(315.5, 233.833, 315.5, 238.167, 315.5, 242.5);
    path_27.cubicTo(308.756, 240.754, 304.756, 236.421, 303.5, 229.5);
    path_27.close();

    Paint paint27Fill = Paint()..style = PaintingStyle.fill;
    paint27Fill.color = const Color(0xfff1f1f1).withOpacity(1.0);
    canvas.drawPath(path_27, paint27Fill);

    Path path_28 = Path();
    path_28.moveTo(324.5, 229.5);
    path_28.cubicTo(328.884, 229.174, 333.217, 229.508, 337.5, 230.5);
    path_28.cubicTo(335.023, 236.648, 330.69, 240.648, 324.5, 242.5);
    path_28.cubicTo(324.5, 238.167, 324.5, 233.833, 324.5, 229.5);
    path_28.close();

    Paint paint28Fill = Paint()..style = PaintingStyle.fill;
    paint28Fill.color = const Color(0xfff0f0f0).withOpacity(1.0);
    canvas.drawPath(path_28, paint28Fill);

    Path path_29 = Path();
    path_29.moveTo(364.5, 221.5);
    path_29.cubicTo(365.486, 225.97, 365.819, 230.637, 365.5, 235.5);
    path_29.cubicTo(376.838, 235.667, 388.172, 235.5, 399.5, 235);
    path_29.cubicTo(401.154, 234.392, 402.821, 233.892, 404.5, 233.5);
    path_29.cubicTo(403.653, 234.966, 402.32, 235.8, 400.5, 236);
    path_29.cubicTo(388.505, 236.5, 376.505, 236.667, 364.5, 236.5);
    path_29.cubicTo(364.5, 231.5, 364.5, 226.5, 364.5, 221.5);
    path_29.close();

    Paint paint29Fill = Paint()..style = PaintingStyle.fill;
    paint29Fill.color = const Color(0xffbcbcbc).withOpacity(1.0);
    canvas.drawPath(path_29, paint29Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
