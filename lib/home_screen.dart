import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:state_provider_riverpod/slider_provider.dart';


class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});


  @override
  Widget build(BuildContext context, ref) {
    final slider = ref.watch(sliderProvider);
    log('Full Build');
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Riverpod Test",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              color: Colors.white,
              fontSize: 25,
            ),
          ),
        ),
        backgroundColor: Colors.lightBlue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Consumer(
                  builder: (BuildContext context, WidgetRef ref, Widget? child) {
                    log('Red Container');
                    Container(
                      height: 50,
                      width: 50,
                      color: Colors.red..withOpacity(50),
                    );
                  },
                ),
              ],),

            Slider(value: slider.slider, onChanged: (value){}),
            Consumer(
              builder: (BuildContext context, WidgetRef ref, Widget? child) {
                log('message3');
                final toggleSwitch = ref.watch(switchProvider);
                return Switch(value: toggleSwitch, onChanged: (value){
                  ref.read(switchProvider.notifier).state = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}


