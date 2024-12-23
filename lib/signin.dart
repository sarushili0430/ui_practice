import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

const Color kAccentColor = Color(0xFFFE7C64);
const Color kBackgroundColor = Color(0xFF19283D);
const Color kTextColorPrimary = Color(0xFFECEFF1);
const Color kTextColorSecondary = Color(0xFFB0BEC5);
const Color kButtonColorPrimary = Color(0xFFECEFF1);
const Color kButtonTextColorPrimary = Color(0xFF455A64);
const Color kIconColor = Color(0xFF455A64);

class SigninSignout extends StatefulWidget {
  const SigninSignout({super.key});

  @override
  State<SigninSignout> createState() => _SigninSignoutState();
}

class _SigninSignoutState extends State<SigninSignout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          PageHeader(),
          PageForm(),
          PageFooter(),
        ],
      ),
    );
  }
}

class PageHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double height = 300;
    return Container(
      height: height,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: HeaderBackground(height: height),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: HeaderCircles(height: height),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.only(top: 128),
              child: HeaderTitle(),
            ),
          ),
          Positioned(
            top: 16,
            left: 0,
            child: HeaderBackButton(),
          ),
        ],
      ),
    );
  }
}

class HeaderBackgroundClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    return Path()
      ..lineTo(0, size.height * 0.5)
      ..quadraticBezierTo(
        size.width * 0.55,
        size.height,
        size.width,
        size.height * 0.6,
      )
      ..lineTo(size.width, 0)
      ..close();
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class HeaderBackground extends StatelessWidget {
  final double height;

  const HeaderBackground({super.key, required this.height});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
        clipper: HeaderBackgroundClipper(),
        child: Container(
          width: double.infinity,
          height: height,
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: FractionalOffset.topLeft,
            end: FractionalOffset.bottomRight,
            colors: [
              Color(0xFFFD9766),
              Color(0xFFFF7362),
            ],
            stops: [0, 1],
          )),
        ));
  }
}

class HeaderCirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withValues(alpha: 0.4)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 6;

    canvas.drawCircle(
      Offset(size.width * 0.25, size.height * 0.4),
      12,
      paint,
    );
    canvas.drawCircle(
      Offset(size.width * 0.75, size.height * 0.2),
      12,
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class HeaderCircles extends StatelessWidget {
  final double height;

  const HeaderCircles({
    super.key,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: HeaderCirclePainter(),
      child: Container(
        width: double.infinity,
        height: height,
      ),
    );
  }
}

class HeaderTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Welcome',
          style: TextStyle(
            color: kTextColorPrimary,
            fontWeight: FontWeight.w500,
            fontSize: 32,
          ),
        ),
        Text(
          'Sign in to continue',
          style: TextStyle(
              color: kTextColorPrimary,
              fontSize: 12,
              fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}

class HeaderBackButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: Colors.transparent,
        shape: CircleBorder(
          side: BorderSide(color: kButtonColorPrimary),
        ),
      ),
      onPressed: () {
        context.go("/");
      },
      child: Icon(Icons.chevron_left, color: kIconColor),
    );
  }
}

class PageForm extends StatelessWidget {
  const PageForm({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            InputForm(),
            SizedBox(
              height: 12,
            ),
            LoginButton(),
            SizedBox(
              height: 8,
            ),
            Text(
              "OR",
              style: TextStyle(color: kTextColorPrimary),
            ),
            Text(
              "Connect with",
              style: TextStyle(
                color: kTextColorPrimary,
                fontSize: 12,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            OAuthSelection(),
          ],
        ));
  }
}

class InputForm extends StatefulWidget {
  const InputForm({super.key});

  @override
  State<InputForm> createState() => _InputFormState();
}

class _InputFormState extends State<InputForm> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _emailController,
          decoration: InputDecoration(
              labelText: "Email",
              labelStyle: TextStyle(color: kTextColorPrimary),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              )),
        ),
        SizedBox(
          height: 36,
        ),
        TextField(
          controller: _passwordController,
          decoration: InputDecoration(
              labelText: "Password",
              labelStyle: TextStyle(color: kTextColorPrimary),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white))),
          obscureText: true,
        ),
        TextButton(
            style: TextButton.styleFrom(
              minimumSize: Size.zero,
              padding: EdgeInsets.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            onPressed: () => {},
            child: Text("Forgot Password?",
                style: TextStyle(
                  color: kTextColorSecondary,
                  fontSize: 12,
                ))),
      ],
    );
  }
}

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        child: const Text('Sign in'),
        onPressed: () => {},
        style: ElevatedButton.styleFrom(
            fixedSize: Size.fromWidth(double.maxFinite),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            )));
  }
}

class OAuthSelection extends StatelessWidget {
  const OAuthSelection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 16,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              padding: EdgeInsets.zero,
              onPressed: () => {},
              constraints: BoxConstraints(),
              icon: Icon(
                Icons.account_circle,
                size: 16,
                color: Colors.white,
              ),
            ),
            Container(
              color: kTextColorSecondary,
              width: 1,
              height: 12,
            ),
            IconButton(
              padding: EdgeInsets.zero,
              onPressed: () => {},
              constraints: BoxConstraints(),
              icon: Icon(
                Icons.account_circle,
                size: 16,
                color: Colors.white,
              ),
            ),
          ],
        ));
  }
}

class PageFooter extends StatelessWidget {
  const PageFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Don't have an account? ",
              style: TextStyle(
                color: kTextColorSecondary,
                fontSize: 12,
              ),
            ),
            TextButton(
                style: TextButton.styleFrom(
                  minimumSize: Size.zero,
                  padding: EdgeInsets.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: Text("Sign up",
                    style: TextStyle(
                      color: kTextColorPrimary,
                      fontSize: 12,
                    )),
                onPressed: () => {}),
          ],
        ));
  }
}
