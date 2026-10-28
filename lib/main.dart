import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yaron Fanger Portfolio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        scaffoldBackgroundColor: Colors.black,
      ),
      home: const PortfolioScreen(),
    );
  }
}

class PortfolioScreen extends StatelessWidget {
  const PortfolioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    final heroHeight = math.max(500.0, math.min(screenHeight * 0.64, 560.0));

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light.copyWith(statusBarColor: Colors.black),
      child: Scaffold(
        body: SafeArea(
          bottom: false,
          child: SingleChildScrollView(
            child: Column(
              children: [
                _ProfileHeader(height: heroHeight),
                const _PortfolioDetails(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ProfileHeader extends StatelessWidget {
  const _ProfileHeader({required this.height});

  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: double.infinity,
      child: Stack(
        children: [
          const Positioned.fill(child: ColoredBox(color: Colors.black)),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: height * 0.70,
            child: const _PortraitCrop(),
          ),
          const Positioned.fill(
            child: IgnorePointer(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0x22000000),
                      Color(0x00000000),
                      Colors.black,
                    ],
                    stops: [0.0, 0.56, 1.0],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 10,
            left: 22,
            right: 22,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 5,
                    vertical: 2,
                  ),
                  color: const Color(0x33222222),
                  child: const Text(
                    'Y.',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                Container(
                  width: 38,
                  height: 38,
                  color: Colors.white,
                  alignment: Alignment.center,
                  child: const Icon(Icons.menu, color: Colors.black, size: 22),
                ),
              ],
            ),
          ),
          Positioned(
            left: 20,
            right: 20,
            bottom: 17,
            child: const _ProfileTextAndActions(),
          ),
        ],
      ),
    );
  }
}

class _ProfileTextAndActions extends StatelessWidget {
  const _ProfileTextAndActions();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          'Yaron Fanger',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.w800,
            letterSpacing: 0.3,
          ),
        ),
        const SizedBox(height: 4),
        const Text(
          'Ux Designer & Developer',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFFE7E7E7),
            fontSize: 14,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.3,
          ),
        ),
        const SizedBox(height: 17),
        SizedBox(
          width: 150,
          height: 40,
          child: FilledButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Thanks for reaching out!')),
              );
            },
            style: FilledButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              elevation: 0,
              shape: const RoundedRectangleBorder(),
            ),
            child: const Text(
              'H I R E  M E',
              style: TextStyle(fontSize: 11, fontWeight: FontWeight.w700),
            ),
          ),
        ),
        const SizedBox(height: 15),
        const _SocialLinks(),
      ],
    );
  }
}

class _SocialLinks extends StatelessWidget {
  const _SocialLinks();

  @override
  Widget build(BuildContext context) {
    const iconStyle = IconThemeData(color: Colors.white, size: 17);

    return IconTheme(
      data: iconStyle,
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.alternate_email),
          SizedBox(width: 19),
          Icon(Icons.facebook),
          SizedBox(width: 19),
          Icon(Icons.camera_alt_outlined),
          SizedBox(width: 19),
          Icon(Icons.sports_basketball_outlined),
          SizedBox(width: 19),
          Text(
            'Be',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w900),
          ),
        ],
      ),
    );
  }
}

class _PortraitCrop extends StatelessWidget {
  const _PortraitCrop();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final portraitSize = math.min(
          constraints.maxWidth * 0.78,
          constraints.maxHeight * 0.92,
        );

        return Stack(
          children: [
            const Positioned.fill(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xFF333333), Color(0xFF111111)],
                  ),
                ),
              ),
            ),
            Positioned(
              top: constraints.maxHeight * 0.06,
              left: (constraints.maxWidth - portraitSize) / 2,
              child: Container(
                width: portraitSize,
                height: portraitSize,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [Color(0xFF606060), Color(0xFF242424)],
                  ),
                ),
                child: Icon(
                  Icons.person_rounded,
                  size: portraitSize * 0.78,
                  color: const Color(0xFFCACACA),
                ),
              ),
            ),
            Positioned(
              left: constraints.maxWidth * 0.14,
              right: constraints.maxWidth * 0.14,
              bottom: constraints.maxHeight * 0.025,
              child: const Divider(color: Color(0x66888888), height: 1),
            ),
          ],
        );
      },
    );
  }
}

class _PortfolioDetails extends StatelessWidget {
  const _PortfolioDetails();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(34)),
      ),
      padding: const EdgeInsets.fromLTRB(22, 22, 22, 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _StatisticsRow(),
          const SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Expanded(
                child: Text(
                  'Specialized In',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 19,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  foregroundColor: Colors.black,
                  padding: EdgeInsets.zero,
                  minimumSize: Size.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: const Text(
                  'View All',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const _SpecialtiesGrid(),
        ],
      ),
    );
  }
}

class _StatisticsRow extends StatelessWidget {
  const _StatisticsRow();

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        _Statistic(value: '42', label: 'Projects'),
        _Statistic(value: '712', label: 'Clients'),
        _Statistic(value: '92', label: 'Messages'),
      ],
    );
  }
}

class _Statistic extends StatelessWidget {
  const _Statistic({required this.value, required this.label});

  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              value,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(width: 5),
            Text(
              label,
              style: const TextStyle(
                color: Color(0xFF777777),
                fontSize: 10,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SpecialtiesGrid extends StatelessWidget {
  const _SpecialtiesGrid();

  static const List<_Service> _services = [
    _Service(title: 'Concepting', icon: Icons.lightbulb_outline),
    _Service(title: 'UI & UX', icon: Icons.phone_android),
    _Service(title: 'Visual Design', icon: Icons.palette_outlined),
    _Service(title: 'Interaction', icon: Icons.touch_app_outlined),
    _Service(title: 'Analysis', icon: Icons.query_stats),
    _Service(title: 'Client Management', icon: Icons.people_outline),
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: _services.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        mainAxisExtent: 126,
      ),
      itemBuilder: (context, index) {
        final service = _services[index];
        return _ServiceCard(service: service);
      },
    );
  }
}

class _Service {
  const _Service({required this.title, required this.icon});

  final String title;
  final IconData icon;
}

class _ServiceCard extends StatelessWidget {
  const _ServiceCard({required this.service});

  final _Service service;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(18),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(service.icon, color: Colors.white, size: 31),
          const SizedBox(height: 10),
          Text(
            service.title,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 11,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
